module SignableSpec
  ( spec,
  )
where

import Data.ProtoLens.Arbitrary
import Data.Signable
import Data.Signable.Import
import Lens.Micro
import Proto.Basic
import Proto.Basic_Fields
import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Instances ()
import TestOrphan ()

spec :: Spec
spec = before newRandomPrvKey $ do
  it "is able to sign proto message" $
    \k -> property $ \x0 ->
      sign k (unArbitraryMessage x0 :: Payload)
        `shouldSatisfy` isJust
  it "is able to verify valid proto message signature" $
    \k -> property $ \x0 -> do
      let x :: Payload = unArbitraryMessage x0
      maybe
        False
        (\s -> verify (derivePubKey k) s x)
        (sign k x)
        `shouldBe` True
  it "is able to discard invalid proto message signature" $
    \k -> property $ \x0 -> do
      let x :: Payload = unArbitraryMessage x0
      let y = x & (amount . amount) +~ 1
      maybe
        False
        (\s -> verify (derivePubKey k) s y)
        (sign k x)
        `shouldBe` False
