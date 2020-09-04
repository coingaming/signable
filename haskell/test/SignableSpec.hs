module SignableSpec
  ( spec,
  )
where

import qualified Data.ByteString.Lazy as BL
import qualified Data.Text.Lazy as TL
import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Instances ()
import TestEnv
import Universum

spec :: Spec
spec = before newEnv $ do
  --
  -- TODO : Traversable and Persistent properties
  --
  it "ByteString/ByteString" $ \env -> property $ \x ->
    reCryptBS env x
      `shouldBe` (Right x :: Either () ByteString)
  it "ByteString/BL.ByteString" $ \env -> property $ \x ->
    reCryptBS env x
      `shouldBe` (Right x :: Either () BL.ByteString)
  it "ByteString/Text" $ \env -> property $ \x ->
    reCryptBS env x
      `shouldBe` (Right x :: Either UnicodeException Text)
  it "ByteString/TL.Text" $ \env -> property $ \x ->
    reCryptBS env x
      `shouldBe` (Right x :: Either UnicodeException TL.Text)
