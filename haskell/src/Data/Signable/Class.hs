{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Signable.Class
  ( -- * Key
    PubKey,
    PrvKey,
    importPubKeyDer,
    importPubKeyPem,
    exportPubKeyDer,
    derivePubKey,
    importPrvKeyRaw,
    importPrvKeyPem,
    exportPrvKeyRaw,
    newRandomPrvKey,

    -- * Signature
    Sig,
    sign,
    verify,
    importSigDer,
    exportSigDer,

    -- * Class
    Signable (..),

    -- * Util
    pubKey2Alg,
    prvKey2Alg,
    sig2Alg,

    -- * Misc
    Alg (..),
    SignableError (..),
    ECPointFormat (..),
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
  deriving (Eq, Ord, Show, Generic)

data SignableError
  = InvalidPem
  | TooFewPemChunks
  | TooManyPemChunks
  | InvalidAsn1
  | TooFewAsn1Chunks
  | TooManyAsn1Chunks
  | InvalidPubKeyDer
  | InvalidPrvKeyRaw
  deriving (Eq, Ord, Show, Generic)

data ECPointFormat
  = ECPointCompressed
  | ECPointUncompressed
  | ECPointExtended
  deriving (Eq, Ord, Show, Generic)

newtype PubKey
  = PubKeySecp256k1 C.PubKey
  deriving (Eq, Show, Generic)

newtype PrvKey
  = PrvKeySecp256k1 C.SecKey
  deriving (Eq)

instance Show PrvKey where
  show = const "SECRET"

newtype Sha256
  = Sha256 ByteString
  deriving (Eq, Ord, Show, Generic)

newtype Sig
  = SigSecp256k1 C.Sig
  deriving (Eq, Show, Generic)

pubKey2Alg :: PubKey -> Alg
pubKey2Alg (PubKeySecp256k1 _) = AlgSecp256k1

prvKey2Alg :: PrvKey -> Alg
prvKey2Alg (PrvKeySecp256k1 _) = AlgSecp256k1

sig2Alg :: Sig -> Alg
sig2Alg (SigSecp256k1 _) = AlgSecp256k1

importPubKeyDer :: Alg -> ByteString -> Maybe PubKey
importPubKeyDer AlgSecp256k1 x
  | null x = Nothing
  | otherwise = PubKeySecp256k1 <$> C.importPubKey x

importPubKeyPem :: Alg -> ByteString -> Either SignableError PubKey
importPubKeyPem AlgSecp256k1 x0 =
  case parsePEM x0
    >>= parseASN1 (\case BitString (BitArray _ x) -> [x]; _ -> []) of
    Left e -> Left e
    Right x ->
      case importPubKeyDer AlgSecp256k1 x of
        Nothing -> Left InvalidPubKeyDer
        Just k -> Right k

exportPubKeyDer :: ECPointFormat -> PubKey -> ByteString
exportPubKeyDer f k@(PubKeySecp256k1 x) =
  if f == ECPointExtended
    then
      let raw = exportPubKeyDer ECPointUncompressed k
          asn1 =
            [ Start Sequence,
              Start Sequence,
              OID [1, 2, 840, 10045, 2, 1],
              OID [1, 3, 132, 0, 10],
              End Sequence,
              BitString
                -- 520 = 65 * 8 for uncompressed public key
                (BitArray 520 raw),
              End Sequence
            ]
       in BL.toStrict $ encodeASN1 DER asn1
    else C.exportPubKey (f == ECPointCompressed) x

derivePubKey :: PrvKey -> PubKey
derivePubKey (PrvKeySecp256k1 x) = PubKeySecp256k1 $ C.derivePubKey x

importPrvKeyRaw :: Alg -> ByteString -> Maybe PrvKey
importPrvKeyRaw AlgSecp256k1 x
  | null x = Nothing
  | otherwise = PrvKeySecp256k1 <$> C.secKey x

importPrvKeyPem :: Alg -> ByteString -> Either SignableError PrvKey
importPrvKeyPem AlgSecp256k1 x0 =
  case parsePEM x0
    >>= parseASN1 (\case OctetString x -> [x]; _ -> []) of
    Left e -> Left e
    Right x ->
      case importPrvKeyRaw AlgSecp256k1 x of
        Nothing -> Left InvalidPrvKeyRaw
        Just k -> Right k

exportPrvKeyRaw :: PrvKey -> ByteString
exportPrvKeyRaw (PrvKeySecp256k1 x) = C.getSecKey x

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
importSigDer AlgSecp256k1 raw
  | null raw = Nothing
  | otherwise = SigSecp256k1 . (\x -> fromMaybe x $ C.normalizeSig x) <$> C.importSig raw

exportSigDer :: Sig -> ByteString
exportSigDer (SigSecp256k1 x) = C.exportSig x

parsePEM :: ByteString -> Either SignableError PEM
parsePEM x0 =
  case pemParseBS x0 of
    Left _ -> Left InvalidPem
    Right [] -> Left TooFewPemChunks
    Right [x] -> Right x
    Right _ -> Left TooManyPemChunks

parseASN1 :: (ASN1 -> [ByteString]) -> PEM -> Either SignableError ByteString
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

toSha256 :: Signable a => a -> Sha256
toSha256 =
  Sha256
    . BS.pack
    . BA.unpack
    . (hashlazy :: BL.ByteString -> Digest SHA256)
    . toBinary

sign :: Signable a => PrvKey -> a -> Sig
sign (PrvKeySecp256k1 k) x0 =
  case C.msg . coerce $ toSha256 x0 of
    Just x -> SigSecp256k1 $ C.signMsg k x
    Nothing -> error "SECP256K1_MSG_CONS_IMPOSSIBLE_FAILURE"

verify :: Signable a => PubKey -> Sig -> a -> Bool
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
