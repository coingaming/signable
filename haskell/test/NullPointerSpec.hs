module NullPointerSpec
  ( spec,
  )
where

import qualified Data.ByteString as BS
import Data.Signable
import Data.Signable.Import
import Test.Hspec

--
-- Tests related to
-- https://github.com/haskoin/secp256k1-haskell/issues/36
--

spec :: Spec
spec = do
  it "handled by importPubKeyDer" $
    importPubKeyDer AlgSecp256k1 BS.empty `shouldBe` Nothing
  it "handled by importPubKeyPem" $
    importPubKeyPem AlgSecp256k1 BS.empty `shouldSatisfy` isLeft
  it "handled by importPrvKeyRaw" $
    importPrvKeyRaw AlgSecp256k1 BS.empty `shouldBe` Nothing
  it "handled by importPrvKeyPem" $
    importPrvKeyPem AlgSecp256k1 BS.empty `shouldSatisfy` isLeft
  it "handled by importSigDer" $
    importSigDer AlgSecp256k1 BS.empty `shouldBe` Nothing
