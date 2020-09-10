{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module TestOrphan
  (
  )
where

import Data.Signable
import Data.Signable.Import hiding (show)
import Filesystem.Path.CurrentOS ()
import Proto.Basic
import Proto.Basic_Fields
import Proto.Coins
import Proto.Coins_Fields
import Proto.EmbeddedSchema
import Proto.EmbeddedSchema_Fields
import Proto.GoogleProtobuf
import Proto.GoogleProtobuf_Fields
import Proto.Number
import Proto.Number_Fields
import Proto.Text
import Proto.Text_Fields
import Prelude (Show (..))

instance Show Sig where
  show = show . exportSig

$( mkSignableProtoLensFile
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "basic.proto"
 )

$( mkSignableProtoLensFile
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "coins.proto"
 )

$( mkSignableProtoLensFile
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "embedded_schema.proto"
 )

$( mkSignableProtoLensFile
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "google_protobuf.proto"
 )

$( mkSignableProtoLensFile
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "number.proto"
 )

$( mkSignableProtoLensFile
     (ProtoModuleRoot "Proto")
     ["test/Support/test-proto/"]
     "text.proto"
 )
