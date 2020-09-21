{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Signable.Class
  ( -- * Key
    PubKey,
    PrvKey,
    importPubKeyRaw,
    importPubKeyPem,
    derivePubKey,
    importPrvKeyRaw,
    importPrvKeyPem,
    newRandomPrvKey,

    -- * Sha256
    Sha256 (..),

    -- * Signature
    Sig,
    importSigDer,
    exportSigDer,

    -- * Class
    Signable (..),

    -- * Misc
    Alg (..),
    SE (..),
  )
where

import qualified Crypto.Secp256k1 as C
import Data.ASN1.BinaryEncoding
import Data.ASN1.BitArray
import Data.ASN1.Encoding
import Data.ASN1.Prim
import qualified Data.Binary as B
import qualified Data.ByteArray as BA
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import Data.Foldable (foldr)
import Data.PEM
import Data.Signable.Import hiding (foldr, show)
import qualified Data.Text.Encoding as T
import Prelude (show)

data Alg = AlgSecp256k1
  deriving (Show)

data SE
  = InvalidPem
  | TooFewPemChunks
  | TooManyPemChunks
  | InvalidAsn1
  | TooFewAsn1Chunks
  | TooManyAsn1Chunks
  | InvalidPubKeyRaw
  | InvalidPrvKeyRaw
  deriving (Show)

newtype PubKey = PubKeySecp256k1 C.PubKey

newtype PrvKey = PrvKeySecp256k1 C.SecKey

newtype Sha256 = Sha256 ByteString

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

importPubKeyPem :: Alg -> ByteString -> Either SE PubKey
importPubKeyPem AlgSecp256k1 x0 =
  case parsePEM x0
    >>= parseASN1 (\case BitString (BitArray _ x) -> [x]; _ -> []) of
    Left e -> Left e
    Right x ->
      case importPubKeyRaw AlgSecp256k1 x of
        Nothing -> Left InvalidPubKeyRaw
        Just k -> Right k

derivePubKey :: PrvKey -> PubKey
derivePubKey (PrvKeySecp256k1 x) = PubKeySecp256k1 $ C.derivePubKey x

importPrvKeyRaw :: Alg -> ByteString -> Maybe PrvKey
importPrvKeyRaw AlgSecp256k1 = (PrvKeySecp256k1 <$>) . C.secKey

importPrvKeyPem :: Alg -> ByteString -> Either SE PrvKey
importPrvKeyPem AlgSecp256k1 x0 =
  case parsePEM x0
    >>= parseASN1 (\case OctetString x -> [x]; _ -> []) of
    Left e -> Left e
    Right x ->
      case importPrvKeyRaw AlgSecp256k1 x of
        Nothing -> Left InvalidPrvKeyRaw
        Just k -> Right k

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
importSigDer AlgSecp256k1 =
  (SigSecp256k1 . (\x -> fromMaybe x $ C.normalizeSig x) <$>) . C.importSig

exportSigDer :: Sig -> ByteString
exportSigDer (SigSecp256k1 x) = C.exportSig x

parsePEM :: ByteString -> Either SE PEM
parsePEM x0 =
  case pemParseBS x0 of
    Left _ -> Left InvalidPem
    Right [] -> Left TooFewPemChunks
    Right [x] -> Right x
    Right _ -> Left TooManyPemChunks

parseASN1 :: (ASN1 -> [ByteString]) -> PEM -> Either SE ByteString
parseASN1 f p = do
  xs0 <-
    first (const InvalidAsn1) $
      decodeASN1 DER (BL.fromStrict $ pemContent p)
  case xs0 >>= f of
    [] -> Left TooFewAsn1Chunks
    [x] -> Right x
    _ -> Left TooManyAsn1Chunks

class Signable a where
  toBinary :: a -> BL.ByteString
  toSha256 :: a -> Sha256
  toSha256 =
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
      . toSha256
  verify :: PubKey -> Sig -> a -> Bool
  verify (PubKeySecp256k1 k) (SigSecp256k1 s) =
    maybe False (C.verifySig k s)
      . C.msg
      . coerce
      . toSha256

instance Signable ByteString where
  toBinary = BL.drop 8 . B.encode

instance Signable BL.ByteString where
  toBinary = toBinary . BL.toStrict

instance Signable Int32 where
  toBinary = B.encode

instance Signable Int64 where
  toBinary = B.encode

instance Signable Word32 where
  toBinary = B.encode

instance Signable Word64 where
  toBinary = B.encode

instance Signable Double where
  toBinary = B.encode

instance Signable Float where
  toBinary = B.encode

instance Signable Bool where
  toBinary = B.encode

instance Signable Text where
  toBinary = toBinary . T.encodeUtf8

instance (Foldable f, Signable a) => Signable (f a) where
  toBinary = foldr (\x acc -> toBinary x <> acc) mempty
