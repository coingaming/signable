{- This file was auto-generated from coins.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Coins (
        CurrencyCode(..), CurrencyCode(), CurrencyCode'UnrecognizedValue,
        CurrencyCodeValue(), InvoiceType(..), InvoiceType(),
        InvoiceType'UnrecognizedValue, LightningInvoice(), Request(),
        Request'LedgerTransferRequest(), Request'UserTransferRequest(),
        Request'UserTransferRequest'To(..),
        _Request'UserTransferRequest'MerchantIdTo,
        _Request'UserTransferRequest'Invoice, UDecimal(), UMoney(),
        UserRequest()
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
     
         * 'Proto.Coins_Fields.value' @:: Lens' CurrencyCodeValue CurrencyCode@ -}
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
  messageName _ = Data.Text.pack "Coins.CurrencyCodeValue"
  packedMessageDescriptor _
    = "\n\
      \\DC1CurrencyCodeValue\DC2)\n\
      \\ENQvalue\CAN\SOH \SOH(\SO2\DC3.Coins.CurrencyCodeR\ENQvalue"
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
newtype InvoiceType'UnrecognizedValue
  = InvoiceType'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data InvoiceType
  = REGULAR |
    HODL |
    InvoiceType'Unrecognized !InvoiceType'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum InvoiceType where
  maybeToEnum 0 = Prelude.Just REGULAR
  maybeToEnum 1 = Prelude.Just HODL
  maybeToEnum k
    = Prelude.Just
        (InvoiceType'Unrecognized
           (InvoiceType'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum REGULAR = "REGULAR"
  showEnum HODL = "HODL"
  showEnum
    (InvoiceType'Unrecognized (InvoiceType'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "REGULAR" = Prelude.Just REGULAR
    | (Prelude.==) k "HODL" = Prelude.Just HODL
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded InvoiceType where
  minBound = REGULAR
  maxBound = HODL
instance Prelude.Enum InvoiceType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum InvoiceType: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum REGULAR = 0
  fromEnum HODL = 1
  fromEnum
    (InvoiceType'Unrecognized (InvoiceType'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ HODL
    = Prelude.error
        "InvoiceType.succ: bad argument HODL. This value would be out of bounds."
  succ REGULAR = HODL
  succ (InvoiceType'Unrecognized _)
    = Prelude.error
        "InvoiceType.succ: bad argument: unrecognized value"
  pred REGULAR
    = Prelude.error
        "InvoiceType.pred: bad argument REGULAR. This value would be out of bounds."
  pred HODL = REGULAR
  pred (InvoiceType'Unrecognized _)
    = Prelude.error
        "InvoiceType.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault InvoiceType where
  fieldDefault = REGULAR
instance Control.DeepSeq.NFData InvoiceType where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Coins_Fields.rHash' @:: Lens' LightningInvoice Data.ByteString.ByteString@
         * 'Proto.Coins_Fields.paymentRequest' @:: Lens' LightningInvoice Data.Text.Text@
         * 'Proto.Coins_Fields.invoiceType' @:: Lens' LightningInvoice InvoiceType@ -}
data LightningInvoice
  = LightningInvoice'_constructor {_LightningInvoice'rHash :: !Data.ByteString.ByteString,
                                   _LightningInvoice'paymentRequest :: !Data.Text.Text,
                                   _LightningInvoice'invoiceType :: !InvoiceType,
                                   _LightningInvoice'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show LightningInvoice where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField LightningInvoice "rHash" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LightningInvoice'rHash
           (\ x__ y__ -> x__ {_LightningInvoice'rHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LightningInvoice "paymentRequest" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LightningInvoice'paymentRequest
           (\ x__ y__ -> x__ {_LightningInvoice'paymentRequest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LightningInvoice "invoiceType" InvoiceType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LightningInvoice'invoiceType
           (\ x__ y__ -> x__ {_LightningInvoice'invoiceType = y__}))
        Prelude.id
instance Data.ProtoLens.Message LightningInvoice where
  messageName _ = Data.Text.pack "Coins.LightningInvoice"
  packedMessageDescriptor _
    = "\n\
      \\DLELightningInvoice\DC2\NAK\n\
      \\ACKr_hash\CAN\SOH \SOH(\fR\ENQrHash\DC2'\n\
      \\SIpayment_request\CAN\STX \SOH(\tR\SOpaymentRequest\DC25\n\
      \\finvoice_type\CAN\ETX \SOH(\SO2\DC2.Coins.InvoiceTypeR\vinvoiceType"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        rHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "r_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"rHash")) ::
              Data.ProtoLens.FieldDescriptor LightningInvoice
        paymentRequest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "payment_request"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"paymentRequest")) ::
              Data.ProtoLens.FieldDescriptor LightningInvoice
        invoiceType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "invoice_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor InvoiceType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"invoiceType")) ::
              Data.ProtoLens.FieldDescriptor LightningInvoice
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, rHash__field_descriptor),
           (Data.ProtoLens.Tag 2, paymentRequest__field_descriptor),
           (Data.ProtoLens.Tag 3, invoiceType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LightningInvoice'_unknownFields
        (\ x__ y__ -> x__ {_LightningInvoice'_unknownFields = y__})
  defMessage
    = LightningInvoice'_constructor
        {_LightningInvoice'rHash = Data.ProtoLens.fieldDefault,
         _LightningInvoice'paymentRequest = Data.ProtoLens.fieldDefault,
         _LightningInvoice'invoiceType = Data.ProtoLens.fieldDefault,
         _LightningInvoice'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LightningInvoice
          -> Data.ProtoLens.Encoding.Bytes.Parser LightningInvoice
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "r_hash"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"rHash") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "payment_request"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"paymentRequest") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "invoice_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"invoiceType") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LightningInvoice"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"rHash") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"paymentRequest") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"invoiceType") _x
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
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData LightningInvoice where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LightningInvoice'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_LightningInvoice'rHash x__)
                (Control.DeepSeq.deepseq
                   (_LightningInvoice'paymentRequest x__)
                   (Control.DeepSeq.deepseq (_LightningInvoice'invoiceType x__) ())))
{- | Fields :
     
         * 'Proto.Coins_Fields.ledgerTransferRequest' @:: Lens' Request Request'LedgerTransferRequest@
         * 'Proto.Coins_Fields.maybe'ledgerTransferRequest' @:: Lens' Request (Prelude.Maybe Request'LedgerTransferRequest)@
         * 'Proto.Coins_Fields.ledgerSignature' @:: Lens' Request Data.ByteString.ByteString@ -}
data Request
  = Request'_constructor {_Request'ledgerTransferRequest :: !(Prelude.Maybe Request'LedgerTransferRequest),
                          _Request'ledgerSignature :: !Data.ByteString.ByteString,
                          _Request'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Request where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Request "ledgerTransferRequest" Request'LedgerTransferRequest where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'ledgerTransferRequest
           (\ x__ y__ -> x__ {_Request'ledgerTransferRequest = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Request "maybe'ledgerTransferRequest" (Prelude.Maybe Request'LedgerTransferRequest) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'ledgerTransferRequest
           (\ x__ y__ -> x__ {_Request'ledgerTransferRequest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request "ledgerSignature" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'ledgerSignature
           (\ x__ y__ -> x__ {_Request'ledgerSignature = y__}))
        Prelude.id
instance Data.ProtoLens.Message Request where
  messageName _ = Data.Text.pack "Coins.Request"
  packedMessageDescriptor _
    = "\n\
      \\aRequest\DC2\\\n\
      \\ETBledger_transfer_request\CAN\SOH \SOH(\v2$.Coins.Request.LedgerTransferRequestR\NAKledgerTransferRequest\DC2)\n\
      \\DLEledger_signature\CAN\STX \SOH(\fR\SIledgerSignature\SUB\201\SOH\n\
      \\NAKLedgerTransferRequest\DC2V\n\
      \\NAKuser_transfer_request\CAN\SOH \SOH(\v2\".Coins.Request.UserTransferRequestR\DC3userTransferRequest\DC2%\n\
      \\SOuser_signature\CAN\STX \SOH(\fR\ruserSignature\DC21\n\
      \\ainvoice\CAN\ETX \SOH(\v2\ETB.Coins.LightningInvoiceR\ainvoice\SUB\175\SOH\n\
      \\DC3UserTransferRequest\DC25\n\
      \\fuser_request\CAN\SOH \SOH(\v2\DC2.Coins.UserRequestR\vuserRequest\DC2&\n\
      \\SOmerchant_id_to\CAN\STX \SOH(\EOTH\NULR\fmerchantIdTo\DC23\n\
      \\ainvoice\CAN\ETX \SOH(\v2\ETB.Coins.LightningInvoiceH\NULR\ainvoiceB\EOT\n\
      \\STXto"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        ledgerTransferRequest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ledger_transfer_request"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Request'LedgerTransferRequest)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'ledgerTransferRequest")) ::
              Data.ProtoLens.FieldDescriptor Request
        ledgerSignature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ledger_signature"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"ledgerSignature")) ::
              Data.ProtoLens.FieldDescriptor Request
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, ledgerTransferRequest__field_descriptor),
           (Data.ProtoLens.Tag 2, ledgerSignature__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Request'_unknownFields
        (\ x__ y__ -> x__ {_Request'_unknownFields = y__})
  defMessage
    = Request'_constructor
        {_Request'ledgerTransferRequest = Prelude.Nothing,
         _Request'ledgerSignature = Data.ProtoLens.fieldDefault,
         _Request'_unknownFields = []}
  parseMessage
    = let
        loop :: Request -> Data.ProtoLens.Encoding.Bytes.Parser Request
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "ledger_transfer_request"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"ledgerTransferRequest") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "ledger_signature"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"ledgerSignature") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Request"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'ledgerTransferRequest") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
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
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"ledgerSignature") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Request where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Request'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Request'ledgerTransferRequest x__)
                (Control.DeepSeq.deepseq (_Request'ledgerSignature x__) ()))
{- | Fields :
     
         * 'Proto.Coins_Fields.userTransferRequest' @:: Lens' Request'LedgerTransferRequest Request'UserTransferRequest@
         * 'Proto.Coins_Fields.maybe'userTransferRequest' @:: Lens' Request'LedgerTransferRequest (Prelude.Maybe Request'UserTransferRequest)@
         * 'Proto.Coins_Fields.userSignature' @:: Lens' Request'LedgerTransferRequest Data.ByteString.ByteString@
         * 'Proto.Coins_Fields.invoice' @:: Lens' Request'LedgerTransferRequest LightningInvoice@
         * 'Proto.Coins_Fields.maybe'invoice' @:: Lens' Request'LedgerTransferRequest (Prelude.Maybe LightningInvoice)@ -}
data Request'LedgerTransferRequest
  = Request'LedgerTransferRequest'_constructor {_Request'LedgerTransferRequest'userTransferRequest :: !(Prelude.Maybe Request'UserTransferRequest),
                                                _Request'LedgerTransferRequest'userSignature :: !Data.ByteString.ByteString,
                                                _Request'LedgerTransferRequest'invoice :: !(Prelude.Maybe LightningInvoice),
                                                _Request'LedgerTransferRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Request'LedgerTransferRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Request'LedgerTransferRequest "userTransferRequest" Request'UserTransferRequest where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'LedgerTransferRequest'userTransferRequest
           (\ x__ y__
              -> x__ {_Request'LedgerTransferRequest'userTransferRequest = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Request'LedgerTransferRequest "maybe'userTransferRequest" (Prelude.Maybe Request'UserTransferRequest) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'LedgerTransferRequest'userTransferRequest
           (\ x__ y__
              -> x__ {_Request'LedgerTransferRequest'userTransferRequest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request'LedgerTransferRequest "userSignature" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'LedgerTransferRequest'userSignature
           (\ x__ y__
              -> x__ {_Request'LedgerTransferRequest'userSignature = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request'LedgerTransferRequest "invoice" LightningInvoice where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'LedgerTransferRequest'invoice
           (\ x__ y__ -> x__ {_Request'LedgerTransferRequest'invoice = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Request'LedgerTransferRequest "maybe'invoice" (Prelude.Maybe LightningInvoice) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'LedgerTransferRequest'invoice
           (\ x__ y__ -> x__ {_Request'LedgerTransferRequest'invoice = y__}))
        Prelude.id
instance Data.ProtoLens.Message Request'LedgerTransferRequest where
  messageName _
    = Data.Text.pack "Coins.Request.LedgerTransferRequest"
  packedMessageDescriptor _
    = "\n\
      \\NAKLedgerTransferRequest\DC2V\n\
      \\NAKuser_transfer_request\CAN\SOH \SOH(\v2\".Coins.Request.UserTransferRequestR\DC3userTransferRequest\DC2%\n\
      \\SOuser_signature\CAN\STX \SOH(\fR\ruserSignature\DC21\n\
      \\ainvoice\CAN\ETX \SOH(\v2\ETB.Coins.LightningInvoiceR\ainvoice"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        userTransferRequest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "user_transfer_request"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Request'UserTransferRequest)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'userTransferRequest")) ::
              Data.ProtoLens.FieldDescriptor Request'LedgerTransferRequest
        userSignature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "user_signature"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"userSignature")) ::
              Data.ProtoLens.FieldDescriptor Request'LedgerTransferRequest
        invoice__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "invoice"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor LightningInvoice)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'invoice")) ::
              Data.ProtoLens.FieldDescriptor Request'LedgerTransferRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, userTransferRequest__field_descriptor),
           (Data.ProtoLens.Tag 2, userSignature__field_descriptor),
           (Data.ProtoLens.Tag 3, invoice__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Request'LedgerTransferRequest'_unknownFields
        (\ x__ y__
           -> x__ {_Request'LedgerTransferRequest'_unknownFields = y__})
  defMessage
    = Request'LedgerTransferRequest'_constructor
        {_Request'LedgerTransferRequest'userTransferRequest = Prelude.Nothing,
         _Request'LedgerTransferRequest'userSignature = Data.ProtoLens.fieldDefault,
         _Request'LedgerTransferRequest'invoice = Prelude.Nothing,
         _Request'LedgerTransferRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Request'LedgerTransferRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser Request'LedgerTransferRequest
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "user_transfer_request"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"userTransferRequest") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "user_signature"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"userSignature") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "invoice"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"invoice") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LedgerTransferRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'userTransferRequest") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
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
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"userSignature") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'invoice") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Request'LedgerTransferRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Request'LedgerTransferRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Request'LedgerTransferRequest'userTransferRequest x__)
                (Control.DeepSeq.deepseq
                   (_Request'LedgerTransferRequest'userSignature x__)
                   (Control.DeepSeq.deepseq
                      (_Request'LedgerTransferRequest'invoice x__) ())))
{- | Fields :
     
         * 'Proto.Coins_Fields.userRequest' @:: Lens' Request'UserTransferRequest UserRequest@
         * 'Proto.Coins_Fields.maybe'userRequest' @:: Lens' Request'UserTransferRequest (Prelude.Maybe UserRequest)@
         * 'Proto.Coins_Fields.maybe'to' @:: Lens' Request'UserTransferRequest (Prelude.Maybe Request'UserTransferRequest'To)@
         * 'Proto.Coins_Fields.maybe'merchantIdTo' @:: Lens' Request'UserTransferRequest (Prelude.Maybe Data.Word.Word64)@
         * 'Proto.Coins_Fields.merchantIdTo' @:: Lens' Request'UserTransferRequest Data.Word.Word64@
         * 'Proto.Coins_Fields.maybe'invoice' @:: Lens' Request'UserTransferRequest (Prelude.Maybe LightningInvoice)@
         * 'Proto.Coins_Fields.invoice' @:: Lens' Request'UserTransferRequest LightningInvoice@ -}
data Request'UserTransferRequest
  = Request'UserTransferRequest'_constructor {_Request'UserTransferRequest'userRequest :: !(Prelude.Maybe UserRequest),
                                              _Request'UserTransferRequest'to :: !(Prelude.Maybe Request'UserTransferRequest'To),
                                              _Request'UserTransferRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Request'UserTransferRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Request'UserTransferRequest'To
  = Request'UserTransferRequest'MerchantIdTo !Data.Word.Word64 |
    Request'UserTransferRequest'Invoice !LightningInvoice
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "userRequest" UserRequest where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'userRequest
           (\ x__ y__
              -> x__ {_Request'UserTransferRequest'userRequest = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "maybe'userRequest" (Prelude.Maybe UserRequest) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'userRequest
           (\ x__ y__
              -> x__ {_Request'UserTransferRequest'userRequest = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "maybe'to" (Prelude.Maybe Request'UserTransferRequest'To) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'to
           (\ x__ y__ -> x__ {_Request'UserTransferRequest'to = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "maybe'merchantIdTo" (Prelude.Maybe Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'to
           (\ x__ y__ -> x__ {_Request'UserTransferRequest'to = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Request'UserTransferRequest'MerchantIdTo x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__
              -> Prelude.fmap Request'UserTransferRequest'MerchantIdTo y__))
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "merchantIdTo" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'to
           (\ x__ y__ -> x__ {_Request'UserTransferRequest'to = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Request'UserTransferRequest'MerchantIdTo x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__
                 -> Prelude.fmap Request'UserTransferRequest'MerchantIdTo y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "maybe'invoice" (Prelude.Maybe LightningInvoice) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'to
           (\ x__ y__ -> x__ {_Request'UserTransferRequest'to = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Request'UserTransferRequest'Invoice x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Request'UserTransferRequest'Invoice y__))
instance Data.ProtoLens.Field.HasField Request'UserTransferRequest "invoice" LightningInvoice where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'UserTransferRequest'to
           (\ x__ y__ -> x__ {_Request'UserTransferRequest'to = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Request'UserTransferRequest'Invoice x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Request'UserTransferRequest'Invoice y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Request'UserTransferRequest where
  messageName _ = Data.Text.pack "Coins.Request.UserTransferRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3UserTransferRequest\DC25\n\
      \\fuser_request\CAN\SOH \SOH(\v2\DC2.Coins.UserRequestR\vuserRequest\DC2&\n\
      \\SOmerchant_id_to\CAN\STX \SOH(\EOTH\NULR\fmerchantIdTo\DC23\n\
      \\ainvoice\CAN\ETX \SOH(\v2\ETB.Coins.LightningInvoiceH\NULR\ainvoiceB\EOT\n\
      \\STXto"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        userRequest__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "user_request"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UserRequest)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'userRequest")) ::
              Data.ProtoLens.FieldDescriptor Request'UserTransferRequest
        merchantIdTo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "merchant_id_to"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'merchantIdTo")) ::
              Data.ProtoLens.FieldDescriptor Request'UserTransferRequest
        invoice__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "invoice"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor LightningInvoice)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'invoice")) ::
              Data.ProtoLens.FieldDescriptor Request'UserTransferRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, userRequest__field_descriptor),
           (Data.ProtoLens.Tag 2, merchantIdTo__field_descriptor),
           (Data.ProtoLens.Tag 3, invoice__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Request'UserTransferRequest'_unknownFields
        (\ x__ y__
           -> x__ {_Request'UserTransferRequest'_unknownFields = y__})
  defMessage
    = Request'UserTransferRequest'_constructor
        {_Request'UserTransferRequest'userRequest = Prelude.Nothing,
         _Request'UserTransferRequest'to = Prelude.Nothing,
         _Request'UserTransferRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Request'UserTransferRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser Request'UserTransferRequest
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "user_request"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"userRequest") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "merchant_id_to"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"merchantIdTo") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "invoice"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"invoice") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UserTransferRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'userRequest") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'to") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just (Request'UserTransferRequest'MerchantIdTo v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt v)
                   (Prelude.Just (Request'UserTransferRequest'Invoice v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Request'UserTransferRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Request'UserTransferRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Request'UserTransferRequest'userRequest x__)
                (Control.DeepSeq.deepseq (_Request'UserTransferRequest'to x__) ()))
instance Control.DeepSeq.NFData Request'UserTransferRequest'To where
  rnf (Request'UserTransferRequest'MerchantIdTo x__)
    = Control.DeepSeq.rnf x__
  rnf (Request'UserTransferRequest'Invoice x__)
    = Control.DeepSeq.rnf x__
_Request'UserTransferRequest'MerchantIdTo ::
  Data.ProtoLens.Prism.Prism' Request'UserTransferRequest'To Data.Word.Word64
_Request'UserTransferRequest'MerchantIdTo
  = Data.ProtoLens.Prism.prism'
      Request'UserTransferRequest'MerchantIdTo
      (\ p__
         -> case p__ of
              (Request'UserTransferRequest'MerchantIdTo p__val)
                -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Request'UserTransferRequest'Invoice ::
  Data.ProtoLens.Prism.Prism' Request'UserTransferRequest'To LightningInvoice
_Request'UserTransferRequest'Invoice
  = Data.ProtoLens.Prism.prism'
      Request'UserTransferRequest'Invoice
      (\ p__
         -> case p__ of
              (Request'UserTransferRequest'Invoice p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Coins_Fields.coef' @:: Lens' UDecimal Data.Word.Word64@
         * 'Proto.Coins_Fields.exp' @:: Lens' UDecimal Data.Int.Int32@ -}
data UDecimal
  = UDecimal'_constructor {_UDecimal'coef :: !Data.Word.Word64,
                           _UDecimal'exp :: !Data.Int.Int32,
                           _UDecimal'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UDecimal where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UDecimal "coef" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UDecimal'coef (\ x__ y__ -> x__ {_UDecimal'coef = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UDecimal "exp" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UDecimal'exp (\ x__ y__ -> x__ {_UDecimal'exp = y__}))
        Prelude.id
instance Data.ProtoLens.Message UDecimal where
  messageName _ = Data.Text.pack "Coins.UDecimal"
  packedMessageDescriptor _
    = "\n\
      \\bUDecimal\DC2\DC2\n\
      \\EOTcoef\CAN\SOH \SOH(\EOTR\EOTcoef\DC2\DLE\n\
      \\ETXexp\CAN\STX \SOH(\ENQR\ETXexp"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        coef__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "coef"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"coef")) ::
              Data.ProtoLens.FieldDescriptor UDecimal
        exp__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "exp"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"exp")) ::
              Data.ProtoLens.FieldDescriptor UDecimal
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, coef__field_descriptor),
           (Data.ProtoLens.Tag 2, exp__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UDecimal'_unknownFields
        (\ x__ y__ -> x__ {_UDecimal'_unknownFields = y__})
  defMessage
    = UDecimal'_constructor
        {_UDecimal'coef = Data.ProtoLens.fieldDefault,
         _UDecimal'exp = Data.ProtoLens.fieldDefault,
         _UDecimal'_unknownFields = []}
  parseMessage
    = let
        loop :: UDecimal -> Data.ProtoLens.Encoding.Bytes.Parser UDecimal
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
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "coef"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"coef") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "exp"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"exp") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UDecimal"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"coef") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"exp") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData UDecimal where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UDecimal'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UDecimal'coef x__)
                (Control.DeepSeq.deepseq (_UDecimal'exp x__) ()))
{- | Fields :
     
         * 'Proto.Coins_Fields.amount' @:: Lens' UMoney UDecimal@
         * 'Proto.Coins_Fields.maybe'amount' @:: Lens' UMoney (Prelude.Maybe UDecimal)@
         * 'Proto.Coins_Fields.currencyCode' @:: Lens' UMoney CurrencyCodeValue@
         * 'Proto.Coins_Fields.maybe'currencyCode' @:: Lens' UMoney (Prelude.Maybe CurrencyCodeValue)@ -}
data UMoney
  = UMoney'_constructor {_UMoney'amount :: !(Prelude.Maybe UDecimal),
                         _UMoney'currencyCode :: !(Prelude.Maybe CurrencyCodeValue),
                         _UMoney'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UMoney where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UMoney "amount" UDecimal where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UMoney'amount (\ x__ y__ -> x__ {_UMoney'amount = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UMoney "maybe'amount" (Prelude.Maybe UDecimal) where
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
  messageName _ = Data.Text.pack "Coins.UMoney"
  packedMessageDescriptor _
    = "\n\
      \\ACKUMoney\DC2'\n\
      \\ACKamount\CAN\SOH \SOH(\v2\SI.Coins.UDecimalR\ACKamount\DC2=\n\
      \\rcurrency_code\CAN\STX \SOH(\v2\CAN.Coins.CurrencyCodeValueR\fcurrencyCode"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        amount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amount"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UDecimal)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'amount")) ::
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
        {_UMoney'amount = Prelude.Nothing,
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "amount"
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
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'amount") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
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
{- | Fields :
     
         * 'Proto.Coins_Fields.pubKeyUidFrom' @:: Lens' UserRequest Data.ByteString.ByteString@
         * 'Proto.Coins_Fields.amount' @:: Lens' UserRequest UMoney@
         * 'Proto.Coins_Fields.maybe'amount' @:: Lens' UserRequest (Prelude.Maybe UMoney)@
         * 'Proto.Coins_Fields.requestId' @:: Lens' UserRequest Data.ByteString.ByteString@ -}
data UserRequest
  = UserRequest'_constructor {_UserRequest'pubKeyUidFrom :: !Data.ByteString.ByteString,
                              _UserRequest'amount :: !(Prelude.Maybe UMoney),
                              _UserRequest'requestId :: !Data.ByteString.ByteString,
                              _UserRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UserRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UserRequest "pubKeyUidFrom" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UserRequest'pubKeyUidFrom
           (\ x__ y__ -> x__ {_UserRequest'pubKeyUidFrom = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UserRequest "amount" UMoney where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UserRequest'amount (\ x__ y__ -> x__ {_UserRequest'amount = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UserRequest "maybe'amount" (Prelude.Maybe UMoney) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UserRequest'amount (\ x__ y__ -> x__ {_UserRequest'amount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UserRequest "requestId" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UserRequest'requestId
           (\ x__ y__ -> x__ {_UserRequest'requestId = y__}))
        Prelude.id
instance Data.ProtoLens.Message UserRequest where
  messageName _ = Data.Text.pack "Coins.UserRequest"
  packedMessageDescriptor _
    = "\n\
      \\vUserRequest\DC2'\n\
      \\DLEpub_key_uid_from\CAN\SOH \SOH(\fR\rpubKeyUidFrom\DC2%\n\
      \\ACKamount\CAN\STX \SOH(\v2\r.Coins.UMoneyR\ACKamount\DC2\GS\n\
      \\n\
      \request_id\CAN\ETX \SOH(\fR\trequestId"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        pubKeyUidFrom__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pub_key_uid_from"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"pubKeyUidFrom")) ::
              Data.ProtoLens.FieldDescriptor UserRequest
        amount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "amount"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UMoney)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'amount")) ::
              Data.ProtoLens.FieldDescriptor UserRequest
        requestId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "request_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestId")) ::
              Data.ProtoLens.FieldDescriptor UserRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubKeyUidFrom__field_descriptor),
           (Data.ProtoLens.Tag 2, amount__field_descriptor),
           (Data.ProtoLens.Tag 3, requestId__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UserRequest'_unknownFields
        (\ x__ y__ -> x__ {_UserRequest'_unknownFields = y__})
  defMessage
    = UserRequest'_constructor
        {_UserRequest'pubKeyUidFrom = Data.ProtoLens.fieldDefault,
         _UserRequest'amount = Prelude.Nothing,
         _UserRequest'requestId = Data.ProtoLens.fieldDefault,
         _UserRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UserRequest -> Data.ProtoLens.Encoding.Bytes.Parser UserRequest
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "pub_key_uid_from"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"pubKeyUidFrom") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "amount"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"amount") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "request_id"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"requestId") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UserRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"pubKeyUidFrom") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"requestId") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData UserRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UserRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UserRequest'pubKeyUidFrom x__)
                (Control.DeepSeq.deepseq
                   (_UserRequest'amount x__)
                   (Control.DeepSeq.deepseq (_UserRequest'requestId x__) ())))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\vcoins.proto\DC2\ENQCoins\"\144\EOT\n\
    \\aRequest\DC2\\\n\
    \\ETBledger_transfer_request\CAN\SOH \SOH(\v2$.Coins.Request.LedgerTransferRequestR\NAKledgerTransferRequest\DC2)\n\
    \\DLEledger_signature\CAN\STX \SOH(\fR\SIledgerSignature\SUB\201\SOH\n\
    \\NAKLedgerTransferRequest\DC2V\n\
    \\NAKuser_transfer_request\CAN\SOH \SOH(\v2\".Coins.Request.UserTransferRequestR\DC3userTransferRequest\DC2%\n\
    \\SOuser_signature\CAN\STX \SOH(\fR\ruserSignature\DC21\n\
    \\ainvoice\CAN\ETX \SOH(\v2\ETB.Coins.LightningInvoiceR\ainvoice\SUB\175\SOH\n\
    \\DC3UserTransferRequest\DC25\n\
    \\fuser_request\CAN\SOH \SOH(\v2\DC2.Coins.UserRequestR\vuserRequest\DC2&\n\
    \\SOmerchant_id_to\CAN\STX \SOH(\EOTH\NULR\fmerchantIdTo\DC23\n\
    \\ainvoice\CAN\ETX \SOH(\v2\ETB.Coins.LightningInvoiceH\NULR\ainvoiceB\EOT\n\
    \\STXto\"\137\SOH\n\
    \\DLELightningInvoice\DC2\NAK\n\
    \\ACKr_hash\CAN\SOH \SOH(\fR\ENQrHash\DC2'\n\
    \\SIpayment_request\CAN\STX \SOH(\tR\SOpaymentRequest\DC25\n\
    \\finvoice_type\CAN\ETX \SOH(\SO2\DC2.Coins.InvoiceTypeR\vinvoiceType\"|\n\
    \\vUserRequest\DC2'\n\
    \\DLEpub_key_uid_from\CAN\SOH \SOH(\fR\rpubKeyUidFrom\DC2%\n\
    \\ACKamount\CAN\STX \SOH(\v2\r.Coins.UMoneyR\ACKamount\DC2\GS\n\
    \\n\
    \request_id\CAN\ETX \SOH(\fR\trequestId\"p\n\
    \\ACKUMoney\DC2'\n\
    \\ACKamount\CAN\SOH \SOH(\v2\SI.Coins.UDecimalR\ACKamount\DC2=\n\
    \\rcurrency_code\CAN\STX \SOH(\v2\CAN.Coins.CurrencyCodeValueR\fcurrencyCode\"0\n\
    \\bUDecimal\DC2\DC2\n\
    \\EOTcoef\CAN\SOH \SOH(\EOTR\EOTcoef\DC2\DLE\n\
    \\ETXexp\CAN\STX \SOH(\ENQR\ETXexp\">\n\
    \\DC1CurrencyCodeValue\DC2)\n\
    \\ENQvalue\CAN\SOH \SOH(\SO2\DC3.Coins.CurrencyCodeR\ENQvalue*$\n\
    \\vInvoiceType\DC2\v\n\
    \\aREGULAR\DLE\NUL\DC2\b\n\
    \\EOTHODL\DLE\SOH*2\n\
    \\fCurrencyCode\DC2\a\n\
    \\ETXBTC\DLE\NUL\DC2\a\n\
    \\ETXEUR\DLE\SOH\DC2\a\n\
    \\ETXUSD\DLE\STX\DC2\a\n\
    \\ETXETH\DLE\ETXJ\218\SI\n\
    \\ACK\DC2\EOT\NUL\NUL<\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DLE\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\SOH\NUL\SO\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ETX\NUL\SYN\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ETX\b\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\EOT\STX4\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\EOT\EOT\STX\ETX\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\EOT\STX\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\EOT\CAN/\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\EOT23\n\
    \>\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\ACK\STX\GS\SUB1 signature of serialized ledger_transfer_request\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\EOT\ACK\STX\EOT4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\ACK\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\ACK\b\CAN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\ACK\ESC\FS\n\
    \\f\n\
    \\EOT\EOT\NUL\ETX\NUL\DC2\EOT\b\STX\r\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\ETX\NUL\SOH\DC2\ETX\b\n\
    \\US\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\NUL\DC2\ETX\t\EOT2\n\
    \\SI\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\EOT\DC2\EOT\t\EOT\b!\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ACK\DC2\ETX\t\EOT\ETB\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\SOH\DC2\ETX\t\CAN-\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ETX\DC2\ETX\t01\n\
    \>\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\SOH\DC2\ETX\v\EOT\GS\SUB/ signature of serialized user_transfer_request\n\
    \\n\
    \\SI\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\EOT\DC2\EOT\v\EOT\t2\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\ENQ\DC2\ETX\v\EOT\t\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\SOH\DC2\ETX\v\n\
    \\CAN\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\ETX\DC2\ETX\v\ESC\FS\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\STX\DC2\ETX\f\EOT!\n\
    \\SI\n\
    \\a\EOT\NUL\ETX\NUL\STX\STX\EOT\DC2\EOT\f\EOT\v\GS\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\STX\ACK\DC2\ETX\f\EOT\DC4\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\STX\SOH\DC2\ETX\f\NAK\FS\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\STX\ETX\DC2\ETX\f\US \n\
    \\f\n\
    \\EOT\EOT\NUL\ETX\SOH\DC2\EOT\SI\STX\NAK\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\ETX\SOH\SOH\DC2\ETX\SI\n\
    \\GS\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\SOH\STX\NUL\DC2\ETX\DLE\EOT!\n\
    \\SI\n\
    \\a\EOT\NUL\ETX\SOH\STX\NUL\EOT\DC2\EOT\DLE\EOT\SI\US\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\NUL\ACK\DC2\ETX\DLE\EOT\SI\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\NUL\SOH\DC2\ETX\DLE\DLE\FS\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\NUL\ETX\DC2\ETX\DLE\US \n\
    \\SO\n\
    \\ACK\EOT\NUL\ETX\SOH\b\NUL\DC2\EOT\DC1\EOT\DC4\ENQ\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\b\NUL\SOH\DC2\ETX\DC1\n\
    \\f\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\SOH\STX\SOH\DC2\ETX\DC2\ACK \n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\SOH\ENQ\DC2\ETX\DC2\ACK\f\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\SOH\SOH\DC2\ETX\DC2\r\ESC\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\SOH\ETX\DC2\ETX\DC2\RS\US\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\SOH\STX\STX\DC2\ETX\DC3\ACK#\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\STX\ACK\DC2\ETX\DC3\ACK\SYN\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\STX\SOH\DC2\ETX\DC3\ETB\RS\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\SOH\STX\STX\ETX\DC2\ETX\DC3!\"\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\CAN\NUL\FS\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\CAN\b\CAN\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\EM\STX\DC3\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\NUL\EOT\DC2\EOT\EM\STX\CAN\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\EM\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\EM\b\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\EM\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\SUB\STX\GS\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\SOH\EOT\DC2\EOT\SUB\STX\EM\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX\SUB\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\SUB\t\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\SUB\ESC\FS\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\ESC\STX\US\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\STX\EOT\DC2\EOT\ESC\STX\SUB\GS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ACK\DC2\ETX\ESC\STX\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\ESC\SO\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\ESC\GS\RS\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT\RS\NUL\"\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX\RS\b\DC3\n\
    \\v\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX\US\STX\GS\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\EOT\DC2\EOT\US\STX\RS\NAK\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX\US\STX\a\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX\US\b\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX\US\ESC\FS\n\
    \\v\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX \STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\EOT\DC2\EOT \STX\US\GS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ACK\DC2\ETX \STX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX \t\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX \DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETX!\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\EOT\DC2\EOT!\STX \DC4\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETX!\STX\a\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETX!\b\DC2\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETX!\NAK\SYN\n\
    \\n\
    \\n\
    \\STX\ENQ\NUL\DC2\EOT$\NUL'\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX$\ENQ\DLE\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX%\STX\SO\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX%\STX\t\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX%\f\r\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETX&\STX\v\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETX&\STX\ACK\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETX&\t\n\
    \\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOT)\NUL,\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX)\b\SO\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETX*\STX\SYN\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\EOT\DC2\EOT*\STX)\DLE\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ACK\DC2\ETX*\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETX*\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETX*\DC4\NAK\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETX+\STX&\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\EOT\DC2\EOT+\STX*\SYN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ACK\DC2\ETX+\STX\DC3\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETX+\DC4!\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETX+$%\n\
    \\n\
    \\n\
    \\STX\EOT\EOT\DC2\EOT.\NUL1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETX.\b\DLE\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETX/\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\EOT\DC2\EOT/\STX.\DC2\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETX/\STX\b\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETX/\t\r\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETX/\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\ETX0\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\EOT\DC2\EOT0\STX/\DC2\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\ETX0\STX\a\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\ETX0\b\v\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\ETX0\DLE\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\ENQ\DC2\EOT3\NUL5\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETX3\b\EM\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETX4\STX\EM\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\EOT\DC2\EOT4\STX3\ESC\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ACK\DC2\ETX4\STX\SO\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETX4\SI\DC4\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETX4\ETB\CAN\n\
    \\n\
    \\n\
    \\STX\ENQ\SOH\DC2\EOT7\NUL<\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\SOH\SOH\DC2\ETX7\ENQ\DC1\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\NUL\DC2\ETX8\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\SOH\DC2\ETX8\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\STX\DC2\ETX8\b\t\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\SOH\DC2\ETX9\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\SOH\DC2\ETX9\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\STX\DC2\ETX9\b\t\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\STX\DC2\ETX:\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\STX\SOH\DC2\ETX:\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\STX\STX\DC2\ETX:\b\t\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\ETX\DC2\ETX;\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ETX\SOH\DC2\ETX;\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ETX\STX\DC2\ETX;\b\tb\ACKproto3"