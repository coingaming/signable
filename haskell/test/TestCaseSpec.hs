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
import qualified Data.ByteString as BS
--import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Base64 as B64
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as Map
import Data.PEM
import Data.ProtoLens
import Data.ProtoLens.Arbitrary
import Data.Signable
import Data.Signable.Import
import qualified Data.Text as T
import Proto.Basic
import Proto.Coins
import Proto.Number
import Proto.SignableOrphan ()
import Proto.Text
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = before readEnv $ do
  --it "openssl hex" $ \env -> do
  --  let pub = envPubKey env
  --  m <- b16decode "0000000100000000000000c800000002000000010000000000000032000000020000000100000001000000030000000100000004010000000561620000000600000000000000640000000700000008"
  --  s0 <- b16decode "3046022100bce8c72730084060ff3ae5f39af3bd6e95376752cedff1d74744f5045fd38533022100fc516da299706187212844ccbf8c42a0589110778ba90bd71b378a4530fb637a"
  --  s <- case importSigDer AlgSecp256k1 s0 of
  --    Just x -> return x
  --    Nothing -> fail "INVALID_SIG"
  --  verify pub s m `shouldBe` True
  it "generates haskell-testcases.json" $ \env -> do
    let prv = envPrvKey env
    tcs <-
      generate $
        concat
          <$> mapM
            (\i -> mapM (genTestCase prv i) [minBound .. maxBound])
            [1 .. 1000]
    writeEnv $ env {envTCS = tcs}
    True `shouldBe` True
  it "complies testcases.json" $ \env -> do
    let pub = envPubKey env
    mapM_
      ( \tc -> do
          let t = tcProtoType tc
          let x = coerce $ tcProtoBin tc
          s <- case importSigDer AlgSecp256k1 . coerce $ tcSignatureBin tc of
            Just s0 -> return s0
            Nothing -> fail "INVALID_SIG"
          putStrLn $ tcDescription tc
          (BS.unpack . exportSigDer $ s)
            `shouldBe` (BS.unpack . coerce $ tcSignatureBin tc)
          (BL.unpack <$> serializer t x)
            `shouldBe` (Right . BL.unpack . coerce $ tcSignableBin tc)
          verifier pub s t x
            `shouldBe` Right True
      )
      $ envTCS env
  where
    --b16decode x =
    --  case B16.decode x of
    --    (v, "") -> return v
    --    _ -> fail "INVALID_HEX"
    serializer = \case
      Basic'Payload ->
        ((toBinary :: Proto.Basic.Payload -> BL.ByteString) <$>) . decodeMessage
      Text'Payload ->
        ((toBinary :: Proto.Text.Payload -> BL.ByteString) <$>) . decodeMessage
      Number'Payload ->
        ((toBinary :: Proto.Number.Payload -> BL.ByteString) <$>) . decodeMessage
      Coins'Request ->
        ((toBinary :: Proto.Coins.Request -> BL.ByteString) <$>) . decodeMessage
    verifier pub s = \case
      Basic'Payload ->
        ((verify pub s :: Proto.Basic.Payload -> Bool) <$>) . decodeMessage
      Text'Payload ->
        ((verify pub s :: Proto.Text.Payload -> Bool) <$>) . decodeMessage
      Number'Payload ->
        ((verify pub s :: Proto.Number.Payload -> Bool) <$>) . decodeMessage
      Coins'Request ->
        ((verify pub s :: Proto.Coins.Request -> Bool) <$>) . decodeMessage

genTestCase :: PrvKey -> Int -> ProtoType -> Gen TestCase
genTestCase prv i t =
  case t of
    Basic'Payload -> do
      x <-
        unArbitraryMessage
          <$> (arbitrary :: Gen (ArbitraryMessage Proto.Basic.Payload))
      let pb = encodeMessage x
      let sb = toBinary x
      sig <- case exportSigDer <$> sign prv x of
        Nothing -> error "SIGNATURE_FAILURE"
        Just s -> return s
      return $
        TestCase
          { tcProtoType = t,
            tcProtoBin = ProtoBin pb,
            tcSignableBin = SignableBin sb,
            tcSignatureBin = SignatureBin sig,
            tcDescription = show t <> "-" <> show i
          }
    Text'Payload -> do
      x <-
        unArbitraryMessage
          <$> (arbitrary :: Gen (ArbitraryMessage Proto.Text.Payload))
      let pb = encodeMessage x
      let sb = toBinary x
      sig <- case exportSigDer <$> sign prv x of
        Nothing -> error "SIGNATURE_FAILURE"
        Just s -> return s
      return $
        TestCase
          { tcProtoType = t,
            tcProtoBin = ProtoBin pb,
            tcSignableBin = SignableBin sb,
            tcSignatureBin = SignatureBin sig,
            tcDescription = show t <> "-" <> show i
          }
    Number'Payload -> do
      x <-
        unArbitraryMessage
          <$> (arbitrary :: Gen (ArbitraryMessage Proto.Number.Payload))
      let pb = encodeMessage x
      let sb = toBinary x
      sig <- case exportSigDer <$> sign prv x of
        Nothing -> error "SIGNATURE_FAILURE"
        Just s -> return s
      return $
        TestCase
          { tcProtoType = t,
            tcProtoBin = ProtoBin pb,
            tcSignableBin = SignableBin sb,
            tcSignatureBin = SignatureBin sig,
            tcDescription = show t <> "-" <> show i
          }
    Coins'Request -> do
      x <-
        unArbitraryMessage
          <$> (arbitrary :: Gen (ArbitraryMessage Proto.Coins.Request))
      let pb = encodeMessage x
      let sb = toBinary x
      sig <- case exportSigDer <$> sign prv x of
        Nothing -> error "SIGNATURE_FAILURE"
        Just s -> return s
      return $
        TestCase
          { tcProtoType = t,
            tcProtoBin = ProtoBin pb,
            tcSignableBin = SignableBin sb,
            tcSignatureBin = SignatureBin sig,
            tcDescription = show t <> "-" <> show i
          }

