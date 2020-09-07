module SignableSpec
  ( spec,
  )
where

import Data.ProtoLens.Arbitrary
import Data.Signable
import Data.Signable.Import
import Lens.Micro
import Proto.GoogleProtobuf
import Proto.GoogleProtobuf_Fields
import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Instances ()
import TestOrphan ()

spec :: Spec
spec = before newRandomPrvKey $ do
  it "is able to sign proto message" $
    \k -> property $ \x0 ->
      sign k (unArbitraryMessage x0 :: Int32Value)
        `shouldSatisfy` isJust
  it "is able to verify valid proto message signature" $
    \k -> property $ \x0 -> do
      let x :: Int32Value = unArbitraryMessage x0
      maybe
        False
        (\s -> verify (derivePubKey k) s x)
        (sign k x)
        `shouldBe` True
  it "is able to discard invalid proto message signature" $
    \k -> property $ \x0 -> do
      let x :: Int32Value = unArbitraryMessage x0
      let y = x & value +~ 1
      maybe
        False
        (\s -> verify (derivePubKey k) s y)
        (sign k x)
        `shouldBe` False
