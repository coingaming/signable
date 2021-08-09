{- This file was auto-generated from google_protobuf.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.GoogleProtobuf
       (BoolValue(), BytesValue(), DoubleValue(), FloatValue(),
        Int32Value(), Int64Value(), StringValue(), Timestamp(),
        UInt32Value(), UInt64Value())
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

{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' BoolValue Prelude.Bool@
 -}
data BoolValue = BoolValue{_BoolValue'value :: !Prelude.Bool,
                           _BoolValue'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BoolValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BoolValue "value"
           (Prelude.Bool)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _BoolValue'value
               (\ x__ y__ -> x__{_BoolValue'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message BoolValue where
        messageName _ = Data.Text.pack "Google.Protobuf.BoolValue"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor BoolValue
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _BoolValue'_unknownFields
              (\ x__ y__ -> x__{_BoolValue'_unknownFields = y__})
        defMessage
          = BoolValue{_BoolValue'value = Data.ProtoLens.fieldDefault,
                      _BoolValue'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     BoolValue -> Data.ProtoLens.Encoding.Bytes.Parser BoolValue
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
                                8 -> do y <- (Prelude.fmap ((Prelude./=) 0)
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
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
                Data.ProtoLens.Encoding.Bytes.<?> "BoolValue"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         (\ b -> if b then 1 else 0))
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BoolValue where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_BoolValue'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_BoolValue'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' BytesValue Data.ByteString.ByteString@
 -}
data BytesValue = BytesValue{_BytesValue'value ::
                             !Data.ByteString.ByteString,
                             _BytesValue'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BytesValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BytesValue "value"
           (Data.ByteString.ByteString)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _BytesValue'value
               (\ x__ y__ -> x__{_BytesValue'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message BytesValue where
        messageName _ = Data.Text.pack "Google.Protobuf.BytesValue"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor BytesValue
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _BytesValue'_unknownFields
              (\ x__ y__ -> x__{_BytesValue'_unknownFields = y__})
        defMessage
          = BytesValue{_BytesValue'value = Data.ProtoLens.fieldDefault,
                       _BytesValue'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     BytesValue -> Data.ProtoLens.Encoding.Bytes.Parser BytesValue
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
                                10 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.getBytes
                                                    (Prelude.fromIntegral len))
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
                Data.ProtoLens.Encoding.Bytes.<?> "BytesValue"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 10) Data.Monoid.<>
                      (\ bs ->
                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                           Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BytesValue where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_BytesValue'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_BytesValue'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' DoubleValue Prelude.Double@
 -}
data DoubleValue = DoubleValue{_DoubleValue'value ::
                               !Prelude.Double,
                               _DoubleValue'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DoubleValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DoubleValue "value"
           (Prelude.Double)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _DoubleValue'value
               (\ x__ y__ -> x__{_DoubleValue'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message DoubleValue where
        messageName _ = Data.Text.pack "Google.Protobuf.DoubleValue"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor DoubleValue
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DoubleValue'_unknownFields
              (\ x__ y__ -> x__{_DoubleValue'_unknownFields = y__})
        defMessage
          = DoubleValue{_DoubleValue'value = Data.ProtoLens.fieldDefault,
                        _DoubleValue'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     DoubleValue -> Data.ProtoLens.Encoding.Bytes.Parser DoubleValue
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
                                9 -> do y <- (Prelude.fmap
                                                Data.ProtoLens.Encoding.Bytes.wordToDouble
                                                Data.ProtoLens.Encoding.Bytes.getFixed64)
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
                Data.ProtoLens.Encoding.Bytes.<?> "DoubleValue"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 9) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putFixed64) Prelude..
                         Data.ProtoLens.Encoding.Bytes.doubleToWord)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData DoubleValue where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_DoubleValue'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_DoubleValue'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' FloatValue Prelude.Float@
 -}
data FloatValue = FloatValue{_FloatValue'value :: !Prelude.Float,
                             _FloatValue'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FloatValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FloatValue "value"
           (Prelude.Float)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _FloatValue'value
               (\ x__ y__ -> x__{_FloatValue'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message FloatValue where
        messageName _ = Data.Text.pack "Google.Protobuf.FloatValue"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor FloatValue
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _FloatValue'_unknownFields
              (\ x__ y__ -> x__{_FloatValue'_unknownFields = y__})
        defMessage
          = FloatValue{_FloatValue'value = Data.ProtoLens.fieldDefault,
                       _FloatValue'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     FloatValue -> Data.ProtoLens.Encoding.Bytes.Parser FloatValue
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
                                13 -> do y <- (Prelude.fmap
                                                 Data.ProtoLens.Encoding.Bytes.wordToFloat
                                                 Data.ProtoLens.Encoding.Bytes.getFixed32)
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
                Data.ProtoLens.Encoding.Bytes.<?> "FloatValue"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 13) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putFixed32) Prelude..
                         Data.ProtoLens.Encoding.Bytes.floatToWord)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData FloatValue where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_FloatValue'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_FloatValue'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' Int32Value Data.Int.Int32@
 -}
data Int32Value = Int32Value{_Int32Value'value :: !Data.Int.Int32,
                             _Int32Value'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Int32Value where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Int32Value "value"
           (Data.Int.Int32)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Int32Value'value
               (\ x__ y__ -> x__{_Int32Value'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Int32Value where
        messageName _ = Data.Text.pack "Google.Protobuf.Int32Value"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor Int32Value
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Int32Value'_unknownFields
              (\ x__ y__ -> x__{_Int32Value'_unknownFields = y__})
        defMessage
          = Int32Value{_Int32Value'value = Data.ProtoLens.fieldDefault,
                       _Int32Value'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Int32Value -> Data.ProtoLens.Encoding.Bytes.Parser Int32Value
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
                                8 -> do y <- (Prelude.fmap Prelude.fromIntegral
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
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
                Data.ProtoLens.Encoding.Bytes.<?> "Int32Value"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         Prelude.fromIntegral)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Int32Value where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Int32Value'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Int32Value'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' Int64Value Data.Int.Int64@
 -}
data Int64Value = Int64Value{_Int64Value'value :: !Data.Int.Int64,
                             _Int64Value'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Int64Value where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Int64Value "value"
           (Data.Int.Int64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Int64Value'value
               (\ x__ y__ -> x__{_Int64Value'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Int64Value where
        messageName _ = Data.Text.pack "Google.Protobuf.Int64Value"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor Int64Value
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Int64Value'_unknownFields
              (\ x__ y__ -> x__{_Int64Value'_unknownFields = y__})
        defMessage
          = Int64Value{_Int64Value'value = Data.ProtoLens.fieldDefault,
                       _Int64Value'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Int64Value -> Data.ProtoLens.Encoding.Bytes.Parser Int64Value
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
                                8 -> do y <- (Prelude.fmap Prelude.fromIntegral
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
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
                Data.ProtoLens.Encoding.Bytes.<?> "Int64Value"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         Prelude.fromIntegral)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Int64Value where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Int64Value'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Int64Value'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' StringValue Data.Text.Text@
 -}
data StringValue = StringValue{_StringValue'value ::
                               !Data.Text.Text,
                               _StringValue'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show StringValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField StringValue "value"
           (Data.Text.Text)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _StringValue'value
               (\ x__ y__ -> x__{_StringValue'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message StringValue where
        messageName _ = Data.Text.pack "Google.Protobuf.StringValue"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor StringValue
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _StringValue'_unknownFields
              (\ x__ y__ -> x__{_StringValue'_unknownFields = y__})
        defMessage
          = StringValue{_StringValue'value = Data.ProtoLens.fieldDefault,
                        _StringValue'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     StringValue -> Data.ProtoLens.Encoding.Bytes.Parser StringValue
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
                                10 -> do y <- (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                              Data.ProtoLens.Encoding.Bytes.getBytes
                                                                (Prelude.fromIntegral len)
                                                  Data.ProtoLens.Encoding.Bytes.runEither
                                                    (case Data.Text.Encoding.decodeUtf8' value of
                                                         Prelude.Left err -> Prelude.Left
                                                                               (Prelude.show err)
                                                         Prelude.Right r -> Prelude.Right r))
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
                Data.ProtoLens.Encoding.Bytes.<?> "StringValue"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 10) Data.Monoid.<>
                      (((\ bs ->
                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                             Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Prelude.. Data.Text.Encoding.encodeUtf8)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData StringValue where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_StringValue'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_StringValue'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.seconds' @:: Lens' Timestamp Data.Int.Int64@
    * 'Proto.GoogleProtobuf_Fields.nanos' @:: Lens' Timestamp Data.Int.Int32@
 -}
data Timestamp = Timestamp{_Timestamp'seconds :: !Data.Int.Int64,
                           _Timestamp'nanos :: !Data.Int.Int32,
                           _Timestamp'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Timestamp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Timestamp "seconds"
           (Data.Int.Int64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Timestamp'seconds
               (\ x__ y__ -> x__{_Timestamp'seconds = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Timestamp "nanos"
           (Data.Int.Int32)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Timestamp'nanos
               (\ x__ y__ -> x__{_Timestamp'nanos = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Timestamp where
        messageName _ = Data.Text.pack "Google.Protobuf.Timestamp"
        fieldsByTag
          = let seconds__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "seconds"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"seconds"))
                      :: Data.ProtoLens.FieldDescriptor Timestamp
                nanos__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "nanos"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"nanos"))
                      :: Data.ProtoLens.FieldDescriptor Timestamp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, seconds__field_descriptor),
                 (Data.ProtoLens.Tag 2, nanos__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Timestamp'_unknownFields
              (\ x__ y__ -> x__{_Timestamp'_unknownFields = y__})
        defMessage
          = Timestamp{_Timestamp'seconds = Data.ProtoLens.fieldDefault,
                      _Timestamp'nanos = Data.ProtoLens.fieldDefault,
                      _Timestamp'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Timestamp -> Data.ProtoLens.Encoding.Bytes.Parser Timestamp
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
                                8 -> do y <- (Prelude.fmap Prelude.fromIntegral
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
                                               Data.ProtoLens.Encoding.Bytes.<?> "seconds"
                                        loop
                                          (Lens.Family2.set (Data.ProtoLens.Field.field @"seconds")
                                             y
                                             x)
                                16 -> do y <- (Prelude.fmap Prelude.fromIntegral
                                                 Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                Data.ProtoLens.Encoding.Bytes.<?> "nanos"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"nanos") y
                                              x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "Timestamp"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"seconds") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         Prelude.fromIntegral)
                        _v)
                 Data.Monoid.<>
                 (let _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"nanos") _x
                    in
                    if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                      Data.Monoid.mempty else
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 16) Data.Monoid.<>
                        ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                           Prelude.fromIntegral)
                          _v)
                   Data.Monoid.<>
                   Data.ProtoLens.Encoding.Wire.buildFieldSet
                     (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Timestamp where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Timestamp'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Timestamp'seconds x__)
                    (Control.DeepSeq.deepseq (_Timestamp'nanos x__) (()))))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' UInt32Value Data.Word.Word32@
 -}
data UInt32Value = UInt32Value{_UInt32Value'value ::
                               !Data.Word.Word32,
                               _UInt32Value'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UInt32Value where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UInt32Value "value"
           (Data.Word.Word32)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _UInt32Value'value
               (\ x__ y__ -> x__{_UInt32Value'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message UInt32Value where
        messageName _ = Data.Text.pack "Google.Protobuf.UInt32Value"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor UInt32Value
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _UInt32Value'_unknownFields
              (\ x__ y__ -> x__{_UInt32Value'_unknownFields = y__})
        defMessage
          = UInt32Value{_UInt32Value'value = Data.ProtoLens.fieldDefault,
                        _UInt32Value'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     UInt32Value -> Data.ProtoLens.Encoding.Bytes.Parser UInt32Value
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
                                8 -> do y <- (Prelude.fmap Prelude.fromIntegral
                                                Data.ProtoLens.Encoding.Bytes.getVarInt)
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
                Data.ProtoLens.Encoding.Bytes.<?> "UInt32Value"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         Prelude.fromIntegral)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData UInt32Value where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_UInt32Value'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_UInt32Value'value x__) (())))
{- | Fields :

    * 'Proto.GoogleProtobuf_Fields.value' @:: Lens' UInt64Value Data.Word.Word64@
 -}
data UInt64Value = UInt64Value{_UInt64Value'value ::
                               !Data.Word.Word64,
                               _UInt64Value'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UInt64Value where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UInt64Value "value"
           (Data.Word.Word64)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _UInt64Value'value
               (\ x__ y__ -> x__{_UInt64Value'value = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message UInt64Value where
        messageName _ = Data.Text.pack "Google.Protobuf.UInt64Value"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"value"))
                      :: Data.ProtoLens.FieldDescriptor UInt64Value
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _UInt64Value'_unknownFields
              (\ x__ y__ -> x__{_UInt64Value'_unknownFields = y__})
        defMessage
          = UInt64Value{_UInt64Value'value = Data.ProtoLens.fieldDefault,
                        _UInt64Value'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     UInt64Value -> Data.ProtoLens.Encoding.Bytes.Parser UInt64Value
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
                Data.ProtoLens.Encoding.Bytes.<?> "UInt64Value"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                  in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      Data.ProtoLens.Encoding.Bytes.putVarInt _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData UInt64Value where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_UInt64Value'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_UInt64Value'value x__) (())))