data Env
  = Env
      { envPrvKey :: PrvKey,
        envPubKey :: PubKey,
        envTCS :: [TestCase],
        envRaw :: Map.HashMap Text Value
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
  = Basic'Payload
  | Text'Payload
  | Number'Payload
  | Coins'Request
  deriving (Show, Read, Enum, Bounded)

newtype ProtoBin = ProtoBin ByteString

newtype SignableBin = SignableBin BL.ByteString

newtype SignatureBin = SignatureBin ByteString

instance FromJSON Env where
  parseJSON = withObject "Env" $ \x ->
    Env
      <$> x .: "private_key_pem"
      <*> x .: "public_key_pem"
      <*> x .: "testcases"
      <*> pure x

instance ToJSON Env where
  --
  -- TODO : fix this workaround later
  -- when PEM-encoding of haskell-generated
  -- keys will be available
  --
  toJSON x =
    Object $
      Map.insert
        "testcases"
        (toJSON $ envTCS x)
        (envRaw x)

instance FromJSON TestCase where
  parseJSON = withObject "TestCase" $ \x ->
    TestCase
      <$> x .: "proto_message_type"
      <*> x .: "proto_serialized_b64"
      <*> x .: "signable_serialized_b64"
      <*> x .: "signable_signature_b64"
      <*> x .: "test_description"

instance ToJSON TestCase where
  toJSON x =
    Object $
      Map.fromList
        [ ("proto_message_type", toJSON $ tcProtoType x),
          ("proto_serialized_b64", toJSON $ tcProtoBin x),
          ("signable_serialized_b64", toJSON $ tcSignableBin x),
          ("signable_signature_b64", toJSON $ tcSignatureBin x),
          ("test_description", toJSON $ tcDescription x)
        ]

instance FromJSON PrvKey where
  parseJSON = withText "PrvKey" $ \x0 ->
    case parsePEM x0
      >>= parseASN1 (\case OctetString x -> [x]; _ -> []) of
      Left e -> fail e
      Right x ->
        case importPrvKeyRaw AlgSecp256k1 x of
          Nothing -> fail "INVALID_PRV_PEM"
          Just k -> return k

instance FromJSON PubKey where
  parseJSON = withText "PubKey" $ \x0 ->
    case parsePEM x0
      >>= parseASN1 (\case BitString (BitArray _ x) -> [x]; _ -> []) of
      Left e -> fail e
      Right x ->
        case importPubKeyRaw AlgSecp256k1 x of
          Nothing -> fail "INVALID_PUB_PEM"
          Just k -> return k

instance FromJSON ProtoType where
  parseJSON = withText "ProtoType" $ \x0 ->
    case readMaybe . T.unpack $ T.replace "." "'" x0 of
      Just x -> return x
      Nothing -> fail "INVALID_PROTO_TYPE"

instance ToJSON ProtoType where
  toJSON = String . T.replace "'" "." . show

instance FromJSON ProtoBin where
  parseJSON = (ProtoBin <$>) . parseB64

instance ToJSON ProtoBin where
  toJSON = encodeB64 . coerce

instance FromJSON SignableBin where
  parseJSON = (SignableBin . BL.fromStrict <$>) . parseB64

instance ToJSON SignableBin where
  toJSON = encodeB64 . BL.toStrict . coerce

instance FromJSON SignatureBin where
  parseJSON = (SignatureBin <$>) . parseB64

instance ToJSON SignatureBin where
  toJSON = encodeB64 . coerce

readEnv :: IO Env
readEnv = do
  !f <- readFile "test/Support/testcases.json"
  case eitherDecode $ encodeUtf8 f of
    Left e -> fail e
    Right x -> return x

writeEnv :: Env -> IO ()
writeEnv =
  writeFile "test/Support/haskell-testcases.json"
    . decodeUtf8
    . encode

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

encodeB64 :: ByteString -> Value
encodeB64 = String . decodeUtf8 . B64.encode
