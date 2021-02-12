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
import Proto.SignableOrphan ()
import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Instances ()

spec :: Spec
spec = before (newRandomPrvKey AlgSecp256k1) $ do
  it "is able to sign proto message" $
    \k -> property $ \x0 ->
      sign k (unArbitraryMessage x0 :: Payload)
        `shouldSatisfy` const True
  it "is able to verify valid proto message signature" $
    \k -> property $ \x0 -> do
      let x :: Payload = unArbitraryMessage x0
      verify (derivePubKey k) (sign k x) x `shouldBe` True
  it "is able to discard invalid proto message signature" $
    \k -> property $ \x0 -> do
      let x :: Payload = unArbitraryMessage x0
      let y = x & (amount . amount) +~ 1
      verify (derivePubKey k) (sign k x) y `shouldBe` False
