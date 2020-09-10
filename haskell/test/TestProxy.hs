{-# LANGUAGE TemplateHaskell #-}

module TestProxy where

import Data.Signable
import Proto.EmbeddedSchema

$( mkProtoProxy
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "embedded_schema.proto"
 )
