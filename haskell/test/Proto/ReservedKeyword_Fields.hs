{- This file was auto-generated from reserved_keyword.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.ReservedKeyword_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens
       as Data.ProtoLens
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes
       as Data.ProtoLens.Encoding.Bytes
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing
       as Data.ProtoLens.Encoding.Growing
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe
       as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire
       as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field
       as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum
       as Data.ProtoLens.Message.Enum
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types
       as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2
       as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked
       as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString
       as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8
       as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding
       as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic
       as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed
       as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read

class' ::
       forall f s a .
         (Prelude.Functor f, Data.ProtoLens.Field.HasField s "class'" a) =>
         Lens.Family2.LensLike' f s a
class' = Data.ProtoLens.Field.field @"class'"
data' ::
      forall f s a .
        (Prelude.Functor f, Data.ProtoLens.Field.HasField s "data'" a) =>
        Lens.Family2.LensLike' f s a
data' = Data.ProtoLens.Field.field @"data'"
if' ::
    forall f s a .
      (Prelude.Functor f, Data.ProtoLens.Field.HasField s "if'" a) =>
      Lens.Family2.LensLike' f s a
if' = Data.ProtoLens.Field.field @"if'"
instance' ::
          forall f s a .
            (Prelude.Functor f,
             Data.ProtoLens.Field.HasField s "instance'" a) =>
            Lens.Family2.LensLike' f s a
instance' = Data.ProtoLens.Field.field @"instance'"
maybe'class' ::
             forall f s a .
               (Prelude.Functor f,
                Data.ProtoLens.Field.HasField s "maybe'class'" a) =>
               Lens.Family2.LensLike' f s a
maybe'class' = Data.ProtoLens.Field.field @"maybe'class'"
maybe'either ::
             forall f s a .
               (Prelude.Functor f,
                Data.ProtoLens.Field.HasField s "maybe'either" a) =>
               Lens.Family2.LensLike' f s a
maybe'either = Data.ProtoLens.Field.field @"maybe'either"
maybe'x ::
        forall f s a .
          (Prelude.Functor f, Data.ProtoLens.Field.HasField s "maybe'x" a) =>
          Lens.Family2.LensLike' f s a
maybe'x = Data.ProtoLens.Field.field @"maybe'x"
maybe'xs ::
         forall f s a .
           (Prelude.Functor f,
            Data.ProtoLens.Field.HasField s "maybe'xs" a) =>
           Lens.Family2.LensLike' f s a
maybe'xs = Data.ProtoLens.Field.field @"maybe'xs"
module' ::
        forall f s a .
          (Prelude.Functor f, Data.ProtoLens.Field.HasField s "module'" a) =>
          Lens.Family2.LensLike' f s a
module' = Data.ProtoLens.Field.field @"module'"
type' ::
      forall f s a .
        (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
        Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
vec'data' ::
          forall f s a .
            (Prelude.Functor f,
             Data.ProtoLens.Field.HasField s "vec'data'" a) =>
            Lens.Family2.LensLike' f s a
vec'data' = Data.ProtoLens.Field.field @"vec'data'"
vec'type' ::
          forall f s a .
            (Prelude.Functor f,
             Data.ProtoLens.Field.HasField s "vec'type'" a) =>
            Lens.Family2.LensLike' f s a
vec'type' = Data.ProtoLens.Field.field @"vec'type'"
x ::
  forall f s a .
    (Prelude.Functor f, Data.ProtoLens.Field.HasField s "x" a) =>
    Lens.Family2.LensLike' f s a
x = Data.ProtoLens.Field.field @"x"
xs ::
   forall f s a .
     (Prelude.Functor f, Data.ProtoLens.Field.HasField s "xs" a) =>
     Lens.Family2.LensLike' f s a
xs = Data.ProtoLens.Field.field @"xs"