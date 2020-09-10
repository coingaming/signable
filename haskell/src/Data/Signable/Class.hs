{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Signable.Class
  ( -- * Key
    PubKey,
    PrvKey,
    importPubKey,
    derivePubKey,
    importPrvKey,
    newRandomPrvKey,

    -- * Hash
    Hash,

    -- * Signature
    Sig,

    -- ** DER
    importSig,
    exportSig,

    -- * Class
    Signable (..),
  )
where

import qualified Crypto.Secp256k1 as C
import qualified Data.Binary as B
import qualified Data.ByteArray as BA
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import Data.Foldable (foldr)
import Data.Signable.Import hiding (foldr)

newtype PubKey = PubKeySecp256k1 C.PubKey

newtype PrvKey = PrvKeySecp256k1 C.SecKey

newtype Hash = Sha256 ByteString

newtype Sig
  = SigSecp256k1 C.Sig
  deriving newtype (Eq)

--
-- TODO : add KeyKind argument later
-- when we will have more algorithms
--
importPubKey :: ByteString -> Maybe PubKey
importPubKey = (PubKeySecp256k1 <$>) . C.importPubKey

derivePubKey :: PrvKey -> PubKey
derivePubKey (PrvKeySecp256k1 x) = PubKeySecp256k1 $ C.derivePubKey x

importPrvKey :: ByteString -> Maybe PrvKey
importPrvKey = (PrvKeySecp256k1 <$>) . C.secKey

newRandomPrvKey :: (MonadIO m, MonadFail m) => m PrvKey
newRandomPrvKey = do
  r <- liftIO $ getRandomBytes 32
  case importPrvKey r of
    -- it's bad practice to fail
    -- in IO but in this case it
    -- should never happen in reality
    Nothing -> fail "BAD_PRV_KEY"
    Just x -> return x

importSig :: ByteString -> Maybe Sig
importSig = (SigSecp256k1 <$>) . C.importSig

exportSig :: Sig -> ByteString
exportSig (SigSecp256k1 x) = C.exportSig x

class Signable a where
  toBinary :: a -> BL.ByteString
  toHash :: a -> Hash
  toHash =
    Sha256
      . BS.pack
      . BA.unpack
      . (hashlazy :: BL.ByteString -> Digest SHA256)
      . toBinary
  sign :: PrvKey -> a -> Maybe Sig
  sign (PrvKeySecp256k1 k) =
    (SigSecp256k1 . C.signMsg k <$>)
      . C.msg
      . coerce
      . toHash
  verify :: PubKey -> Sig -> a -> Bool
  verify (PubKeySecp256k1 k) (SigSecp256k1 s) =
    maybe False (C.verifySig k s)
      . C.msg
      . coerce
      . toHash

instance Signable ByteString where
  toBinary = B.encode

instance Signable Int64 where
  toBinary = B.encode

instance Signable Double where
  toBinary = B.encode

instance Signable Float where
  toBinary = B.encode

instance Signable Int32 where
  toBinary = B.encode

instance Signable Word32 where
  toBinary = B.encode

instance Signable Word64 where
  toBinary = B.encode

instance Signable Bool where
  toBinary = B.encode

instance Signable Text where
  toBinary = B.encode

instance (Foldable f, Signable a) => Signable (f a) where
  toBinary = foldr (\x acc -> toBinary x <> acc) mempty
