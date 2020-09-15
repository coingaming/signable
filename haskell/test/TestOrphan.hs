{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestOrphan
  (
  )
where

import Data.Signable
import Data.Signable.Import hiding (show)
import Prelude (Show (..))

instance Show Sig where
  show = show . exportSig
