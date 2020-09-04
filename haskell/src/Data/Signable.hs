{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Data.Signable
  ( -- * Type
    Encrypted (..),

    -- * Class
    Signable (..),
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

newtype Encrypted b e a = Encrypted b
  deriving (PersistField, PersistFieldSql)

class Signable b e a where
  encrypt :: (BlockCipher c) => c -> IV c -> a -> Encrypted b e a
  decrypt :: (BlockCipher c) => c -> IV c -> Encrypted b e a -> Either e a

class Encryptor m where
  encryptM :: (Signable b e a) => a -> m (Encrypted b e a)
  decryptM :: (Signable b e a) => Encrypted b e a -> m (Either e a)

instance Signable ByteString e ByteString where
  encrypt c i = Encrypted . ctrCombine c i
  decrypt c i = Right . ctrCombine c i . coerce

instance Signable ByteString e BL.ByteString where
  encrypt c i = reType . encrypt c i . BL.toStrict
  decrypt c i = second BL.fromStrict . decrypt c i . reType

instance Signable ByteString UnicodeException Text where
  encrypt c i = reType . encrypt c i . TE.encodeUtf8
  decrypt c i x = decrypt c i (reType x) >>= TE.decodeUtf8'

instance Signable ByteString UnicodeException TL.Text where
  encrypt c i = reType . encrypt c i . TL.toStrict
  decrypt c i = second TL.fromStrict . decrypt c i . reType

instance (Traversable f, Signable b e a) => Signable (f b) e (f a) where
  encrypt c i =
    Encrypted . ((coerce . (encrypt c i :: a -> Encrypted b e a) :: a -> b) <$>)
  decrypt c i xs =
    mapM (decrypt c i . Encrypted) (coerce xs :: f b)

reType :: Encrypted b e a -> Encrypted b e c
reType = Encrypted . coerce
