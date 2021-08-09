{- This file was auto-generated from basic.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Basic
       (CurrencyCode(..), CurrencyCode(), CurrencyCode'UnrecognizedValue,
        CurrencyCodeValue(), Payload(), Payload'To(..), _Payload'UserIdTo,
        _Payload'MerchantIdTo, _Payload'InvoiceTo, RequestType(..),
        RequestType(), RequestType'UnrecognizedValue, UMoney())
       where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq
       as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism
       as Data.ProtoLens.Prism
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
import qualified Proto.GoogleProtobuf

newtype CurrencyCode'UnrecognizedValue = CurrencyCode'UnrecognizedValue Data.Int.Int32
                                           deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data CurrencyCode = BTC
                  | EUR
                  | USD
                  | ETH
                  | CurrencyCode'Unrecognized !CurrencyCode'UnrecognizedValue
                      deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum CurrencyCode where
        maybeToEnum 0 = Prelude.Just BTC
        maybeToEnum 1 = Prelude.Just EUR
        maybeToEnum 2 = Prelude.Just USD
        maybeToEnum 3 = Prelude.Just ETH
        maybeToEnum k
          = Prelude.Just
              (CurrencyCode'Unrecognized
                 (CurrencyCode'UnrecognizedValue (Prelude.fromIntegral k)))
        showEnum BTC = "BTC"
        showEnum EUR = "EUR"
        showEnum USD = "USD"
        showEnum ETH = "ETH"
        showEnum
          (CurrencyCode'Unrecognized (CurrencyCode'UnrecognizedValue k))
          = Prelude.show k
        readEnum k
          | (k) Prelude.== "BTC" = Prelude.Just BTC
          | (k) Prelude.== "EUR" = Prelude.Just EUR
          | (k) Prelude.== "USD" = Prelude.Just USD
          | (k) Prelude.== "ETH" = Prelude.Just ETH
        readEnum k
          = (Text.Read.readMaybe k) Prelude.>>= Data.ProtoLens.maybeToEnum
instance Prelude.Bounded CurrencyCode where
        minBound = BTC
        maxBound = ETH
instance Prelude.Enum CurrencyCode where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 (("toEnum: unknown value for enum CurrencyCode: ") Prelude.++
                    Prelude.show k__))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum BTC = 0
        fromEnum EUR = 1
        fromEnum USD = 2
        fromEnum ETH = 3
        fromEnum
          (CurrencyCode'Unrecognized (CurrencyCode'UnrecognizedValue k))
          = Prelude.fromIntegral k
        succ ETH
          = Prelude.error
              "CurrencyCode.succ: bad argument ETH. This value would be out of bounds."
        succ BTC = EUR
        succ EUR = USD
        succ USD = ETH
        succ (CurrencyCode'Unrecognized _)
          = Prelude.error
              "CurrencyCode.succ: bad argument: unrecognized value"
        pred BTC
          = Prelude.error
              "CurrencyCode.pred: bad argument BTC. This value would be out of bounds."
        pred EUR = BTC
        pred USD = EUR
        pred ETH = USD
        pred (CurrencyCode'Unrecognized _)
          = Prelude.error
              "CurrencyCode.pred: bad argument: unrecognized value"
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault CurrencyCode where
        fieldDefault = BTC
instance Control.DeepSeq.NFData CurrencyCode where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Basic_Fields.value' @:: Lens' CurrencyCodeValue CurrencyCode@
 -}
data CurrencyCodeValue = CurrencyCodeValue{_CurrencyCodeValue'value
                                           :: !CurrencyCode,
                                           _CurrencyCodeValue'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CurrencyCodeValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CurrencyCodeValue "value"
           (CurrencyCode)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _CurrencyCodeValue'value
               (\ x__ y__ -> x__{_CurrencyCodeValue'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message CurrencyCodeValue where
        messageName _ = Data.Text.pack "Basic.CurrencyCodeValue"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor CurrencyCode)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor CurrencyCodeValue
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _CurrencyCodeValue'_unknownFields
              (\ x__ y__ -> x__{_CurrencyCodeValue'_unknownFields = y__})
        defMessage
          = CurrencyCodeValue{_CurrencyCodeValue'value =
                                Data.ProtoLens.fieldDefault,
                              _CurrencyCodeValue'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     CurrencyCodeValue ->
                       Data.ProtoLens.Encoding.Bytes.Parser CurrencyCodeValue
                loop x
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 x)
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                8 -> do y <- (Prelude.fmap Prelude.toEnum
                                                (Prelude.fmap Prelude.fromIntegral
                                                   Data.ProtoLens.Encoding.Bytes.getVarInt))
                                               Data.ProtoLens.Encoding.Bytes.<?> "value"
                                        loop
                                          (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y
                                             x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "CurrencyCodeValue"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      (((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                          Prelude.fromIntegral)
                         Prelude.. Prelude.fromEnum)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData CurrencyCodeValue where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_CurrencyCodeValue'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_CurrencyCodeValue'value x__) (())))
{- | Fields :

    * 'Proto.Basic_Fields.userIdFrom' @:: Lens' Payload Data.Word.Word64@
    * 'Proto.Basic_Fields.amount' @:: Lens' Payload UMoney@
    * 'Proto.Basic_Fields.maybe'amount' @:: Lens' Payload (Prelude.Maybe UMoney)@
    * 'Proto.Basic_Fields.requestType' @:: Lens' Payload RequestType@
    * 'Proto.Basic_Fields.addFee' @:: Lens' Payload Prelude.Bool@
    * 'Proto.Basic_Fields.comments' @:: Lens' Payload [Data.Text.Text]@
    * 'Proto.Basic_Fields.vec'comments' @:: Lens' Payload (Data.Vector.Vector Data.Text.Text)@
    * 'Proto.Basic_Fields.maybe'to' @:: Lens' Payload (Prelude.Maybe Payload'To)@
    * 'Proto.Basic_Fields.maybe'userIdTo' @:: Lens' Payload (Prelude.Maybe Data.Word.Word64)@
    * 'Proto.Basic_Fields.userIdTo' @:: Lens' Payload Data.Word.Word64@
    * 'Proto.Basic_Fields.maybe'merchantIdTo' @:: Lens' Payload (Prelude.Maybe Data.Text.Text)@
    * 'Proto.Basic_Fields.merchantIdTo' @:: Lens' Payload Data.Text.Text@
    * 'Proto.Basic_Fields.maybe'invoiceTo' @:: Lens' Payload (Prelude.Maybe Proto.GoogleProtobuf.StringValue)@
    * 'Proto.Basic_Fields.invoiceTo' @:: Lens' Payload Proto.GoogleProtobuf.StringValue@
 -}
data Payload = Payload{_Payload'userIdFrom :: !Data.Word.Word64,
                       _Payload'amount :: !(Prelude.Maybe UMoney),
                       _Payload'requestType :: !RequestType,
                       _Payload'addFee :: !Prelude.Bool,
                       _Payload'comments :: !(Data.Vector.Vector Data.Text.Text),
                       _Payload'to :: !(Prelude.Maybe Payload'To),
                       _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
data Payload'To = Payload'UserIdTo !Data.Word.Word64
                | Payload'MerchantIdTo !Data.Text.Text
                | Payload'InvoiceTo !Proto.GoogleProtobuf.StringValue
                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Payload "userIdFrom"
           (Data.Word.Word64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'userIdFrom
               (\ x__ y__ -> x__{_Payload'userIdFrom = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "amount" (UMoney)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'amount
               (\ x__ y__ -> x__{_Payload'amount = y__}))
              Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.defMessage
instance Data.ProtoLens.Field.HasField Payload "maybe'amount"
           (Prelude.Maybe UMoney)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'amount
               (\ x__ y__ -> x__{_Payload'amount = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "requestType"
           (RequestType)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'requestType
               (\ x__ y__ -> x__{_Payload'requestType = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "addFee"
           (Prelude.Bool)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'addFee
               (\ x__ y__ -> x__{_Payload'addFee = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "comments"
           ([Data.Text.Text])
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'comments
               (\ x__ y__ -> x__{_Payload'comments = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens Data.Vector.Generic.toList
                (\ _ y__ -> Data.Vector.Generic.fromList y__)
instance Data.ProtoLens.Field.HasField Payload "vec'comments"
           (Data.Vector.Vector Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'comments
               (\ x__ y__ -> x__{_Payload'comments = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "maybe'to"
           (Prelude.Maybe Payload'To)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "maybe'userIdTo"
           (Prelude.Maybe Data.Word.Word64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens
                (\ x__ ->
                   case x__ of
                       Prelude.Just (Payload'UserIdTo x__val) -> Prelude.Just x__val
                       _otherwise -> Prelude.Nothing)
                (\ _ y__ -> Prelude.fmap Payload'UserIdTo y__)
instance Data.ProtoLens.Field.HasField Payload "userIdTo"
           (Data.Word.Word64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude..
              (Lens.Family2.Unchecked.lens
                 (\ x__ ->
                    case x__ of
                        Prelude.Just (Payload'UserIdTo x__val) -> Prelude.Just x__val
                        _otherwise -> Prelude.Nothing)
                 (\ _ y__ -> Prelude.fmap Payload'UserIdTo y__))
                Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault
instance Data.ProtoLens.Field.HasField Payload "maybe'merchantIdTo"
           (Prelude.Maybe Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens
                (\ x__ ->
                   case x__ of
                       Prelude.Just (Payload'MerchantIdTo x__val) -> Prelude.Just x__val
                       _otherwise -> Prelude.Nothing)
                (\ _ y__ -> Prelude.fmap Payload'MerchantIdTo y__)
instance Data.ProtoLens.Field.HasField Payload "merchantIdTo"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude..
              (Lens.Family2.Unchecked.lens
                 (\ x__ ->
                    case x__ of
                        Prelude.Just (Payload'MerchantIdTo x__val) -> Prelude.Just x__val
                        _otherwise -> Prelude.Nothing)
                 (\ _ y__ -> Prelude.fmap Payload'MerchantIdTo y__))
                Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault
instance Data.ProtoLens.Field.HasField Payload "maybe'invoiceTo"
           (Prelude.Maybe Proto.GoogleProtobuf.StringValue)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens
                (\ x__ ->
                   case x__ of
                       Prelude.Just (Payload'InvoiceTo x__val) -> Prelude.Just x__val
                       _otherwise -> Prelude.Nothing)
                (\ _ y__ -> Prelude.fmap Payload'InvoiceTo y__)
instance Data.ProtoLens.Field.HasField Payload "invoiceTo"
           (Proto.GoogleProtobuf.StringValue)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'to
               (\ x__ y__ -> x__{_Payload'to = y__}))
              Prelude..
              (Lens.Family2.Unchecked.lens
                 (\ x__ ->
                    case x__ of
                        Prelude.Just (Payload'InvoiceTo x__val) -> Prelude.Just x__val
                        _otherwise -> Prelude.Nothing)
                 (\ _ y__ -> Prelude.fmap Payload'InvoiceTo y__))
                Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.defMessage
instance Data.ProtoLens.Message Payload where
        messageName _ = Data.Text.pack "Basic.Payload"
        fieldsByTag
          = let userIdFrom__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "user_id_from"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"userIdFrom"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                amount__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "amount"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor UMoney)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'amount"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                requestType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "request_type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor RequestType)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"requestType"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                addFee__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "add_fee"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"addFee"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                comments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "comments"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Data.ProtoLens.Field.field @"comments"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                userIdTo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "user_id_to"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'userIdTo"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                merchantIdTo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "merchant_id_to"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'merchantIdTo"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                invoiceTo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "invoice_to"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor
                           Proto.GoogleProtobuf.StringValue)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'invoiceTo"))
                      :: Data.ProtoLens.FieldDescriptor Payload
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, userIdFrom__field_descriptor),
                 (Data.ProtoLens.Tag 2, amount__field_descriptor),
                 (Data.ProtoLens.Tag 3, requestType__field_descriptor),
                 (Data.ProtoLens.Tag 4, addFee__field_descriptor),
                 (Data.ProtoLens.Tag 5, comments__field_descriptor),
                 (Data.ProtoLens.Tag 6, userIdTo__field_descriptor),
                 (Data.ProtoLens.Tag 7, merchantIdTo__field_descriptor),
                 (Data.ProtoLens.Tag 8, invoiceTo__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Payload'_unknownFields
              (\ x__ y__ -> x__{_Payload'_unknownFields = y__})
        defMessage
          = Payload{_Payload'userIdFrom = Data.ProtoLens.fieldDefault,
                    _Payload'amount = Prelude.Nothing,
                    _Payload'requestType = Data.ProtoLens.fieldDefault,
                    _Payload'addFee = Data.ProtoLens.fieldDefault,
                    _Payload'comments = Data.Vector.Generic.empty,
                    _Payload'to = Prelude.Nothing, _Payload'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Payload ->
                       Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector
                         Data.ProtoLens.Encoding.Growing.RealWorld
                         Data.Text.Text
                         -> Data.ProtoLens.Encoding.Bytes.Parser Payload
                loop x mutable'comments
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do frozen'comments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'comments)
                            let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 (Lens.Family2.set (Data.ProtoLens.Field.field @"vec'comments")
                                    frozen'comments
                                    x))
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                8 -> do y <- (Data.ProtoLens.Encoding.Bytes.getVarInt)
                                               Data.ProtoLens.Encoding.Bytes.<?> "user_id_from"
                                        loop
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"userIdFrom")
                                             y
                                             x)
                                          mutable'comments
                                18 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                    (Prelude.fromIntegral len)
                                                    Data.ProtoLens.parseMessage)
                                                Data.ProtoLens.Encoding.Bytes.<?> "amount"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"amount")
                                              y
                                              x)
                                           mutable'comments
                                24 -> do y <- (Prelude.fmap Prelude.toEnum
                                                 (Prelude.fmap Prelude.fromIntegral
                                                    Data.ProtoLens.Encoding.Bytes.getVarInt))
                                                Data.ProtoLens.Encoding.Bytes.<?> "request_type"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"requestType")
                                              y
                                              x)
                                           mutable'comments
                                32 -> do y <- (Prelude.fmap ((Prelude./=) 0)
                                                 Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                Data.ProtoLens.Encoding.Bytes.<?> "add_fee"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"addFee")
                                              y
                                              x)
                                           mutable'comments
                                42 -> do !y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                               Data.ProtoLens.Encoding.Bytes.getBytes
                                                                 (Prelude.fromIntegral len)
                                                   Data.ProtoLens.Encoding.Bytes.runEither
                                                     (case Data.Text.Encoding.decodeUtf8' value of
                                                          Prelude.Left err -> Prelude.Left
                                                                                (Prelude.show err)
                                                          Prelude.Right r -> Prelude.Right r))
                                                 Data.ProtoLens.Encoding.Bytes.<?> "comments"
                                         v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.append
                                                   mutable'comments
                                                   y)
                                         loop x v
                                48 -> do y <- (Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                Data.ProtoLens.Encoding.Bytes.<?> "user_id_to"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"userIdTo")
                                              y
                                              x)
                                           mutable'comments
                                58 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
                                                Data.ProtoLens.Encoding.Bytes.<?> "merchant_id_to"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"merchantIdTo")
                                              y
                                              x)
                                           mutable'comments
                                66 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                    (Prelude.fromIntegral len)
                                                    Data.ProtoLens.parseMessage)
                                                Data.ProtoLens.Encoding.Bytes.<?> "invoice_to"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"invoiceTo")
                                              y
                                              x)
                                           mutable'comments
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
                                             mutable'comments
              in
              (do mutable'comments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        Data.ProtoLens.Encoding.Growing.new
                  loop Data.ProtoLens.defMessage mutable'comments)
                Data.ProtoLens.Encoding.Bytes.<?> "Payload"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"userIdFrom") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      Data.ProtoLens.Encoding.Bytes.putVarInt _v)
                 Data.Monoid.<>
                 (case
                    Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'amount") _x
                    of
                      (Prelude.Nothing) -> Data.Monoid.mempty
                      Prelude.Just _v -> (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                                           Data.Monoid.<>
                                           (((\ bs ->
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                   (Prelude.fromIntegral
                                                      (Data.ByteString.length bs)))
                                                  Data.Monoid.<>
                                                  Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                              Prelude.. Data.ProtoLens.encodeMessage)
                                             _v)
                   Data.Monoid.<>
                   (let _v
                          = Lens.Family2.view (Data.ProtoLens.Field.field @"requestType") _x
                      in
                      if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                        Data.Monoid.mempty else
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 24) Data.Monoid.<>
                          (((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                              Prelude.fromIntegral)
                             Prelude.. Prelude.fromEnum)
                            _v)
                     Data.Monoid.<>
                     (let _v
                            = Lens.Family2.view (Data.ProtoLens.Field.field @"addFee") _x
                        in
                        if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty else
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 32) Data.Monoid.<>
                            ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                               (\ b -> if b then 1 else 0))
                              _v)
                       Data.Monoid.<>
                       (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                          (\ _v ->
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 42) Data.Monoid.<>
                               (((\ bs ->
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Prelude.. Data.Text.Encoding.encodeUtf8)
                                 _v)
                          (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'comments")
                             _x))
                         Data.Monoid.<>
                         (case Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'to") _x
                            of
                              (Prelude.Nothing) -> Data.Monoid.mempty
                              Prelude.Just
                                (Payload'UserIdTo v) -> (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           48)
                                                          Data.Monoid.<>
                                                          Data.ProtoLens.Encoding.Bytes.putVarInt v
                              Prelude.Just
                                (Payload'MerchantIdTo
                                   v) -> (Data.ProtoLens.Encoding.Bytes.putVarInt 58) Data.Monoid.<>
                                           (((\ bs ->
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                   (Prelude.fromIntegral
                                                      (Data.ByteString.length bs)))
                                                  Data.Monoid.<>
                                                  Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                              Prelude.. Data.Text.Encoding.encodeUtf8)
                                             v
                              Prelude.Just
                                (Payload'InvoiceTo v) -> (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                            66)
                                                           Data.Monoid.<>
                                                           (((\ bs ->
                                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                   (Prelude.fromIntegral
                                                                      (Data.ByteString.length bs)))
                                                                  Data.Monoid.<>
                                                                  Data.ProtoLens.Encoding.Bytes.putBytes
                                                                    bs))
                                                              Prelude..
                                                              Data.ProtoLens.encodeMessage)
                                                             v)
                           Data.Monoid.<>
                           Data.ProtoLens.Encoding.Wire.buildFieldSet
                             (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Payload'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Payload'userIdFrom x__)
                    (Control.DeepSeq.deepseq (_Payload'amount x__)
                       (Control.DeepSeq.deepseq (_Payload'requestType x__)
                          (Control.DeepSeq.deepseq (_Payload'addFee x__)
                             (Control.DeepSeq.deepseq (_Payload'comments x__)
                                (Control.DeepSeq.deepseq (_Payload'to x__) (()))))))))
instance Control.DeepSeq.NFData Payload'To where
        rnf (Payload'UserIdTo x__) = Control.DeepSeq.rnf x__
        rnf (Payload'MerchantIdTo x__) = Control.DeepSeq.rnf x__
        rnf (Payload'InvoiceTo x__) = Control.DeepSeq.rnf x__
_Payload'UserIdTo ::
                  Data.ProtoLens.Prism.Prism' Payload'To Data.Word.Word64
_Payload'UserIdTo
  = Data.ProtoLens.Prism.prism' Payload'UserIdTo
      (\ p__ ->
         case p__ of
             Payload'UserIdTo p__val -> Prelude.Just p__val
             _otherwise -> Prelude.Nothing)
_Payload'MerchantIdTo ::
                      Data.ProtoLens.Prism.Prism' Payload'To Data.Text.Text
_Payload'MerchantIdTo
  = Data.ProtoLens.Prism.prism' Payload'MerchantIdTo
      (\ p__ ->
         case p__ of
             Payload'MerchantIdTo p__val -> Prelude.Just p__val
             _otherwise -> Prelude.Nothing)
_Payload'InvoiceTo ::
                   Data.ProtoLens.Prism.Prism' Payload'To
                     Proto.GoogleProtobuf.StringValue
_Payload'InvoiceTo
  = Data.ProtoLens.Prism.prism' Payload'InvoiceTo
      (\ p__ ->
         case p__ of
             Payload'InvoiceTo p__val -> Prelude.Just p__val
             _otherwise -> Prelude.Nothing)
newtype RequestType'UnrecognizedValue = RequestType'UnrecognizedValue Data.Int.Int32
                                          deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data RequestType = USER
                 | LEDGER
                 | RequestType'Unrecognized !RequestType'UnrecognizedValue
                     deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum RequestType where
        maybeToEnum 0 = Prelude.Just USER
        maybeToEnum 1 = Prelude.Just LEDGER
        maybeToEnum k
          = Prelude.Just
              (RequestType'Unrecognized
                 (RequestType'UnrecognizedValue (Prelude.fromIntegral k)))
        showEnum USER = "USER"
        showEnum LEDGER = "LEDGER"
        showEnum
          (RequestType'Unrecognized (RequestType'UnrecognizedValue k))
          = Prelude.show k
        readEnum k
          | (k) Prelude.== "USER" = Prelude.Just USER
          | (k) Prelude.== "LEDGER" = Prelude.Just LEDGER
        readEnum k
          = (Text.Read.readMaybe k) Prelude.>>= Data.ProtoLens.maybeToEnum
instance Prelude.Bounded RequestType where
        minBound = USER
        maxBound = LEDGER
instance Prelude.Enum RequestType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 (("toEnum: unknown value for enum RequestType: ") Prelude.++
                    Prelude.show k__))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum USER = 0
        fromEnum LEDGER = 1
        fromEnum
          (RequestType'Unrecognized (RequestType'UnrecognizedValue k))
          = Prelude.fromIntegral k
        succ LEDGER
          = Prelude.error
              "RequestType.succ: bad argument LEDGER. This value would be out of bounds."
        succ USER = LEDGER
        succ (RequestType'Unrecognized _)
          = Prelude.error
              "RequestType.succ: bad argument: unrecognized value"
        pred USER
          = Prelude.error
              "RequestType.pred: bad argument USER. This value would be out of bounds."
        pred LEDGER = USER
        pred (RequestType'Unrecognized _)
          = Prelude.error
              "RequestType.pred: bad argument: unrecognized value"
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault RequestType where
        fieldDefault = USER
instance Control.DeepSeq.NFData RequestType where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Basic_Fields.amount' @:: Lens' UMoney Data.Word.Word64@
    * 'Proto.Basic_Fields.currencyCode' @:: Lens' UMoney CurrencyCodeValue@
    * 'Proto.Basic_Fields.maybe'currencyCode' @:: Lens' UMoney (Prelude.Maybe CurrencyCodeValue)@
 -}
data UMoney = UMoney{_UMoney'amount :: !Data.Word.Word64,
                     _UMoney'currencyCode :: !(Prelude.Maybe CurrencyCodeValue),
                     _UMoney'_unknownFields :: !Data.ProtoLens.FieldSet}
                deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UMoney where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UMoney "amount"
           (Data.Word.Word64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _UMoney'amount
               (\ x__ y__ -> x__{_UMoney'amount = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField UMoney "currencyCode"
           (CurrencyCodeValue)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _UMoney'currencyCode
               (\ x__ y__ -> x__{_UMoney'currencyCode = y__}))
              Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.defMessage
instance Data.ProtoLens.Field.HasField UMoney "maybe'currencyCode"
           (Prelude.Maybe CurrencyCodeValue)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _UMoney'currencyCode
               (\ x__ y__ -> x__{_UMoney'currencyCode = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message UMoney where
        messageName _ = Data.Text.pack "Basic.UMoney"
        fieldsByTag
          = let amount__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "amount"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"amount"))
                      :: Data.ProtoLens.FieldDescriptor UMoney
                currencyCode__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "currency_code"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor CurrencyCodeValue)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'currencyCode"))
                      :: Data.ProtoLens.FieldDescriptor UMoney
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, amount__field_descriptor),
                 (Data.ProtoLens.Tag 2, currencyCode__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _UMoney'_unknownFields
              (\ x__ y__ -> x__{_UMoney'_unknownFields = y__})
        defMessage
          = UMoney{_UMoney'amount = Data.ProtoLens.fieldDefault,
                   _UMoney'currencyCode = Prelude.Nothing,
                   _UMoney'_unknownFields = ([])}
        parseMessage
          = let loop :: UMoney -> Data.ProtoLens.Encoding.Bytes.Parser UMoney
                loop x
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 x)
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                8 -> do y <- (Data.ProtoLens.Encoding.Bytes.getVarInt)
                                               Data.ProtoLens.Encoding.Bytes.<?> "amount"
                                        loop
                                          (Lens.Family2.set (Data.ProtoLens.Field.field @"amount") y
                                             x)
                                18 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                    (Prelude.fromIntegral len)
                                                    Data.ProtoLens.parseMessage)
                                                Data.ProtoLens.Encoding.Bytes.<?> "currency_code"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"currencyCode")
                                              y
                                              x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "UMoney"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"amount") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      Data.ProtoLens.Encoding.Bytes.putVarInt _v)
                 Data.Monoid.<>
                 (case
                    Lens.Family2.view
                      (Data.ProtoLens.Field.field @"maybe'currencyCode")
                      _x
                    of
                      (Prelude.Nothing) -> Data.Monoid.mempty
                      Prelude.Just _v -> (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                                           Data.Monoid.<>
                                           (((\ bs ->
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                   (Prelude.fromIntegral
                                                      (Data.ByteString.length bs)))
                                                  Data.Monoid.<>
                                                  Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                              Prelude.. Data.ProtoLens.encodeMessage)
                                             _v)
                   Data.Monoid.<>
                   Data.ProtoLens.Encoding.Wire.buildFieldSet
                     (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData UMoney where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_UMoney'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_UMoney'amount x__)
                    (Control.DeepSeq.deepseq (_UMoney'currencyCode x__) (()))))