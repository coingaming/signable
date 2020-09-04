{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestOrphan
  (
  )
where

import Data.Signable.Class
import Data.Signable.Import hiding (show)
import Data.Signable.TH
import Proto.GoogleProtobuf
import Proto.GoogleProtobuf_Fields
import Prelude (Show (..))

instance Show Sig where
  show = show . exportSig

$(mkSignable $(mkProxy "Int32Value"))
