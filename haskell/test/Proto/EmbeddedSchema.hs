{- This file was auto-generated from embedded_schema.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.EmbeddedSchema
       (Embedded(), Embedded'Msg(), Embedded'Msg'Enum(..),
        Embedded'Msg'Enum(), Embedded'Msg'Enum'UnrecognizedValue, Enum(..),
        Enum(), Enum'UnrecognizedValue, Msg(), Msg'Enum(..), Msg'Enum(),
        Msg'Enum'UnrecognizedValue)
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

    * 'Proto.EmbeddedSchema_Fields.msgField' @:: Lens' Embedded Embedded'Msg@
    * 'Proto.EmbeddedSchema_Fields.maybe'msgField' @:: Lens' Embedded (Prelude.Maybe Embedded'Msg)@
 -}
data Embedded = Embedded{_Embedded'msgField ::
                         !(Prelude.Maybe Embedded'Msg),
                         _Embedded'_unknownFields :: !Data.ProtoLens.FieldSet}
                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Embedded where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Embedded "msgField"
           (Embedded'Msg)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Embedded'msgField
               (\ x__ y__ -> x__{_Embedded'msgField = y__}))
              Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.defMessage
instance Data.ProtoLens.Field.HasField Embedded "maybe'msgField"
           (Prelude.Maybe Embedded'Msg)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Embedded'msgField
               (\ x__ y__ -> x__{_Embedded'msgField = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Embedded where
        messageName _ = Data.Text.pack "Embedded.Schema.Embedded"
        fieldsByTag
          = let msgField__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "msgField"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor Embedded'Msg)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'msgField"))
                      :: Data.ProtoLens.FieldDescriptor Embedded
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, msgField__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Embedded'_unknownFields
              (\ x__ y__ -> x__{_Embedded'_unknownFields = y__})
        defMessage
          = Embedded{_Embedded'msgField = Prelude.Nothing,
                     _Embedded'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Embedded -> Data.ProtoLens.Encoding.Bytes.Parser Embedded
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
                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                    (Prelude.fromIntegral len)
                                                    Data.ProtoLens.parseMessage)
                                                Data.ProtoLens.Encoding.Bytes.<?> "msgField"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"msgField")
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
                Data.ProtoLens.Encoding.Bytes.<?> "Embedded"
        buildMessage
          = (\ _x ->
               (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'msgField") _x
                  of
                    (Prelude.Nothing) -> Data.Monoid.mempty
                    Prelude.Just _v -> (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                                         Data.Monoid.<>
                                         (((\ bs ->
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                                Data.Monoid.<>
                                                Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Prelude.. Data.ProtoLens.encodeMessage)
                                           _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Embedded where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Embedded'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Embedded'msgField x__) (())))
{- | Fields :

    * 'Proto.EmbeddedSchema_Fields.enumField' @:: Lens' Embedded'Msg Embedded'Msg'Enum@
 -}
data Embedded'Msg = Embedded'Msg{_Embedded'Msg'enumField ::
                                 !Embedded'Msg'Enum,
                                 _Embedded'Msg'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Embedded'Msg where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Embedded'Msg "enumField"
           (Embedded'Msg'Enum)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Embedded'Msg'enumField
               (\ x__ y__ -> x__{_Embedded'Msg'enumField = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Embedded'Msg where
        messageName _ = Data.Text.pack "Embedded.Schema.Embedded.Msg"
        fieldsByTag
          = let enumField__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "enumField"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor Embedded'Msg'Enum)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"enumField"))
                      :: Data.ProtoLens.FieldDescriptor Embedded'Msg
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, enumField__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Embedded'Msg'_unknownFields
              (\ x__ y__ -> x__{_Embedded'Msg'_unknownFields = y__})
        defMessage
          = Embedded'Msg{_Embedded'Msg'enumField =
                           Data.ProtoLens.fieldDefault,
                         _Embedded'Msg'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Embedded'Msg -> Data.ProtoLens.Encoding.Bytes.Parser Embedded'Msg
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
                                               Data.ProtoLens.Encoding.Bytes.<?> "enumField"
                                        loop
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"enumField")
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
                Data.ProtoLens.Encoding.Bytes.<?> "Msg"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"enumField") _x
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
instance Control.DeepSeq.NFData Embedded'Msg where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Embedded'Msg'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Embedded'Msg'enumField x__) (())))
newtype Embedded'Msg'Enum'UnrecognizedValue = Embedded'Msg'Enum'UnrecognizedValue Data.Int.Int32
                                                deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Embedded'Msg'Enum = Embedded'Msg'FOO
                       | Embedded'Msg'BAR
                       | Embedded'Msg'Enum'Unrecognized !Embedded'Msg'Enum'UnrecognizedValue
                           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Embedded'Msg'Enum where
        maybeToEnum 0 = Prelude.Just Embedded'Msg'FOO
        maybeToEnum 1 = Prelude.Just Embedded'Msg'BAR
        maybeToEnum k
          = Prelude.Just
              (Embedded'Msg'Enum'Unrecognized
                 (Embedded'Msg'Enum'UnrecognizedValue (Prelude.fromIntegral k)))
        showEnum Embedded'Msg'FOO = "FOO"
        showEnum Embedded'Msg'BAR = "BAR"
        showEnum
          (Embedded'Msg'Enum'Unrecognized
             (Embedded'Msg'Enum'UnrecognizedValue k))
          = Prelude.show k
        readEnum k
          | (k) Prelude.== "FOO" = Prelude.Just Embedded'Msg'FOO
          | (k) Prelude.== "BAR" = Prelude.Just Embedded'Msg'BAR
        readEnum k
          = (Text.Read.readMaybe k) Prelude.>>= Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Embedded'Msg'Enum where
        minBound = Embedded'Msg'FOO
        maxBound = Embedded'Msg'BAR
instance Prelude.Enum Embedded'Msg'Enum where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 (("toEnum: unknown value for enum Enum: ") Prelude.++
                    Prelude.show k__))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum Embedded'Msg'FOO = 0
        fromEnum Embedded'Msg'BAR = 1
        fromEnum
          (Embedded'Msg'Enum'Unrecognized
             (Embedded'Msg'Enum'UnrecognizedValue k))
          = Prelude.fromIntegral k
        succ Embedded'Msg'BAR
          = Prelude.error
              "Embedded'Msg'Enum.succ: bad argument Embedded'Msg'BAR. This value would be out of bounds."
        succ Embedded'Msg'FOO = Embedded'Msg'BAR
        succ (Embedded'Msg'Enum'Unrecognized _)
          = Prelude.error
              "Embedded'Msg'Enum.succ: bad argument: unrecognized value"
        pred Embedded'Msg'FOO
          = Prelude.error
              "Embedded'Msg'Enum.pred: bad argument Embedded'Msg'FOO. This value would be out of bounds."
        pred Embedded'Msg'BAR = Embedded'Msg'FOO
        pred (Embedded'Msg'Enum'Unrecognized _)
          = Prelude.error
              "Embedded'Msg'Enum.pred: bad argument: unrecognized value"
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Embedded'Msg'Enum where
        fieldDefault = Embedded'Msg'FOO
instance Control.DeepSeq.NFData Embedded'Msg'Enum where
        rnf x__ = Prelude.seq x__ (())
newtype Enum'UnrecognizedValue = Enum'UnrecognizedValue Data.Int.Int32
                                   deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Enum = FOO
          | BAR
          | Enum'Unrecognized !Enum'UnrecognizedValue
              deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Enum where
        maybeToEnum 0 = Prelude.Just FOO
        maybeToEnum 1 = Prelude.Just BAR
        maybeToEnum k
          = Prelude.Just
              (Enum'Unrecognized
                 (Enum'UnrecognizedValue (Prelude.fromIntegral k)))
        showEnum FOO = "FOO"
        showEnum BAR = "BAR"
        showEnum (Enum'Unrecognized (Enum'UnrecognizedValue k))
          = Prelude.show k
        readEnum k
          | (k) Prelude.== "FOO" = Prelude.Just FOO
          | (k) Prelude.== "BAR" = Prelude.Just BAR
        readEnum k
          = (Text.Read.readMaybe k) Prelude.>>= Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Enum where
        minBound = FOO
        maxBound = BAR
instance Prelude.Enum Enum where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 (("toEnum: unknown value for enum Enum: ") Prelude.++
                    Prelude.show k__))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum FOO = 0
        fromEnum BAR = 1
        fromEnum (Enum'Unrecognized (Enum'UnrecognizedValue k))
          = Prelude.fromIntegral k
        succ BAR
          = Prelude.error
              "Enum.succ: bad argument BAR. This value would be out of bounds."
        succ FOO = BAR
        succ (Enum'Unrecognized _)
          = Prelude.error "Enum.succ: bad argument: unrecognized value"
        pred FOO
          = Prelude.error
              "Enum.pred: bad argument FOO. This value would be out of bounds."
        pred BAR = FOO
        pred (Enum'Unrecognized _)
          = Prelude.error "Enum.pred: bad argument: unrecognized value"
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Enum where
        fieldDefault = FOO
instance Control.DeepSeq.NFData Enum where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.EmbeddedSchema_Fields.enumField' @:: Lens' Msg Msg'Enum@
 -}
data Msg = Msg{_Msg'enumField :: !Msg'Enum,
               _Msg'_unknownFields :: !Data.ProtoLens.FieldSet}
             deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Msg where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Msg "enumField" (Msg'Enum)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Msg'enumField
               (\ x__ y__ -> x__{_Msg'enumField = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Msg where
        messageName _ = Data.Text.pack "Embedded.Schema.Msg"
        fieldsByTag
          = let enumField__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "enumField"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor Msg'Enum)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"enumField"))
                      :: Data.ProtoLens.FieldDescriptor Msg
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, enumField__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Msg'_unknownFields
              (\ x__ y__ -> x__{_Msg'_unknownFields = y__})
        defMessage
          = Msg{_Msg'enumField = Data.ProtoLens.fieldDefault,
                _Msg'_unknownFields = ([])}
        parseMessage
          = let loop :: Msg -> Data.ProtoLens.Encoding.Bytes.Parser Msg
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
                                               Data.ProtoLens.Encoding.Bytes.<?> "enumField"
                                        loop
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"enumField")
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
                Data.ProtoLens.Encoding.Bytes.<?> "Msg"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"enumField") _x
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
instance Control.DeepSeq.NFData Msg where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Msg'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Msg'enumField x__) (())))
newtype Msg'Enum'UnrecognizedValue = Msg'Enum'UnrecognizedValue Data.Int.Int32
                                       deriving (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Msg'Enum = Msg'FOO
              | Msg'BAR
              | Msg'Enum'Unrecognized !Msg'Enum'UnrecognizedValue
                  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Msg'Enum where
        maybeToEnum 0 = Prelude.Just Msg'FOO
        maybeToEnum 1 = Prelude.Just Msg'BAR
        maybeToEnum k
          = Prelude.Just
              (Msg'Enum'Unrecognized
                 (Msg'Enum'UnrecognizedValue (Prelude.fromIntegral k)))
        showEnum Msg'FOO = "FOO"
        showEnum Msg'BAR = "BAR"
        showEnum (Msg'Enum'Unrecognized (Msg'Enum'UnrecognizedValue k))
          = Prelude.show k
        readEnum k
          | (k) Prelude.== "FOO" = Prelude.Just Msg'FOO
          | (k) Prelude.== "BAR" = Prelude.Just Msg'BAR
        readEnum k
          = (Text.Read.readMaybe k) Prelude.>>= Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Msg'Enum where
        minBound = Msg'FOO
        maxBound = Msg'BAR
instance Prelude.Enum Msg'Enum where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 (("toEnum: unknown value for enum Enum: ") Prelude.++
                    Prelude.show k__))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum Msg'FOO = 0
        fromEnum Msg'BAR = 1
        fromEnum (Msg'Enum'Unrecognized (Msg'Enum'UnrecognizedValue k))
          = Prelude.fromIntegral k
        succ Msg'BAR
          = Prelude.error
              "Msg'Enum.succ: bad argument Msg'BAR. This value would be out of bounds."
        succ Msg'FOO = Msg'BAR
        succ (Msg'Enum'Unrecognized _)
          = Prelude.error "Msg'Enum.succ: bad argument: unrecognized value"
        pred Msg'FOO
          = Prelude.error
              "Msg'Enum.pred: bad argument Msg'FOO. This value would be out of bounds."
        pred Msg'BAR = Msg'FOO
        pred (Msg'Enum'Unrecognized _)
          = Prelude.error "Msg'Enum.pred: bad argument: unrecognized value"
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Msg'Enum where
        fieldDefault = Msg'FOO
instance Control.DeepSeq.NFData Msg'Enum where
        rnf x__ = Prelude.seq x__ (())