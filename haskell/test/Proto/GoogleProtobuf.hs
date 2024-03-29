{- This file was auto-generated from google_protobuf.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.GoogleProtobuf (
        BoolValue(), BytesValue(), DoubleValue(), FloatValue(),
        Int32Value(), Int64Value(), StringValue(), Timestamp(),
        UInt32Value(), UInt64Value()
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
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' BoolValue Prelude.Bool@ -}
data BoolValue
  = BoolValue'_constructor {_BoolValue'value :: !Prelude.Bool,
                            _BoolValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BoolValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BoolValue "value" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BoolValue'value (\ x__ y__ -> x__ {_BoolValue'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message BoolValue where
  messageName _ = Data.Text.pack "Google.Protobuf.BoolValue"
  packedMessageDescriptor _
    = "\n\
      \\tBoolValue\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\bR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor BoolValue
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BoolValue'_unknownFields
        (\ x__ y__ -> x__ {_BoolValue'_unknownFields = y__})
  defMessage
    = BoolValue'_constructor
        {_BoolValue'value = Data.ProtoLens.fieldDefault,
         _BoolValue'_unknownFields = []}
  parseMessage
    = let
        loop :: BoolValue -> Data.ProtoLens.Encoding.Bytes.Parser BoolValue
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
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
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
          (do loop Data.ProtoLens.defMessage) "BoolValue"
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
                         Data.ProtoLens.Encoding.Bytes.putVarInt
                         (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BoolValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BoolValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_BoolValue'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' BytesValue Data.ByteString.ByteString@ -}
data BytesValue
  = BytesValue'_constructor {_BytesValue'value :: !Data.ByteString.ByteString,
                             _BytesValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BytesValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BytesValue "value" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BytesValue'value (\ x__ y__ -> x__ {_BytesValue'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message BytesValue where
  messageName _ = Data.Text.pack "Google.Protobuf.BytesValue"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \BytesValue\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\fR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor BytesValue
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BytesValue'_unknownFields
        (\ x__ y__ -> x__ {_BytesValue'_unknownFields = y__})
  defMessage
    = BytesValue'_constructor
        {_BytesValue'value = Data.ProtoLens.fieldDefault,
         _BytesValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BytesValue -> Data.ProtoLens.Encoding.Bytes.Parser BytesValue
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
          (do loop Data.ProtoLens.defMessage) "BytesValue"
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
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BytesValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BytesValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_BytesValue'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' DoubleValue Prelude.Double@ -}
data DoubleValue
  = DoubleValue'_constructor {_DoubleValue'value :: !Prelude.Double,
                              _DoubleValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DoubleValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DoubleValue "value" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DoubleValue'value (\ x__ y__ -> x__ {_DoubleValue'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message DoubleValue where
  messageName _ = Data.Text.pack "Google.Protobuf.DoubleValue"
  packedMessageDescriptor _
    = "\n\
      \\vDoubleValue\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\SOHR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor DoubleValue
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DoubleValue'_unknownFields
        (\ x__ y__ -> x__ {_DoubleValue'_unknownFields = y__})
  defMessage
    = DoubleValue'_constructor
        {_DoubleValue'value = Data.ProtoLens.fieldDefault,
         _DoubleValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DoubleValue -> Data.ProtoLens.Encoding.Bytes.Parser DoubleValue
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
                        9 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
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
          (do loop Data.ProtoLens.defMessage) "DoubleValue"
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
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 9)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putFixed64
                         Data.ProtoLens.Encoding.Bytes.doubleToWord
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData DoubleValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DoubleValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_DoubleValue'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' FloatValue Prelude.Float@ -}
data FloatValue
  = FloatValue'_constructor {_FloatValue'value :: !Prelude.Float,
                             _FloatValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FloatValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FloatValue "value" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FloatValue'value (\ x__ y__ -> x__ {_FloatValue'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message FloatValue where
  messageName _ = Data.Text.pack "Google.Protobuf.FloatValue"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \FloatValue\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\STXR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor FloatValue
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FloatValue'_unknownFields
        (\ x__ y__ -> x__ {_FloatValue'_unknownFields = y__})
  defMessage
    = FloatValue'_constructor
        {_FloatValue'value = Data.ProtoLens.fieldDefault,
         _FloatValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FloatValue -> Data.ProtoLens.Encoding.Bytes.Parser FloatValue
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
                        13
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
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
          (do loop Data.ProtoLens.defMessage) "FloatValue"
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
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 13)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putFixed32
                         Data.ProtoLens.Encoding.Bytes.floatToWord
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData FloatValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FloatValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_FloatValue'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' Int32Value Data.Int.Int32@ -}
data Int32Value
  = Int32Value'_constructor {_Int32Value'value :: !Data.Int.Int32,
                             _Int32Value'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Int32Value where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Int32Value "value" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Int32Value'value (\ x__ y__ -> x__ {_Int32Value'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message Int32Value where
  messageName _ = Data.Text.pack "Google.Protobuf.Int32Value"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Int32Value\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor Int32Value
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Int32Value'_unknownFields
        (\ x__ y__ -> x__ {_Int32Value'_unknownFields = y__})
  defMessage
    = Int32Value'_constructor
        {_Int32Value'value = Data.ProtoLens.fieldDefault,
         _Int32Value'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Int32Value -> Data.ProtoLens.Encoding.Bytes.Parser Int32Value
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
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
          (do loop Data.ProtoLens.defMessage) "Int32Value"
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
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Int32Value where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Int32Value'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Int32Value'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' Int64Value Data.Int.Int64@ -}
data Int64Value
  = Int64Value'_constructor {_Int64Value'value :: !Data.Int.Int64,
                             _Int64Value'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Int64Value where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Int64Value "value" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Int64Value'value (\ x__ y__ -> x__ {_Int64Value'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message Int64Value where
  messageName _ = Data.Text.pack "Google.Protobuf.Int64Value"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Int64Value\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ETXR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor Int64Value
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Int64Value'_unknownFields
        (\ x__ y__ -> x__ {_Int64Value'_unknownFields = y__})
  defMessage
    = Int64Value'_constructor
        {_Int64Value'value = Data.ProtoLens.fieldDefault,
         _Int64Value'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Int64Value -> Data.ProtoLens.Encoding.Bytes.Parser Int64Value
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
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
          (do loop Data.ProtoLens.defMessage) "Int64Value"
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
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Int64Value where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Int64Value'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Int64Value'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' StringValue Data.Text.Text@ -}
data StringValue
  = StringValue'_constructor {_StringValue'value :: !Data.Text.Text,
                              _StringValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show StringValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField StringValue "value" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StringValue'value (\ x__ y__ -> x__ {_StringValue'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message StringValue where
  messageName _ = Data.Text.pack "Google.Protobuf.StringValue"
  packedMessageDescriptor _
    = "\n\
      \\vStringValue\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\tR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor StringValue
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StringValue'_unknownFields
        (\ x__ y__ -> x__ {_StringValue'_unknownFields = y__})
  defMessage
    = StringValue'_constructor
        {_StringValue'value = Data.ProtoLens.fieldDefault,
         _StringValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StringValue -> Data.ProtoLens.Encoding.Bytes.Parser StringValue
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
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
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
          (do loop Data.ProtoLens.defMessage) "StringValue"
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
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData StringValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_StringValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_StringValue'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.seconds' @:: Lens' Timestamp Data.Int.Int64@
         * 'Proto.GoogleProtobuf_Fields.nanos' @:: Lens' Timestamp Data.Int.Int32@ -}
data Timestamp
  = Timestamp'_constructor {_Timestamp'seconds :: !Data.Int.Int64,
                            _Timestamp'nanos :: !Data.Int.Int32,
                            _Timestamp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Timestamp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Timestamp "seconds" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Timestamp'seconds (\ x__ y__ -> x__ {_Timestamp'seconds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Timestamp "nanos" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Timestamp'nanos (\ x__ y__ -> x__ {_Timestamp'nanos = y__}))
        Prelude.id
instance Data.ProtoLens.Message Timestamp where
  messageName _ = Data.Text.pack "Google.Protobuf.Timestamp"
  packedMessageDescriptor _
    = "\n\
      \\tTimestamp\DC2\CAN\n\
      \\aseconds\CAN\SOH \SOH(\ETXR\aseconds\DC2\DC4\n\
      \\ENQnanos\CAN\STX \SOH(\ENQR\ENQnanos"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        seconds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "seconds"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"seconds")) ::
              Data.ProtoLens.FieldDescriptor Timestamp
        nanos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "nanos"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"nanos")) ::
              Data.ProtoLens.FieldDescriptor Timestamp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, seconds__field_descriptor),
           (Data.ProtoLens.Tag 2, nanos__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Timestamp'_unknownFields
        (\ x__ y__ -> x__ {_Timestamp'_unknownFields = y__})
  defMessage
    = Timestamp'_constructor
        {_Timestamp'seconds = Data.ProtoLens.fieldDefault,
         _Timestamp'nanos = Data.ProtoLens.fieldDefault,
         _Timestamp'_unknownFields = []}
  parseMessage
    = let
        loop :: Timestamp -> Data.ProtoLens.Encoding.Bytes.Parser Timestamp
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "seconds"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"seconds") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "nanos"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"nanos") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Timestamp"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"seconds") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"nanos") _x
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
instance Control.DeepSeq.NFData Timestamp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Timestamp'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Timestamp'seconds x__)
                (Control.DeepSeq.deepseq (_Timestamp'nanos x__) ()))
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' UInt32Value Data.Word.Word32@ -}
data UInt32Value
  = UInt32Value'_constructor {_UInt32Value'value :: !Data.Word.Word32,
                              _UInt32Value'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UInt32Value where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UInt32Value "value" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UInt32Value'value (\ x__ y__ -> x__ {_UInt32Value'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message UInt32Value where
  messageName _ = Data.Text.pack "Google.Protobuf.UInt32Value"
  packedMessageDescriptor _
    = "\n\
      \\vUInt32Value\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\rR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor UInt32Value
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UInt32Value'_unknownFields
        (\ x__ y__ -> x__ {_UInt32Value'_unknownFields = y__})
  defMessage
    = UInt32Value'_constructor
        {_UInt32Value'value = Data.ProtoLens.fieldDefault,
         _UInt32Value'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UInt32Value -> Data.ProtoLens.Encoding.Bytes.Parser UInt32Value
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
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
          (do loop Data.ProtoLens.defMessage) "UInt32Value"
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
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData UInt32Value where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UInt32Value'_unknownFields x__)
             (Control.DeepSeq.deepseq (_UInt32Value'value x__) ())
{- | Fields :
     
         * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' UInt64Value Data.Word.Word64@ -}
data UInt64Value
  = UInt64Value'_constructor {_UInt64Value'value :: !Data.Word.Word64,
                              _UInt64Value'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UInt64Value where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UInt64Value "value" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UInt64Value'value (\ x__ y__ -> x__ {_UInt64Value'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message UInt64Value where
  messageName _ = Data.Text.pack "Google.Protobuf.UInt64Value"
  packedMessageDescriptor _
    = "\n\
      \\vUInt64Value\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\EOTR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor UInt64Value
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UInt64Value'_unknownFields
        (\ x__ y__ -> x__ {_UInt64Value'_unknownFields = y__})
  defMessage
    = UInt64Value'_constructor
        {_UInt64Value'value = Data.ProtoLens.fieldDefault,
         _UInt64Value'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UInt64Value -> Data.ProtoLens.Encoding.Bytes.Parser UInt64Value
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
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UInt64Value"
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
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData UInt64Value where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UInt64Value'_unknownFields x__)
             (Control.DeepSeq.deepseq (_UInt64Value'value x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\NAKgoogle_protobuf.proto\DC2\SIGoogle.Protobuf\"#\n\
    \\vDoubleValue\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\SOHR\ENQvalue\"\"\n\
    \\n\
    \FloatValue\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\STXR\ENQvalue\"\"\n\
    \\n\
    \Int64Value\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ETXR\ENQvalue\"#\n\
    \\vUInt64Value\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\EOTR\ENQvalue\"\"\n\
    \\n\
    \Int32Value\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue\"#\n\
    \\vUInt32Value\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\rR\ENQvalue\"!\n\
    \\tBoolValue\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\bR\ENQvalue\"#\n\
    \\vStringValue\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\tR\ENQvalue\"\"\n\
    \\n\
    \BytesValue\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\fR\ENQvalue\";\n\
    \\tTimestamp\DC2\CAN\n\
    \\aseconds\CAN\SOH \SOH(\ETXR\aseconds\DC2\DC4\n\
    \\ENQnanos\CAN\STX \SOH(\ENQR\ENQnanosB|\n\
    \\DC3com.google.protobufB\rWrappersProtoP\SOHZ*github.com/golang/protobuf/ptypes/wrappers\248\SOH\SOH\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\173?\n\
    \\a\DC2\ENQ(\NUL\219\SOH\SOH\n\
    \\219\DLE\n\
    \\SOH\f\DC2\ETX(\NUL\DC22\193\f Protocol Buffers - Google's data interchange format\n\
    \ Copyright 2008 Google Inc.  All rights reserved.\n\
    \ https://developers.google.com/protocol-buffers/\n\
    \\n\
    \ Redistribution and use in source and binary forms, with or without\n\
    \ modification, are permitted provided that the following conditions are\n\
    \ met:\n\
    \\n\
    \     * Redistributions of source code must retain the above copyright\n\
    \ notice, this list of conditions and the following disclaimer.\n\
    \     * Redistributions in binary form must reproduce the above\n\
    \ copyright notice, this list of conditions and the following disclaimer\n\
    \ in the documentation and/or other materials provided with the\n\
    \ distribution.\n\
    \     * Neither the name of Google Inc. nor the names of its\n\
    \ contributors may be used to endorse or promote products derived from\n\
    \ this software without specific prior written permission.\n\
    \\n\
    \ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS\n\
    \ \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT\n\
    \ LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR\n\
    \ A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT\n\
    \ OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,\n\
    \ SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT\n\
    \ LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,\n\
    \ DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY\n\
    \ THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT\n\
    \ (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE\n\
    \ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n\
    \2\140\EOT Wrappers for primitive (non-message) types. These types are useful\n\
    \ for embedding primitives in the `google.protobuf.Any` type and for places\n\
    \ where we need to distinguish between the absence of a primitive\n\
    \ typed field and its default value.\n\
    \\n\
    \ These wrappers have no meaningful use within repeated fields as they lack\n\
    \ the ability to detect presence on individual elements.\n\
    \ These wrappers have no meaningful use within a map or a oneof since\n\
    \ individual entries of a map or fields of a oneof can already detect presence.\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX*\NUL\CAN\n\
    \\b\n\
    \\SOH\b\DC2\ETX,\NUL;\n\
    \\t\n\
    \\STX\b%\DC2\ETX,\NUL;\n\
    \\b\n\
    \\SOH\b\DC2\ETX-\NUL\US\n\
    \\t\n\
    \\STX\b\US\DC2\ETX-\NUL\US\n\
    \\b\n\
    \\SOH\b\DC2\ETX.\NULA\n\
    \\t\n\
    \\STX\b\v\DC2\ETX.\NULA\n\
    \\b\n\
    \\SOH\b\DC2\ETX/\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX/\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX0\NUL.\n\
    \\t\n\
    \\STX\b\b\DC2\ETX0\NUL.\n\
    \\b\n\
    \\SOH\b\DC2\ETX1\NUL\"\n\
    \\t\n\
    \\STX\b\n\
    \\DC2\ETX1\NUL\"\n\
    \\b\n\
    \\SOH\b\DC2\ETX2\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX2\NUL!\n\
    \g\n\
    \\STX\EOT\NUL\DC2\EOT7\NUL:\SOH\SUB[ Wrapper message for `double`.\n\
    \\n\
    \ The JSON representation for `DoubleValue` is JSON number.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX7\b\DC3\n\
    \ \n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX9\STX\DC3\SUB\DC3 The double value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX9\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX9\t\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX9\DC1\DC2\n\
    \e\n\
    \\STX\EOT\SOH\DC2\EOT?\NULB\SOH\SUBY Wrapper message for `float`.\n\
    \\n\
    \ The JSON representation for `FloatValue` is JSON number.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX?\b\DC2\n\
    \\US\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXA\STX\DC2\SUB\DC2 The float value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXA\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXA\b\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXA\DLE\DC1\n\
    \e\n\
    \\STX\EOT\STX\DC2\EOTG\NULJ\SOH\SUBY Wrapper message for `int64`.\n\
    \\n\
    \ The JSON representation for `Int64Value` is JSON string.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETXG\b\DC2\n\
    \\US\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETXI\STX\DC2\SUB\DC2 The int64 value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETXI\STX\a\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETXI\b\r\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETXI\DLE\DC1\n\
    \g\n\
    \\STX\EOT\ETX\DC2\EOTO\NULR\SOH\SUB[ Wrapper message for `uint64`.\n\
    \\n\
    \ The JSON representation for `UInt64Value` is JSON string.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETXO\b\DC3\n\
    \ \n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXQ\STX\DC3\SUB\DC3 The uint64 value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETXQ\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXQ\t\SO\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXQ\DC1\DC2\n\
    \e\n\
    \\STX\EOT\EOT\DC2\EOTW\NULZ\SOH\SUBY Wrapper message for `int32`.\n\
    \\n\
    \ The JSON representation for `Int32Value` is JSON number.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETXW\b\DC2\n\
    \\US\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETXY\STX\DC2\SUB\DC2 The int32 value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETXY\STX\a\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETXY\b\r\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETXY\DLE\DC1\n\
    \g\n\
    \\STX\EOT\ENQ\DC2\EOT_\NULb\SOH\SUB[ Wrapper message for `uint32`.\n\
    \\n\
    \ The JSON representation for `UInt32Value` is JSON number.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETX_\b\DC3\n\
    \ \n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETXa\STX\DC3\SUB\DC3 The uint32 value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ENQ\DC2\ETXa\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETXa\t\SO\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETXa\DC1\DC2\n\
    \o\n\
    \\STX\EOT\ACK\DC2\EOTg\NULj\SOH\SUBc Wrapper message for `bool`.\n\
    \\n\
    \ The JSON representation for `BoolValue` is JSON `true` and `false`.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETXg\b\DC1\n\
    \\RS\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\ETXi\STX\DC1\SUB\DC1 The bool value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\ETXi\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\ETXi\a\f\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\ETXi\SI\DLE\n\
    \g\n\
    \\STX\EOT\a\DC2\EOTo\NULr\SOH\SUB[ Wrapper message for `string`.\n\
    \\n\
    \ The JSON representation for `StringValue` is JSON string.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\a\SOH\DC2\ETXo\b\DC3\n\
    \ \n\
    \\EOT\EOT\a\STX\NUL\DC2\ETXq\STX\DC3\SUB\DC3 The string value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\ETXq\STX\b\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\ETXq\t\SO\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\ETXq\DC1\DC2\n\
    \e\n\
    \\STX\EOT\b\DC2\EOTw\NULz\SOH\SUBY Wrapper message for `bytes`.\n\
    \\n\
    \ The JSON representation for `BytesValue` is JSON string.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\b\SOH\DC2\ETXw\b\DC2\n\
    \\US\n\
    \\EOT\EOT\b\STX\NUL\DC2\ETXy\STX\DC2\SUB\DC2 The bytes value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\ETXy\STX\a\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\ETXy\b\r\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\ETXy\DLE\DC1\n\
    \\244\ESC\n\
    \\STX\EOT\t\DC2\ACK\208\SOH\NUL\219\SOH\SOH\SUB\229\ESC A Timestamp represents a point in time independent of any time zone or local\n\
    \ calendar, encoded as a count of seconds and fractions of seconds at\n\
    \ nanosecond resolution. The count is relative to an epoch at UTC midnight on\n\
    \ January 1, 1970, in the proleptic Gregorian calendar which extends the\n\
    \ Gregorian calendar backwards to year one.\n\
    \\n\
    \ All minutes are 60 seconds long. Leap seconds are \"smeared\" so that no leap\n\
    \ second table is needed for interpretation, using a [24-hour linear\n\
    \ smear](https://developers.google.com/time/smear).\n\
    \\n\
    \ The range is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. By\n\
    \ restricting to that range, we ensure that we can convert to and from [RFC\n\
    \ 3339](https://www.ietf.org/rfc/rfc3339.txt) date strings.\n\
    \\n\
    \ # Examples\n\
    \\n\
    \ Example 1: Compute Timestamp from POSIX `time()`.\n\
    \\n\
    \     Timestamp timestamp;\n\
    \     timestamp.set_seconds(time(NULL));\n\
    \     timestamp.set_nanos(0);\n\
    \\n\
    \ Example 2: Compute Timestamp from POSIX `gettimeofday()`.\n\
    \\n\
    \     struct timeval tv;\n\
    \     gettimeofday(&tv, NULL);\n\
    \\n\
    \     Timestamp timestamp;\n\
    \     timestamp.set_seconds(tv.tv_sec);\n\
    \     timestamp.set_nanos(tv.tv_usec * 1000);\n\
    \\n\
    \ Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.\n\
    \\n\
    \     FILETIME ft;\n\
    \     GetSystemTimeAsFileTime(&ft);\n\
    \     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;\n\
    \\n\
    \     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z\n\
    \     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.\n\
    \     Timestamp timestamp;\n\
    \     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));\n\
    \     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));\n\
    \\n\
    \ Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.\n\
    \\n\
    \     long millis = System.currentTimeMillis();\n\
    \\n\
    \     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)\n\
    \         .setNanos((int) ((millis % 1000) * 1000000)).build();\n\
    \\n\
    \\n\
    \ Example 5: Compute Timestamp from current time in Python.\n\
    \\n\
    \     timestamp = Timestamp()\n\
    \     timestamp.GetCurrentTime()\n\
    \\n\
    \ # JSON Mapping\n\
    \\n\
    \ In JSON format, the Timestamp type is encoded as a string in the\n\
    \ [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. That is, the\n\
    \ format is \"{year}-{month}-{day}T{hour}:{min}:{sec}[.{frac_sec}]Z\"\n\
    \ where {year} is always expressed using four digits while {month}, {day},\n\
    \ {hour}, {min}, and {sec} are zero-padded to two digits each. The fractional\n\
    \ seconds, which can go up to 9 digits (i.e. up to 1 nanosecond resolution),\n\
    \ are optional. The \"Z\" suffix indicates the timezone (\"UTC\"); the timezone\n\
    \ is required. A proto3 JSON serializer should always use UTC (as indicated by\n\
    \ \"Z\") when printing the Timestamp type and a proto3 JSON parser should be\n\
    \ able to accept both UTC and other timezones (as indicated by an offset).\n\
    \\n\
    \ For example, \"2017-01-15T01:30:15.01Z\" encodes 15.01 seconds past\n\
    \ 01:30 UTC on January 15, 2017.\n\
    \\n\
    \ In JavaScript, one can convert a Date object to this format using the\n\
    \ standard\n\
    \ [toISOString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString)\n\
    \ method. In Python, a standard `datetime.datetime` object can be converted\n\
    \ to this format using\n\
    \ [`strftime`](https://docs.python.org/2/library/time.html#time.strftime) with\n\
    \ the time format spec '%Y-%m-%dT%H:%M:%S.%fZ'. Likewise, in Java, one can use\n\
    \ the Joda Time's [`ISODateTimeFormat.dateTime()`](\n\
    \ http://www.joda.org/joda-time/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime%2D%2D\n\
    \ ) to obtain a formatter capable of generating timestamps in this format.\n\
    \\n\
    \\n\
    \\n\
    \\v\n\
    \\ETX\EOT\t\SOH\DC2\EOT\208\SOH\b\DC1\n\
    \\157\SOH\n\
    \\EOT\EOT\t\STX\NUL\DC2\EOT\212\SOH\STX\DC4\SUB\142\SOH Represents seconds of UTC time since Unix epoch\n\
    \ 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to\n\
    \ 9999-12-31T23:59:59Z inclusive.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ENQ\DC2\EOT\212\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\SOH\DC2\EOT\212\SOH\b\SI\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ETX\DC2\EOT\212\SOH\DC2\DC3\n\
    \\229\SOH\n\
    \\EOT\EOT\t\STX\SOH\DC2\EOT\218\SOH\STX\DC2\SUB\214\SOH Non-negative fractions of a second at nanosecond resolution. Negative\n\
    \ second values with fractions must still have non-negative nanos values\n\
    \ that count forward in time. Must be from 0 to 999,999,999\n\
    \ inclusive.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ENQ\DC2\EOT\218\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\SOH\DC2\EOT\218\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ETX\DC2\EOT\218\SOH\DLE\DC1b\ACKproto3"