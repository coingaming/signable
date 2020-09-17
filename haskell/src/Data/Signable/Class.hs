{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Signable.Class
  ( -- * Key
    PubKey,
    PrvKey,
    importPubKeyRaw,
    derivePubKey,
    importPrvKeyRaw,
    newRandomPrvKey,

    -- * Hash
    Hash,

    -- * Signature
    Sig,
    importSigDer,
    exportSigDer,

    -- * Class
    Signable (..),

    -- * Misc
    Alg (..),
  )
where

import qualified Crypto.Secp256k1 as C
import qualified Data.Binary as B
import qualified Data.ByteArray as BA
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import Data.Foldable (foldr)
import Data.Signable.Import hiding (foldr, show)
import qualified Data.Text.Encoding as T
import Prelude (show)

data Alg = AlgSecp256k1
  deriving (Show)

newtype PubKey = PubKeySecp256k1 C.PubKey

newtype PrvKey = PrvKeySecp256k1 C.SecKey

newtype Hash = Sha256 ByteString

newtype Sig
  = SigSecp256k1 C.Sig
  deriving newtype (Eq)

instance Show Sig where
  show = const "SECRET"

--
-- TODO : add KeyKind argument later
-- when we will have more algorithms
--
importPubKeyRaw :: Alg -> ByteString -> Maybe PubKey
importPubKeyRaw AlgSecp256k1 = (PubKeySecp256k1 <$>) . C.importPubKey

derivePubKey :: PrvKey -> PubKey
derivePubKey (PrvKeySecp256k1 x) = PubKeySecp256k1 $ C.derivePubKey x

importPrvKeyRaw :: Alg -> ByteString -> Maybe PrvKey
importPrvKeyRaw AlgSecp256k1 = (PrvKeySecp256k1 <$>) . C.secKey

newRandomPrvKey :: (MonadIO m, MonadFail m) => Alg -> m PrvKey
newRandomPrvKey AlgSecp256k1 = do
  r <- liftIO $ getRandomBytes 32
  case importPrvKeyRaw AlgSecp256k1 r of
    -- it's bad practice to fail
    -- in IO but in this case it
    -- should never happen in reality
    Nothing -> fail "BAD_PRV_KEY"
    Just x -> return x

importSigDer :: Alg -> ByteString -> Maybe Sig
importSigDer AlgSecp256k1 = (SigSecp256k1 <$>) . C.importSig

exportSigDer :: Alg -> Sig -> ByteString
exportSigDer AlgSecp256k1 (SigSecp256k1 x) = C.exportSig x

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
  toBinary = BL.drop 8 . B.encode

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
  toBinary = toBinary . T.encodeUtf8

instance (Foldable f, Signable a) => Signable (f a) where
  toBinary = foldr (\x acc -> toBinary x <> acc) mempty
