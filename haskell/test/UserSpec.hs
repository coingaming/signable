{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module UserSpec
  ( spec,
    -- just supressing warning
    UserStorageId,
  )
where

import Data.Coerce (coerce)
import Data.Signable
import Database.Persist.TH
import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Arbitrary.Generic
import Test.QuickCheck.Instances ()
import TestEnv
import Universum

data User = User {login :: Login, address :: Address}
  deriving (Eq, Generic, Show)

instance Arbitrary User where
  arbitrary = genericArbitrary
  shrink = genericShrink

share
  [mkPersist sqlSettings]
  [persistLowerCase|
    UserStorage
      login Login
      address (Encrypted ByteString UnicodeException Address)
      UniqueUserStorage login
  |]

instance Signable UserStorage UnicodeException User where
  encrypt c i x = Encrypted $ UserStorage (login x) $ encrypt c i (address x)
  decrypt c i x0 = do
    let x = coerce x0
    a <- decrypt c i $ userStorageAddress x
    return $ User (userStorageLogin x) a

spec :: Spec
spec = before newEnv
  $ it "UserStorage/User"
  $ \env -> property $ \x -> do
    let c = cipher env
    let i = iv env
    decrypt c i (encrypt c i x :: Encrypted UserStorage UnicodeException User)
      `shouldBe` Right x
