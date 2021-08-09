{- This file was auto-generated from coins.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Coins_Fields where
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

amount ::
       forall f s a .
         (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amount" a) =>
         Lens.Family2.LensLike' f s a
amount = Data.ProtoLens.Field.field @"amount"
coef ::
     forall f s a .
       (Prelude.Functor f, Data.ProtoLens.Field.HasField s "coef" a) =>
       Lens.Family2.LensLike' f s a
coef = Data.ProtoLens.Field.field @"coef"
currencyCode ::
             forall f s a .
               (Prelude.Functor f,
                Data.ProtoLens.Field.HasField s "currencyCode" a) =>
               Lens.Family2.LensLike' f s a
currencyCode = Data.ProtoLens.Field.field @"currencyCode"
exp ::
    forall f s a .
      (Prelude.Functor f, Data.ProtoLens.Field.HasField s "exp" a) =>
      Lens.Family2.LensLike' f s a
exp = Data.ProtoLens.Field.field @"exp"
invoice ::
        forall f s a .
          (Prelude.Functor f, Data.ProtoLens.Field.HasField s "invoice" a) =>
          Lens.Family2.LensLike' f s a
invoice = Data.ProtoLens.Field.field @"invoice"
invoiceType ::
            forall f s a .
              (Prelude.Functor f,
               Data.ProtoLens.Field.HasField s "invoiceType" a) =>
              Lens.Family2.LensLike' f s a
invoiceType = Data.ProtoLens.Field.field @"invoiceType"
ledgerSignature ::
                forall f s a .
                  (Prelude.Functor f,
                   Data.ProtoLens.Field.HasField s "ledgerSignature" a) =>
                  Lens.Family2.LensLike' f s a
ledgerSignature = Data.ProtoLens.Field.field @"ledgerSignature"
ledgerTransferRequest ::
                      forall f s a .
                        (Prelude.Functor f,
                         Data.ProtoLens.Field.HasField s "ledgerTransferRequest" a) =>
                        Lens.Family2.LensLike' f s a
ledgerTransferRequest
  = Data.ProtoLens.Field.field @"ledgerTransferRequest"
maybe'amount ::
             forall f s a .
               (Prelude.Functor f,
                Data.ProtoLens.Field.HasField s "maybe'amount" a) =>
               Lens.Family2.LensLike' f s a
maybe'amount = Data.ProtoLens.Field.field @"maybe'amount"
maybe'currencyCode ::
                   forall f s a .
                     (Prelude.Functor f,
                      Data.ProtoLens.Field.HasField s "maybe'currencyCode" a) =>
                     Lens.Family2.LensLike' f s a
maybe'currencyCode
  = Data.ProtoLens.Field.field @"maybe'currencyCode"
maybe'invoice ::
              forall f s a .
                (Prelude.Functor f,
                 Data.ProtoLens.Field.HasField s "maybe'invoice" a) =>
                Lens.Family2.LensLike' f s a
maybe'invoice = Data.ProtoLens.Field.field @"maybe'invoice"
maybe'ledgerTransferRequest ::
                            forall f s a .
                              (Prelude.Functor f,
                               Data.ProtoLens.Field.HasField s "maybe'ledgerTransferRequest" a) =>
                              Lens.Family2.LensLike' f s a
maybe'ledgerTransferRequest
  = Data.ProtoLens.Field.field @"maybe'ledgerTransferRequest"
maybe'merchantIdTo ::
                   forall f s a .
                     (Prelude.Functor f,
                      Data.ProtoLens.Field.HasField s "maybe'merchantIdTo" a) =>
                     Lens.Family2.LensLike' f s a
maybe'merchantIdTo
  = Data.ProtoLens.Field.field @"maybe'merchantIdTo"
maybe'to ::
         forall f s a .
           (Prelude.Functor f,
            Data.ProtoLens.Field.HasField s "maybe'to" a) =>
           Lens.Family2.LensLike' f s a
maybe'to = Data.ProtoLens.Field.field @"maybe'to"
maybe'userRequest ::
                  forall f s a .
                    (Prelude.Functor f,
                     Data.ProtoLens.Field.HasField s "maybe'userRequest" a) =>
                    Lens.Family2.LensLike' f s a
maybe'userRequest = Data.ProtoLens.Field.field @"maybe'userRequest"
maybe'userTransferRequest ::
                          forall f s a .
                            (Prelude.Functor f,
                             Data.ProtoLens.Field.HasField s "maybe'userTransferRequest" a) =>
                            Lens.Family2.LensLike' f s a
maybe'userTransferRequest
  = Data.ProtoLens.Field.field @"maybe'userTransferRequest"
merchantIdTo ::
             forall f s a .
               (Prelude.Functor f,
                Data.ProtoLens.Field.HasField s "merchantIdTo" a) =>
               Lens.Family2.LensLike' f s a
merchantIdTo = Data.ProtoLens.Field.field @"merchantIdTo"
paymentRequest ::
               forall f s a .
                 (Prelude.Functor f,
                  Data.ProtoLens.Field.HasField s "paymentRequest" a) =>
                 Lens.Family2.LensLike' f s a
paymentRequest = Data.ProtoLens.Field.field @"paymentRequest"
pubKeyUidFrom ::
              forall f s a .
                (Prelude.Functor f,
                 Data.ProtoLens.Field.HasField s "pubKeyUidFrom" a) =>
                Lens.Family2.LensLike' f s a
pubKeyUidFrom = Data.ProtoLens.Field.field @"pubKeyUidFrom"
rHash ::
      forall f s a .
        (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rHash" a) =>
        Lens.Family2.LensLike' f s a
rHash = Data.ProtoLens.Field.field @"rHash"
requestId ::
          forall f s a .
            (Prelude.Functor f,
             Data.ProtoLens.Field.HasField s "requestId" a) =>
            Lens.Family2.LensLike' f s a
requestId = Data.ProtoLens.Field.field @"requestId"
userRequest ::
            forall f s a .
              (Prelude.Functor f,
               Data.ProtoLens.Field.HasField s "userRequest" a) =>
              Lens.Family2.LensLike' f s a
userRequest = Data.ProtoLens.Field.field @"userRequest"
userSignature ::
              forall f s a .
                (Prelude.Functor f,
                 Data.ProtoLens.Field.HasField s "userSignature" a) =>
                Lens.Family2.LensLike' f s a
userSignature = Data.ProtoLens.Field.field @"userSignature"
userTransferRequest ::
                    forall f s a .
                      (Prelude.Functor f,
                       Data.ProtoLens.Field.HasField s "userTransferRequest" a) =>
                      Lens.Family2.LensLike' f s a
userTransferRequest
  = Data.ProtoLens.Field.field @"userTransferRequest"
value ::
      forall f s a .
        (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
        Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"