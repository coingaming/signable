{- This file was auto-generated from basic.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Basic (
        CurrencyCode(..), CurrencyCode(), CurrencyCode'UnrecognizedValue,
        CurrencyCodeValue(), Payload(), Payload'To(..), _Payload'UserIdTo,
        _Payload'MerchantIdTo, _Payload'InvoiceTo, RequestType(..),
        RequestType(), RequestType'UnrecognizedValue, UMoney()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
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
newtype CurrencyCode'UnrecognizedValue
  = CurrencyCode'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data CurrencyCode
  = BTC |
    EUR |
    USD |
    ETH |
    CurrencyCode'Unrecognized !CurrencyCode'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
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
    | (Prelude.==) k "BTC" = Prelude.Just BTC
    | (Prelude.==) k "EUR" = Prelude.Just EUR
    | (Prelude.==) k "USD" = Prelude.Just USD
    | (Prelude.==) k "ETH" = Prelude.Just ETH
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded CurrencyCode where
  minBound = BTC
  maxBound = ETH
instance Prelude.Enum CurrencyCode where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum CurrencyCode: "
              (Prelude.show k__)))
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
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Basic_Fields.value' @:: Lens' CurrencyCodeValue CurrencyCode@ -}
data CurrencyCodeValue
  = CurrencyCodeValue'_constructor {_CurrencyCodeValue'value :: !CurrencyCode,
                                    _CurrencyCodeValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CurrencyCodeValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CurrencyCodeValue "value" CurrencyCode where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CurrencyCodeValue'value
           (\ x__ y__ -> x__ {_CurrencyCodeValue'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message CurrencyCodeValue where
  messageName _ = Data.Text.pack "Basic.CurrencyCodeValue"
  packedMessageDescriptor _
    = "\n\
      \\DC1CurrencyCodeValue\DC2)\n\
      \\ENQvalue\CAN\SOH \SOH(\SO2\DC3.Basic.CurrencyCodeR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor CurrencyCode)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor CurrencyCodeValue
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CurrencyCodeValue'_unknownFields
        (\ x__ y__ -> x__ {_CurrencyCodeValue'_unknownFields = y__})
  defMessage
    = CurrencyCodeValue'_constructor
        {_CurrencyCodeValue'value = Data.ProtoLens.fieldDefault,
         _CurrencyCodeValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CurrencyCodeValue
          -> Data.ProtoLens.Encoding.Bytes.Parser CurrencyCodeValue
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CurrencyCodeValue"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData CurrencyCodeValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CurrencyCodeValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_CurrencyCodeValue'value x__) ())
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
         * 'Proto.Basic_Fields.invoiceTo' @:: Lens' Payload Proto.GoogleProtobuf.StringValue@ -}
data Payload
  = Payload'_constructor {_Payload'userIdFrom :: !Data.Word.Word64,
                          _Payload'amount :: !(Prelude.Maybe UMoney),
                          _Payload'requestType :: !RequestType,
                          _Payload'addFee :: !Prelude.Bool,
                          _Payload'comments :: !(Data.Vector.Vector Data.Text.Text),
                          _Payload'to :: !(Prelude.Maybe Payload'To),
                          _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Payload'To
  = Payload'UserIdTo !Data.Word.Word64 |
    Payload'MerchantIdTo !Data.Text.Text |
    Payload'InvoiceTo !Proto.GoogleProtobuf.StringValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Payload "userIdFrom" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'userIdFrom (\ x__ y__ -> x__ {_Payload'userIdFrom = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "amount" UMoney where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'amount (\ x__ y__ -> x__ {_Payload'amount = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Payload "maybe'amount" (Prelude.Maybe UMoney) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'amount (\ x__ y__ -> x__ {_Payload'amount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "requestType" RequestType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'requestType
           (\ x__ y__ -> x__ {_Payload'requestType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "addFee" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'addFee (\ x__ y__ -> x__ {_Payload'addFee = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "comments" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'comments (\ x__ y__ -> x__ {_Payload'comments = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Payload "vec'comments" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'comments (\ x__ y__ -> x__ {_Payload'comments = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "maybe'to" (Prelude.Maybe Payload'To) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "maybe'userIdTo" (Prelude.Maybe Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Payload'UserIdTo x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Payload'UserIdTo y__))
instance Data.ProtoLens.Field.HasField Payload "userIdTo" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Payload'UserIdTo x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Payload'UserIdTo y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Payload "maybe'merchantIdTo" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Payload'MerchantIdTo x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Payload'MerchantIdTo y__))
instance Data.ProtoLens.Field.HasField Payload "merchantIdTo" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Payload'MerchantIdTo x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Payload'MerchantIdTo y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Payload "maybe'invoiceTo" (Prelude.Maybe Proto.GoogleProtobuf.StringValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Payload'InvoiceTo x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Payload'InvoiceTo y__))
instance Data.ProtoLens.Field.HasField Payload "invoiceTo" Proto.GoogleProtobuf.StringValue where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'to (\ x__ y__ -> x__ {_Payload'to = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Payload'InvoiceTo x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Payload'InvoiceTo y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Payload where
  messageName _ = Data.Text.pack "Basic.Payload"
  packedMessageDescriptor _
    = "\n\
      \\aPayload\DC2 \n\
      \\fuser_id_from\CAN\SOH \SOH(\EOTR\n\
      \userIdFrom\DC2%\n\
      \\ACKamount\CAN\STX \SOH(\v2\r.Basic.UMoneyR\ACKamount\DC25\n\
      \\frequest_type\CAN\ETX \SOH(\SO2\DC2.Basic.RequestTypeR\vrequestType\DC2\ETB\n\
      \\aadd_fee\CAN\EOT \SOH(\bR\ACKaddFee\DC2\SUB\n\
      \\bcomments\CAN\ENQ \ETX(\tR\bcomments\DC2\RS\n\
      \\n\
      \user_id_to\CAN\ACK \SOH(\EOTH\NULR\buserIdTo\DC2&\n\
      \\SOmerchant_id_to\CAN\a \SOH(\tH\NULR\fmerchantIdTo\DC2=\n\
      \\n\
      \invoice_to\CAN\b \SOH(\v2\FS.Google.Protobuf.StringValueH\NULR\tinvoiceToB\EOT\n\
      \\STXto"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        userIdFrom__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "user_id_from"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"userIdFrom")) ::
              Data.ProtoLens.FieldDescriptor Payload
        amount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amount"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UMoney)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'amount")) ::
              Data.ProtoLens.FieldDescriptor Payload
        requestType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "request_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor RequestType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestType")) ::
              Data.ProtoLens.FieldDescriptor Payload
        addFee__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "add_fee"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"addFee")) ::
              Data.ProtoLens.FieldDescriptor Payload
        comments__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "comments"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"comments")) ::
              Data.ProtoLens.FieldDescriptor Payload
        userIdTo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "user_id_to"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'userIdTo")) ::
              Data.ProtoLens.FieldDescriptor Payload
        merchantIdTo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "merchant_id_to"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'merchantIdTo")) ::
              Data.ProtoLens.FieldDescriptor Payload
        invoiceTo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "invoice_to"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.GoogleProtobuf.StringValue)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'invoiceTo")) ::
              Data.ProtoLens.FieldDescriptor Payload
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
    = Lens.Family2.Unchecked.lens
        _Payload'_unknownFields
        (\ x__ y__ -> x__ {_Payload'_unknownFields = y__})
  defMessage
    = Payload'_constructor
        {_Payload'userIdFrom = Data.ProtoLens.fieldDefault,
         _Payload'amount = Prelude.Nothing,
         _Payload'requestType = Data.ProtoLens.fieldDefault,
         _Payload'addFee = Data.ProtoLens.fieldDefault,
         _Payload'comments = Data.Vector.Generic.empty,
         _Payload'to = Prelude.Nothing, _Payload'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Payload
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser Payload
        loop x mutable'comments
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'comments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'comments)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'comments") frozen'comments x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "user_id_from"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"userIdFrom") y x)
                                  mutable'comments
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "amount"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"amount") y x)
                                  mutable'comments
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "request_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"requestType") y x)
                                  mutable'comments
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "add_fee"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"addFee") y x)
                                  mutable'comments
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "comments"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'comments y)
                                loop x v
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "user_id_to"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"userIdTo") y x)
                                  mutable'comments
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "merchant_id_to"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"merchantIdTo") y x)
                                  mutable'comments
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "invoice_to"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"invoiceTo") y x)
                                  mutable'comments
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'comments
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'comments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'comments)
          "Payload"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"userIdFrom") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'amount") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"requestType") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               Prelude.fromEnum
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"addFee") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0)
                                  _v))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.Text.Encoding.encodeUtf8
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'comments") _x))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'to") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just (Payload'UserIdTo v))
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt v)
                               (Prelude.Just (Payload'MerchantIdTo v))
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.Text.Encoding.encodeUtf8
                                         v)
                               (Prelude.Just (Payload'InvoiceTo v))
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.ProtoLens.encodeMessage
                                         v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData Payload where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Payload'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Payload'userIdFrom x__)
                (Control.DeepSeq.deepseq
                   (_Payload'amount x__)
                   (Control.DeepSeq.deepseq
                      (_Payload'requestType x__)
                      (Control.DeepSeq.deepseq
                         (_Payload'addFee x__)
                         (Control.DeepSeq.deepseq
                            (_Payload'comments x__)
                            (Control.DeepSeq.deepseq (_Payload'to x__) ()))))))
instance Control.DeepSeq.NFData Payload'To where
  rnf (Payload'UserIdTo x__) = Control.DeepSeq.rnf x__
  rnf (Payload'MerchantIdTo x__) = Control.DeepSeq.rnf x__
  rnf (Payload'InvoiceTo x__) = Control.DeepSeq.rnf x__
_Payload'UserIdTo ::
  Data.ProtoLens.Prism.Prism' Payload'To Data.Word.Word64
_Payload'UserIdTo
  = Data.ProtoLens.Prism.prism'
      Payload'UserIdTo
      (\ p__
         -> case p__ of
              (Payload'UserIdTo p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Payload'MerchantIdTo ::
  Data.ProtoLens.Prism.Prism' Payload'To Data.Text.Text
_Payload'MerchantIdTo
  = Data.ProtoLens.Prism.prism'
      Payload'MerchantIdTo
      (\ p__
         -> case p__ of
              (Payload'MerchantIdTo p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Payload'InvoiceTo ::
  Data.ProtoLens.Prism.Prism' Payload'To Proto.GoogleProtobuf.StringValue
_Payload'InvoiceTo
  = Data.ProtoLens.Prism.prism'
      Payload'InvoiceTo
      (\ p__
         -> case p__ of
              (Payload'InvoiceTo p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
newtype RequestType'UnrecognizedValue
  = RequestType'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data RequestType
  = USER |
    LEDGER |
    RequestType'Unrecognized !RequestType'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
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
    | (Prelude.==) k "USER" = Prelude.Just USER
    | (Prelude.==) k "LEDGER" = Prelude.Just LEDGER
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded RequestType where
  minBound = USER
  maxBound = LEDGER
instance Prelude.Enum RequestType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum RequestType: " (Prelude.show k__)))
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
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Basic_Fields.amount' @:: Lens' UMoney Data.Word.Word64@
         * 'Proto.Basic_Fields.currencyCode' @:: Lens' UMoney CurrencyCodeValue@
         * 'Proto.Basic_Fields.maybe'currencyCode' @:: Lens' UMoney (Prelude.Maybe CurrencyCodeValue)@ -}
data UMoney
  = UMoney'_constructor {_UMoney'amount :: !Data.Word.Word64,
                         _UMoney'currencyCode :: !(Prelude.Maybe CurrencyCodeValue),
                         _UMoney'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UMoney where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UMoney "amount" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UMoney'amount (\ x__ y__ -> x__ {_UMoney'amount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UMoney "currencyCode" CurrencyCodeValue where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UMoney'currencyCode
           (\ x__ y__ -> x__ {_UMoney'currencyCode = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UMoney "maybe'currencyCode" (Prelude.Maybe CurrencyCodeValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UMoney'currencyCode
           (\ x__ y__ -> x__ {_UMoney'currencyCode = y__}))
        Prelude.id
instance Data.ProtoLens.Message UMoney where
  messageName _ = Data.Text.pack "Basic.UMoney"
  packedMessageDescriptor _
    = "\n\
      \\ACKUMoney\DC2\SYN\n\
      \\ACKamount\CAN\SOH \SOH(\EOTR\ACKamount\DC2=\n\
      \\rcurrency_code\CAN\STX \SOH(\v2\CAN.Basic.CurrencyCodeValueR\fcurrencyCode"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        amount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amount"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"amount")) ::
              Data.ProtoLens.FieldDescriptor UMoney
        currencyCode__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "currency_code"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor CurrencyCodeValue)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'currencyCode")) ::
              Data.ProtoLens.FieldDescriptor UMoney
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, amount__field_descriptor),
           (Data.ProtoLens.Tag 2, currencyCode__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UMoney'_unknownFields
        (\ x__ y__ -> x__ {_UMoney'_unknownFields = y__})
  defMessage
    = UMoney'_constructor
        {_UMoney'amount = Data.ProtoLens.fieldDefault,
         _UMoney'currencyCode = Prelude.Nothing,
         _UMoney'_unknownFields = []}
  parseMessage
    = let
        loop :: UMoney -> Data.ProtoLens.Encoding.Bytes.Parser UMoney
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "amount"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"amount") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "currency_code"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"currencyCode") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UMoney"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"amount") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'currencyCode") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData UMoney where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UMoney'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UMoney'amount x__)
                (Control.DeepSeq.deepseq (_UMoney'currencyCode x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\vbasic.proto\DC2\ENQBasic\SUB\NAKgoogle_protobuf.proto\"\203\STX\n\
    \\aPayload\DC2 \n\
    \\fuser_id_from\CAN\SOH \SOH(\EOTR\n\
    \userIdFrom\DC2%\n\
    \\ACKamount\CAN\STX \SOH(\v2\r.Basic.UMoneyR\ACKamount\DC25\n\
    \\frequest_type\CAN\ETX \SOH(\SO2\DC2.Basic.RequestTypeR\vrequestType\DC2\ETB\n\
    \\aadd_fee\CAN\EOT \SOH(\bR\ACKaddFee\DC2\SUB\n\
    \\bcomments\CAN\ENQ \ETX(\tR\bcomments\DC2\RS\n\
    \\n\
    \user_id_to\CAN\ACK \SOH(\EOTH\NULR\buserIdTo\DC2&\n\
    \\SOmerchant_id_to\CAN\a \SOH(\tH\NULR\fmerchantIdTo\DC2=\n\
    \\n\
    \invoice_to\CAN\b \SOH(\v2\FS.Google.Protobuf.StringValueH\NULR\tinvoiceToB\EOT\n\
    \\STXto\"_\n\
    \\ACKUMoney\DC2\SYN\n\
    \\ACKamount\CAN\SOH \SOH(\EOTR\ACKamount\DC2=\n\
    \\rcurrency_code\CAN\STX \SOH(\v2\CAN.Basic.CurrencyCodeValueR\fcurrencyCode\">\n\
    \\DC1CurrencyCodeValue\DC2)\n\
    \\ENQvalue\CAN\SOH \SOH(\SO2\DC3.Basic.CurrencyCodeR\ENQvalue*2\n\
    \\fCurrencyCode\DC2\a\n\
    \\ETXBTC\DLE\NUL\DC2\a\n\
    \\ETXEUR\DLE\SOH\DC2\a\n\
    \\ETXUSD\DLE\STX\DC2\a\n\
    \\ETXETH\DLE\ETX*#\n\
    \\vRequestType\DC2\b\n\
    \\EOTUSER\DLE\NUL\DC2\n\
    \\n\
    \\ACKLEDGER\DLE\SOHJ\156\b\n\
    \\ACK\DC2\EOT\NUL\NUL%\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\SOH\NUL\SO\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\ETX\NUL\US\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ENQ\NUL\DLE\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ENQ\b\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\ACK\STX\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\ACK\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\ACK\t\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\ACK\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\a\STX\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\a\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\a\t\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\a\DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX\b\STX\US\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ACK\DC2\ETX\b\STX\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX\b\SO\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX\b\GS\RS\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETX\t\STX\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ENQ\DC2\ETX\t\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETX\t\a\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETX\t\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\EOT\DC2\ETX\n\
    \\STX\US\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\EOT\DC2\ETX\n\
    \\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ENQ\DC2\ETX\n\
    \\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\SOH\DC2\ETX\n\
    \\DC2\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ETX\DC2\ETX\n\
    \\GS\RS\n\
    \\f\n\
    \\EOT\EOT\NUL\b\NUL\DC2\EOT\v\STX\SI\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\b\NUL\SOH\DC2\ETX\v\b\n\
    \\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\ENQ\DC2\ETX\f\EOT\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ENQ\DC2\ETX\f\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\SOH\DC2\ETX\f\v\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ETX\DC2\ETX\f\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\ACK\DC2\ETX\r\EOT\RS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ENQ\DC2\ETX\r\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\SOH\DC2\ETX\r\v\EM\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ETX\DC2\ETX\r\FS\GS\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\a\DC2\ETX\SO\EOT/\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\a\ACK\DC2\ETX\SO\EOT\US\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\a\SOH\DC2\ETX\SO *\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\a\ETX\DC2\ETX\SO-.\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\DC2\NUL\NAK\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\DC2\b\SO\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\DC3\STX\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\DC3\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\DC3\t\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\DC3\DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\DC4\STX&\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETX\DC4\STX\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\DC4\DC4!\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\DC4$%\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT\ETB\NUL\EM\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX\ETB\b\EM\n\
    \\v\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX\CAN\STX\EM\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ACK\DC2\ETX\CAN\STX\SO\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX\CAN\SI\DC4\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX\CAN\ETB\CAN\n\
    \\n\
    \\n\
    \\STX\ENQ\NUL\DC2\EOT\ESC\NUL \SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX\ESC\ENQ\DC1\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX\FS\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX\FS\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX\FS\b\t\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETX\GS\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETX\GS\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETX\GS\b\t\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\ETX\RS\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\ETX\RS\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\ETX\RS\b\t\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\ETX\DC2\ETX\US\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\SOH\DC2\ETX\US\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\STX\DC2\ETX\US\b\t\n\
    \\n\
    \\n\
    \\STX\ENQ\SOH\DC2\EOT\"\NUL%\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\SOH\SOH\DC2\ETX\"\ENQ\DLE\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\NUL\DC2\ETX#\STX\v\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\SOH\DC2\ETX#\STX\ACK\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\STX\DC2\ETX#\t\n\
    \\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\SOH\DC2\ETX$\STX\r\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\SOH\DC2\ETX$\STX\b\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\STX\DC2\ETX$\v\fb\ACKproto3"