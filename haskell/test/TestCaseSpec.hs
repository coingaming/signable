{-# LANGUAGE BangPatterns #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestCaseSpec
  ( spec,
    Env (..),
    TestCase (..),
  )
where

import Data.Aeson
import Data.Aeson.Types (Parser)
import qualified Data.ByteString.Base64 as B64
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as Map
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
import System.Directory (listDirectory)
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = before (readEnv "elixir.json") $ do
  it "generates haskell test case" $ \env -> do
    let prv = envPrvKey env
    tcs <-
      generate $
        concat
          <$> mapM
            (\i -> mapM (genTestCase prv i) [minBound .. maxBound])
            [1 .. 1000]
    let newEnv = env {envTCS = tcs}
    writeEnv newEnv
    testCasesSpec newEnv
  it "complies all test cases" $ \_ -> do
    xs <- listDirectory testCaseDir
    mapM_ (\x -> readEnv x >>= testCasesSpec) xs
  where
    testCasesSpec env = do
      let pub = envPubKey env
      mapM_
        ( \tc -> do
            let t = tcProtoType tc
            let x = coerce $ tcProtoBin tc
            s <- case importSigDer AlgSecp256k1 . coerce $ tcSignatureBin tc of
              Just s0 -> return s0
              Nothing -> fail "INVALID_SIG"
            --putStrLn $ tcDescription tc
            (BL.unpack <$> serializer t x)
              `shouldBe` (Right . BL.unpack . coerce $ tcSignableBin tc)
            verifier pub s t x
              `shouldBe` Right True
        )
        $ envTCS env
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
    case importPrvKeyPem AlgSecp256k1 . encodeUtf8 $ x0 of
      Left e -> fail $ show e
      Right x -> return x

instance FromJSON PubKey where
  parseJSON = withText "PubKey" $ \x0 ->
    case importPubKeyPem AlgSecp256k1 . encodeUtf8 $ x0 of
      Left e -> fail $ show e
      Right x -> return x

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

readEnv :: String -> IO Env
readEnv n = do
  !f <- readFile $ testCaseDir <> "/" <> n
  case eitherDecode $ encodeUtf8 f of
    Left e -> fail e
    Right x -> return x

testCaseDir :: String
testCaseDir = "test/Support/test-case"

writeEnv :: Env -> IO ()
writeEnv =
  writeFile (testCaseDir <> "/haskell-new.json")
    . decodeUtf8
    . encode

parseB64 :: Value -> Parser ByteString
parseB64 = withText "B64" $ \x0 ->
  case B64.decode $ encodeUtf8 x0 of
    Left e -> fail e
    Right x -> return x

encodeB64 :: ByteString -> Value
encodeB64 = String . decodeUtf8 . B64.encode
