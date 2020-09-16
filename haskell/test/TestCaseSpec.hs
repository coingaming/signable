{-# LANGUAGE BangPatterns #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestCaseSpec
  ( spec,
    Env (..),
    TestCase (..),
  )
where

import Data.ASN1.BinaryEncoding
import Data.ASN1.BitArray
import Data.ASN1.Encoding
import Data.ASN1.Prim
import Data.Aeson
import Data.Aeson.Types (Parser)
import qualified Data.ByteString.Base64 as B64
import qualified Data.ByteString.Lazy as BL
import Data.PEM
import Data.Signable
import Data.Signable.Import
import qualified Data.Text as T
import Proto.SignableOrphan ()
import Test.Hspec
import TestOrphan ()

spec :: Spec
spec = before readEnv
  $ it "complies testcases.json"
  $ \_ -> do
    True `shouldBe` True

data Env
  = Env
      { envPrvKey :: PrvKey,
        envPubKey :: PubKey,
        envTCS :: [TestCase]
      }

data TestCase
  = TestCase
      { tcProtoType :: ProtoType,
        tcProtoBin :: ProtoBin,
        tcSignableBin :: SignableBin,
        tcSignatureBin :: SignatureBin,
        tcDescription :: Text
      }

data ProtoType
  = BasicPayload
  | TextPayload
  | NumberPayload
  | CoinsRequest
  deriving (Read)

newtype ProtoBin = ProtoBin ByteString

newtype SignableBin = SignableBin ByteString

newtype SignatureBin = SignatureBin ByteString

instance FromJSON Env where
  parseJSON = withObject "Env" $ \x ->
    Env
      <$> x .: "private_key_pem"
      <*> x .: "public_key_pem"
      <*> x .: "testcases"

instance FromJSON TestCase where
  parseJSON = withObject "TestCase" $ \x ->
    TestCase
      <$> x .: "proto_message_type"
      <*> x .: "proto_serialized_b64"
      <*> x .: "signable_serialized_b64"
      <*> x .: "signable_signature_b64"
      <*> x .: "test_description"

instance FromJSON PrvKey where
  parseJSON = withText "PrvKey" $ \x0 ->
    case parsePEM x0
      >>= parseASN1 (\case OctetString x -> [x]; _ -> []) of
      Left e -> fail e
      Right x ->
        case importPrvKey x of
          Nothing -> fail "INVALID_PRV_PEM"
          Just k -> return k

instance FromJSON PubKey where
  parseJSON = withText "PubKey" $ \x0 ->
    case parsePEM x0
      >>= parseASN1 (\case BitString (BitArray _ x) -> [x]; _ -> []) of
      Left e -> fail e
      Right x ->
        case importPubKey x of
          Nothing -> fail "INVALID_PUB_PEM"
          Just k -> return k

instance FromJSON ProtoType where
  parseJSON = withText "ProtoType" $ \x0 ->
    case readMaybe . T.unpack $ T.replace "." "" x0 of
      Just x -> return x
      Nothing -> fail "INVALID_PROTO_TYPE"

instance FromJSON ProtoBin where
  parseJSON = (ProtoBin <$>) . parseB64

instance FromJSON SignableBin where
  parseJSON = (SignableBin <$>) . parseB64

instance FromJSON SignatureBin where
  parseJSON = (SignatureBin <$>) . parseB64

readEnv :: IO Env
readEnv = do
  !f <- readFile "test/Support/testcases.json"
  case eitherDecode $ encodeUtf8 f of
    Left e -> fail e
    Right x -> return x

parsePEM :: Text -> Either String PEM
parsePEM x0 =
  case pemParseBS $ encodeUtf8 x0 of
    Left _ -> Left "INVALID_PEM"
    Right [] -> Left "ZERO_PEM_CHUNKS"
    Right [p] -> Right p
    Right _ -> Left "TOO_MANY_PEM_CHUNKS"

parseASN1 :: (ASN1 -> [ByteString]) -> PEM -> Either String ByteString
parseASN1 f p = do
  xs0 <-
    first (const "INVALID_ASN1") $
      decodeASN1 DER (BL.fromStrict $ pemContent p)
  case xs0 >>= f of
    [] -> Left "ZERO_ASN1_CHUNKS"
    [x] -> Right x
    _ -> Left "TOO_MANY_ASN1_CHUNKS"

parseB64 :: Value -> Parser ByteString
parseB64 = withText "B64" $ \x0 ->
  case B64.decode $ encodeUtf8 x0 of
    Left e -> fail e
    Right x -> return x
