{-# LANGUAGE TemplateHaskell #-}

module TestProxy where

import Data.Signable
import Proto.Basic

---
$( mkProtoProxy
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "basic.proto"
 )
