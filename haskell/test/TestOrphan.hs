{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestOrphan
  (
  )
where

import Data.Signable
import Data.Signable.Import hiding (show)
import Proto.Basic
import Proto.Basic_Fields
import Proto.GoogleProtobuf
import Proto.GoogleProtobuf_Fields
import Prelude (Show (..))

instance Show Sig where
  show = show . exportSig

$(mkSignable $(mkProxy "Proto.GoogleProtobuf" "Int32Value"))

$(mkSignable $(mkProxy "Proto.GoogleProtobuf" "StringValue"))

$(mkSignable $(mkProxy "Proto.Basic" "UMoney"))

$(mkSignable $(mkProxy "Proto.Basic" "CurrencyCodeValue"))

$(mkSignable $(mkProxy "Proto.Basic" "Payload"))

$(mkSignableEnum $(mkProxy "Proto.Basic" "RequestType"))

$(mkSignableEnum $(mkProxy "Proto.Basic" "CurrencyCode"))
