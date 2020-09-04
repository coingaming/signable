{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestOrphan
  (
  )
where

import Data.Signable
import Data.Signable.Import hiding (show)
import Proto.GoogleProtobuf
import Proto.GoogleProtobuf_Fields
import Prelude (Show (..))

instance Show Sig where
  show = show . exportSig

$(mkSignable $(mkProxy "Int32Value"))
