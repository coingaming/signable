{- This file was auto-generated from embedded_schema.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.EmbeddedSchema (
        Embedded(), Embedded'Msg(), Embedded'Msg'Enum(..),
        Embedded'Msg'Enum(), Embedded'Msg'Enum'UnrecognizedValue, Enum(..),
        Enum(), Enum'UnrecognizedValue, Msg(), Msg'Enum(..), Msg'Enum(),
        Msg'Enum'UnrecognizedValue
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
     
         * 'Proto.EmbeddedSchema_Fields.msgField' @:: Lens' Embedded Embedded'Msg@
         * 'Proto.EmbeddedSchema_Fields.maybe'msgField' @:: Lens' Embedded (Prelude.Maybe Embedded'Msg)@ -}
data Embedded
  = Embedded'_constructor {_Embedded'msgField :: !(Prelude.Maybe Embedded'Msg),
                           _Embedded'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Embedded where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Embedded "msgField" Embedded'Msg where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Embedded'msgField (\ x__ y__ -> x__ {_Embedded'msgField = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Embedded "maybe'msgField" (Prelude.Maybe Embedded'Msg) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Embedded'msgField (\ x__ y__ -> x__ {_Embedded'msgField = y__}))
        Prelude.id
instance Data.ProtoLens.Message Embedded where
  messageName _ = Data.Text.pack "Embedded.Schema.Embedded"
  packedMessageDescriptor _
    = "\n\
      \\bEmbedded\DC29\n\
      \\bmsgField\CAN\SOH \SOH(\v2\GS.Embedded.Schema.Embedded.MsgR\bmsgField\SUBa\n\
      \\ETXMsg\DC2@\n\
      \\tenumField\CAN\SOH \SOH(\SO2\".Embedded.Schema.Embedded.Msg.EnumR\tenumField\"\CAN\n\
      \\EOTEnum\DC2\a\n\
      \\ETXFOO\DLE\NUL\DC2\a\n\
      \\ETXBAR\DLE\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        msgField__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "msgField"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Embedded'Msg)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'msgField")) ::
              Data.ProtoLens.FieldDescriptor Embedded
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, msgField__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Embedded'_unknownFields
        (\ x__ y__ -> x__ {_Embedded'_unknownFields = y__})
  defMessage
    = Embedded'_constructor
        {_Embedded'msgField = Prelude.Nothing,
         _Embedded'_unknownFields = []}
  parseMessage
    = let
        loop :: Embedded -> Data.ProtoLens.Encoding.Bytes.Parser Embedded
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
                                       "msgField"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"msgField") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Embedded"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'msgField") _x
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Embedded where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Embedded'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Embedded'msgField x__) ())
{- | Fields :
     
         * 'Proto.EmbeddedSchema_Fields.enumField' @:: Lens' Embedded'Msg Embedded'Msg'Enum@ -}
data Embedded'Msg
  = Embedded'Msg'_constructor {_Embedded'Msg'enumField :: !Embedded'Msg'Enum,
                               _Embedded'Msg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Embedded'Msg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Embedded'Msg "enumField" Embedded'Msg'Enum where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Embedded'Msg'enumField
           (\ x__ y__ -> x__ {_Embedded'Msg'enumField = y__}))
        Prelude.id
instance Data.ProtoLens.Message Embedded'Msg where
  messageName _ = Data.Text.pack "Embedded.Schema.Embedded.Msg"
  packedMessageDescriptor _
    = "\n\
      \\ETXMsg\DC2@\n\
      \\tenumField\CAN\SOH \SOH(\SO2\".Embedded.Schema.Embedded.Msg.EnumR\tenumField\"\CAN\n\
      \\EOTEnum\DC2\a\n\
      \\ETXFOO\DLE\NUL\DC2\a\n\
      \\ETXBAR\DLE\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        enumField__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enumField"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Embedded'Msg'Enum)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"enumField")) ::
              Data.ProtoLens.FieldDescriptor Embedded'Msg
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, enumField__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Embedded'Msg'_unknownFields
        (\ x__ y__ -> x__ {_Embedded'Msg'_unknownFields = y__})
  defMessage
    = Embedded'Msg'_constructor
        {_Embedded'Msg'enumField = Data.ProtoLens.fieldDefault,
         _Embedded'Msg'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Embedded'Msg -> Data.ProtoLens.Encoding.Bytes.Parser Embedded'Msg
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
                                       "enumField"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"enumField") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Msg"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"enumField") _x
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
instance Control.DeepSeq.NFData Embedded'Msg where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Embedded'Msg'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Embedded'Msg'enumField x__) ())
newtype Embedded'Msg'Enum'UnrecognizedValue
  = Embedded'Msg'Enum'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Embedded'Msg'Enum
  = Embedded'Msg'FOO |
    Embedded'Msg'BAR |
    Embedded'Msg'Enum'Unrecognized !Embedded'Msg'Enum'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
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
    (Embedded'Msg'Enum'Unrecognized (Embedded'Msg'Enum'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "FOO" = Prelude.Just Embedded'Msg'FOO
    | (Prelude.==) k "BAR" = Prelude.Just Embedded'Msg'BAR
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Embedded'Msg'Enum where
  minBound = Embedded'Msg'FOO
  maxBound = Embedded'Msg'BAR
instance Prelude.Enum Embedded'Msg'Enum where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Enum: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum Embedded'Msg'FOO = 0
  fromEnum Embedded'Msg'BAR = 1
  fromEnum
    (Embedded'Msg'Enum'Unrecognized (Embedded'Msg'Enum'UnrecognizedValue k))
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
  rnf x__ = Prelude.seq x__ ()
newtype Enum'UnrecognizedValue
  = Enum'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Enum
  = FOO | BAR | Enum'Unrecognized !Enum'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
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
    | (Prelude.==) k "FOO" = Prelude.Just FOO
    | (Prelude.==) k "BAR" = Prelude.Just BAR
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Enum where
  minBound = FOO
  maxBound = BAR
instance Prelude.Enum Enum where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Enum: " (Prelude.show k__)))
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
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.EmbeddedSchema_Fields.enumField' @:: Lens' Msg Msg'Enum@ -}
data Msg
  = Msg'_constructor {_Msg'enumField :: !Msg'Enum,
                      _Msg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Msg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Msg "enumField" Msg'Enum where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Msg'enumField (\ x__ y__ -> x__ {_Msg'enumField = y__}))
        Prelude.id
instance Data.ProtoLens.Message Msg where
  messageName _ = Data.Text.pack "Embedded.Schema.Msg"
  packedMessageDescriptor _
    = "\n\
      \\ETXMsg\DC27\n\
      \\tenumField\CAN\SOH \SOH(\SO2\EM.Embedded.Schema.Msg.EnumR\tenumField\"\CAN\n\
      \\EOTEnum\DC2\a\n\
      \\ETXFOO\DLE\NUL\DC2\a\n\
      \\ETXBAR\DLE\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        enumField__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enumField"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Msg'Enum)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"enumField")) ::
              Data.ProtoLens.FieldDescriptor Msg
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, enumField__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Msg'_unknownFields (\ x__ y__ -> x__ {_Msg'_unknownFields = y__})
  defMessage
    = Msg'_constructor
        {_Msg'enumField = Data.ProtoLens.fieldDefault,
         _Msg'_unknownFields = []}
  parseMessage
    = let
        loop :: Msg -> Data.ProtoLens.Encoding.Bytes.Parser Msg
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
                                       "enumField"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"enumField") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Msg"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"enumField") _x
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
instance Control.DeepSeq.NFData Msg where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Msg'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Msg'enumField x__) ())
newtype Msg'Enum'UnrecognizedValue
  = Msg'Enum'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Msg'Enum
  = Msg'FOO |
    Msg'BAR |
    Msg'Enum'Unrecognized !Msg'Enum'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
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
    | (Prelude.==) k "FOO" = Prelude.Just Msg'FOO
    | (Prelude.==) k "BAR" = Prelude.Just Msg'BAR
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Msg'Enum where
  minBound = Msg'FOO
  maxBound = Msg'BAR
