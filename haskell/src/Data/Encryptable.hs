{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- | Data encryption is common security-related practice in
-- database usage. One of the negative side effects of encryption is
-- that typed data in its encrypted form becomes untyped and
-- usually exists in form of 'ByteString' or similar blind type.
-- Operations with untyped data are very error-prone and should be avoided.
-- This library proposes the way to fix it.
--
-- Let's have an example of @User@ sum type where his @Login@
-- is not sensitive type, but @Address@ is sensitive.
-- @Address@ should never be shown and should be stored only in
-- encrypted form.
--
-- @
-- newtype Login
--   = Login Text
--   deriving newtype (Eq, Arbitrary, Show, PersistField, PersistFieldSql)
--
-- newtype Address
--   = Address Text
--   deriving newtype (Eq, Arbitrary, Encryptable ByteString UnicodeException)
--
-- instance Show Address where
--   show = const \"SECRET\"
--
-- data User = User {login :: Login, address :: Address}
--   deriving (Eq, Generic, Show)
--
-- instance Arbitrary User where
--   arbitrary = genericArbitrary
--   shrink = genericShrink
-- @
--
-- Note how easy we derived @Encryptable ByteString UnicodeException@ class
-- instance for @Address@ type. @Address@ is newtype around 'Text' which already
-- have this instance - so we just got it for free. @GeneralizedNewtypeDeriving@
-- is a very powerful tool, indeed. Having this instance means that now we can
-- encrypt @Address@ to 'ByteString' form and decrypt back with possible
-- 'UnicodeException' error (because not every encrypted 'ByteString' represents
-- valid @Address@). You can find more details in 'Encrypted', 'Encryptable'
-- and 'Encryptor' documentation.
--
-- Now let's define @UserStorage@ type, representation of @User@
-- stored in database. We will use @Persistent@ library DSL for this.
--
-- @
-- share
--   [mkPersist sqlSettings]
--   [persistLowerCase|
--     UserStorage
--       login Login
--       address (Encrypted ByteString UnicodeException Address)
--       UniqueUserStorage login
--   |]
-- @
--
-- In spite of @address@ database table column type is still just @bytes@,
-- compiler knows that these bytes in reality are encrypted representation
-- of @Address@ value.
--
-- Just for fun let's implement class instance to encrypt @User@ value
-- into @UserStorage@ value.
--
-- @
-- instance Encryptable UserStorage UnicodeException User where
--   encrypt c i x = Encrypted $ UserStorage (login x) $ encrypt c i (address x)
--   decrypt c i x0 = do
--     let x = coerce x0
--     a <- decrypt c i $ userStorageAddress x
--     return $ User (userStorageLogin x) a
-- @
--
-- And then we can test property - @User@ can be encrypted into
-- @UserStorage@ form and decrypted back.
--
-- @
-- spec :: Spec
-- spec = before newEnv
--   $ it "UserStorage/User"
--   $ \env -> property $ \x -> do
--     let c = cipher env
--     let i = iv env
--     decrypt c i (encrypt c i x :: Encrypted UserStorage UnicodeException User)
--       \`shouldBe\` Right x
-- @
module Data.Encryptable
  ( -- * Type
    Encrypted (..),

    -- * Class
    Encryptable (..),
    Encryptor (..),

    -- * Utility
    reType,

    -- * Re-export
    CryptoFailable (..),
    BlockCipher,
    AES256,
    IV,
    cipherInit,
    makeIV,
    getRandomBytes,
  )
where

import Crypto.Cipher.AES (AES256)
import Crypto.Cipher.Types (BlockCipher, IV, cipherInit, ctrCombine, makeIV)
import Crypto.Error (CryptoFailable (..))
import Crypto.Random (getRandomBytes)
import qualified Data.ByteString.Lazy as BL (ByteString, fromStrict, toStrict)
import Data.Coerce (coerce)
import qualified Data.Text.Encoding as TE (decodeUtf8', encodeUtf8)
import qualified Data.Text.Lazy as TL (Text, fromStrict, toStrict)
import Database.Esqueleto (PersistField, PersistFieldSql)
import Universum

-- | Value of this type represents
-- value of type __a__ (phantom) encrypted in form of
-- value of type __b__ (non-phantom) which can cause
-- error of type __e__ (phantom) in case where
-- __a__ constructor fails after decryption.
-- This design promotes usage of smart constructors.
newtype Encrypted b e a = Encrypted b
  deriving (PersistField, PersistFieldSql)

-- | Class represents the idea of
-- typed symmetric encryption and decryption
class Encryptable b e a where
  encrypt :: (BlockCipher c) => c -> IV c -> a -> Encrypted b e a
  decrypt :: (BlockCipher c) => c -> IV c -> Encrypted b e a -> Either e a

-- | Class represents one particular case of 'Encryptable'
-- where 'BlockCipher' and 'IV' (initial vector) are
-- hidden inside __m__ which often is
-- some sort of "application" monad which implements
-- this 'Encryptor' class. Promotes finally tagless style.
class Encryptor m where
  encryptM :: (Encryptable b e a) => a -> m (Encrypted b e a)
  decryptM :: (Encryptable b e a) => Encrypted b e a -> m (Either e a)

instance Encryptable ByteString e ByteString where
  encrypt c i = Encrypted . ctrCombine c i
  decrypt c i = Right . ctrCombine c i . coerce

instance Encryptable ByteString e BL.ByteString where
  encrypt c i = reType . encrypt c i . BL.toStrict
  decrypt c i = second BL.fromStrict . decrypt c i . reType

instance Encryptable ByteString UnicodeException Text where
  encrypt c i = reType . encrypt c i . TE.encodeUtf8
  decrypt c i x = decrypt c i (reType x) >>= TE.decodeUtf8'

instance Encryptable ByteString UnicodeException TL.Text where
  encrypt c i = reType . encrypt c i . TL.toStrict
  decrypt c i = second TL.fromStrict . decrypt c i . reType

instance (Traversable f, Encryptable b e a) => Encryptable (f b) e (f a) where
  encrypt c i =
    Encrypted . ((coerce . (encrypt c i :: a -> Encrypted b e a) :: a -> b) <$>)
  decrypt c i xs =
    mapM (decrypt c i . Encrypted) (coerce xs :: f b)

-- | Casts original phantom type __a__ of 'Encrypted'
-- value to some other type __c__. Useful for building
-- 'Encryptable' instances on top of other already
-- existing 'Encryptable' instances.
reType :: Encrypted b e a -> Encrypted b e c
reType = Encrypted . coerce
