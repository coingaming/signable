{- This file was auto-generated from basic.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Basic_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
import qualified Proto.GoogleProtobuf
addFee ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "addFee" a) =>
  Lens.Family2.LensLike' f s a
addFee = Data.ProtoLens.Field.field @"addFee"
amount ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amount" a) =>
  Lens.Family2.LensLike' f s a
amount = Data.ProtoLens.Field.field @"amount"
comments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "comments" a) =>
  Lens.Family2.LensLike' f s a
comments = Data.ProtoLens.Field.field @"comments"
currencyCode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "currencyCode" a) =>
  Lens.Family2.LensLike' f s a
currencyCode = Data.ProtoLens.Field.field @"currencyCode"
invoiceTo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "invoiceTo" a) =>
  Lens.Family2.LensLike' f s a
invoiceTo = Data.ProtoLens.Field.field @"invoiceTo"
maybe'amount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'amount" a) =>
  Lens.Family2.LensLike' f s a
maybe'amount = Data.ProtoLens.Field.field @"maybe'amount"
maybe'currencyCode ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'currencyCode" a) =>
  Lens.Family2.LensLike' f s a
maybe'currencyCode
  = Data.ProtoLens.Field.field @"maybe'currencyCode"
maybe'invoiceTo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'invoiceTo" a) =>
  Lens.Family2.LensLike' f s a
maybe'invoiceTo = Data.ProtoLens.Field.field @"maybe'invoiceTo"
maybe'merchantIdTo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'merchantIdTo" a) =>
  Lens.Family2.LensLike' f s a
maybe'merchantIdTo
  = Data.ProtoLens.Field.field @"maybe'merchantIdTo"
maybe'to ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'to" a) =>
  Lens.Family2.LensLike' f s a
maybe'to = Data.ProtoLens.Field.field @"maybe'to"
maybe'userIdTo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'userIdTo" a) =>
  Lens.Family2.LensLike' f s a
maybe'userIdTo = Data.ProtoLens.Field.field @"maybe'userIdTo"
merchantIdTo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "merchantIdTo" a) =>
  Lens.Family2.LensLike' f s a
merchantIdTo = Data.ProtoLens.Field.field @"merchantIdTo"
requestType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestType" a) =>
  Lens.Family2.LensLike' f s a
requestType = Data.ProtoLens.Field.field @"requestType"
userIdFrom ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "userIdFrom" a) =>
  Lens.Family2.LensLike' f s a
userIdFrom = Data.ProtoLens.Field.field @"userIdFrom"
userIdTo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "userIdTo" a) =>
  Lens.Family2.LensLike' f s a
userIdTo = Data.ProtoLens.Field.field @"userIdTo"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'comments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'comments" a) =>
  Lens.Family2.LensLike' f s a
vec'comments = Data.ProtoLens.Field.field @"vec'comments"