instance Prelude.Enum Msg'Enum where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Enum: " (Prelude.show k__)))
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
  rnf x__ = Prelude.seq x__ ()
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\NAKembedded_schema.proto\DC2\SIEmbedded.Schema\"\168\SOH\n\
    \\bEmbedded\DC29\n\
    \\bmsgField\CAN\SOH \SOH(\v2\GS.Embedded.Schema.Embedded.MsgR\bmsgField\SUBa\n\
    \\ETXMsg\DC2@\n\
    \\tenumField\CAN\SOH \SOH(\SO2\".Embedded.Schema.Embedded.Msg.EnumR\tenumField\"\CAN\n\
    \\EOTEnum\DC2\a\n\
    \\ETXFOO\DLE\NUL\DC2\a\n\
    \\ETXBAR\DLE\SOH\"X\n\
    \\ETXMsg\DC27\n\
    \\tenumField\CAN\SOH \SOH(\SO2\EM.Embedded.Schema.Msg.EnumR\tenumField\"\CAN\n\
    \\EOTEnum\DC2\a\n\
    \\ETXFOO\DLE\NUL\DC2\a\n\
    \\ETXBAR\DLE\SOH*\CAN\n\
    \\EOTEnum\DC2\a\n\
    \\ETXFOO\DLE\NUL\DC2\a\n\
    \\ETXBAR\DLE\SOHJ\131\ENQ\n\
    \\ACK\DC2\EOT\NUL\NUL\EM\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\SOH\NUL\CAN\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ETX\NUL\f\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ETX\b\DLE\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\EOT\STX\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\EOT\STX\ENQ\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\EOT\ACK\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\EOT\DC1\DC2\n\
    \\f\n\
    \\EOT\EOT\NUL\ETX\NUL\DC2\EOT\ENQ\STX\v\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\ETX\NUL\SOH\DC2\ETX\ENQ\n\
    \\r\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\NUL\DC2\ETX\ACK\EOT\ETB\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ACK\DC2\ETX\ACK\EOT\b\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\SOH\DC2\ETX\ACK\t\DC2\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ETX\DC2\ETX\ACK\NAK\SYN\n\
    \\SO\n\
    \\ACK\EOT\NUL\ETX\NUL\EOT\NUL\DC2\EOT\a\EOT\n\
    \\ENQ\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\EOT\NUL\SOH\DC2\ETX\a\t\r\n\
    \\SI\n\
    \\b\EOT\NUL\ETX\NUL\EOT\NUL\STX\NUL\DC2\ETX\b\ACK\SO\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\NUL\SOH\DC2\ETX\b\ACK\t\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\NUL\STX\DC2\ETX\b\f\r\n\
    \\SI\n\
    \\b\EOT\NUL\ETX\NUL\EOT\NUL\STX\SOH\DC2\ETX\t\ACK\SO\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\SOH\SOH\DC2\ETX\t\ACK\t\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\SOH\STX\DC2\ETX\t\f\r\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\SO\NUL\DC4\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\SO\b\v\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\SI\STX\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX\SI\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\SI\a\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\SI\DC3\DC4\n\
    \\f\n\
    \\EOT\EOT\SOH\EOT\NUL\DC2\EOT\DLE\STX\DC3\ETX\n\
    \\f\n\
    \\ENQ\EOT\SOH\EOT\NUL\SOH\DC2\ETX\DLE\a\v\n\
    \\r\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\NUL\DC2\ETX\DC1\EOT\f\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\NUL\SOH\DC2\ETX\DC1\EOT\a\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\NUL\STX\DC2\ETX\DC1\n\
    \\v\n\
    \\r\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\SOH\DC2\ETX\DC2\EOT\f\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SOH\SOH\DC2\ETX\DC2\EOT\a\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SOH\STX\DC2\ETX\DC2\n\
    \\v\n\
    \\n\
    \\n\
    \\STX\ENQ\NUL\DC2\EOT\SYN\NUL\EM\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX\SYN\ENQ\t\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX\ETB\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX\ETB\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX\ETB\b\t\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETX\CAN\STX\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETX\CAN\STX\ENQ\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETX\CAN\b\tb\ACKproto3"