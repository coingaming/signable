{- This file was auto-generated from number.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Number (
        Payload()
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
     
         * 'Proto.Number_Fields.one' @:: Lens' Payload Data.Word.Word32@
         * 'Proto.Number_Fields.two' @:: Lens' Payload Data.Int.Int32@
         * 'Proto.Number_Fields.three' @:: Lens' Payload Data.Word.Word64@
         * 'Proto.Number_Fields.four' @:: Lens' Payload Data.Int.Int64@ -}
data Payload
  = Payload'_constructor {_Payload'one :: !Data.Word.Word32,
                          _Payload'two :: !Data.Int.Int32,
                          _Payload'three :: !Data.Word.Word64,
                          _Payload'four :: !Data.Int.Int64,
                          _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload "one" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'one (\ x__ y__ -> x__ {_Payload'one = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "two" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'two (\ x__ y__ -> x__ {_Payload'two = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "three" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'three (\ x__ y__ -> x__ {_Payload'three = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "four" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'four (\ x__ y__ -> x__ {_Payload'four = y__}))
        Prelude.id
instance Data.ProtoLens.Message Payload where
  messageName _ = Data.Text.pack "Number.Payload"
  packedMessageDescriptor _
    = "\n\
      \\aPayload\DC2\DLE\n\
      \\ETXone\CAN\SOH \SOH(\rR\ETXone\DC2\DLE\n\
      \\ETXtwo\CAN\STX \SOH(\ENQR\ETXtwo\DC2\DC4\n\
      \\ENQthree\CAN\ETX \SOH(\EOTR\ENQthree\DC2\DC2\n\
      \\EOTfour\CAN\EOT \SOH(\ETXR\EOTfour"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        one__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "one"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"one")) ::
              Data.ProtoLens.FieldDescriptor Payload
        two__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "two"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"two")) ::
              Data.ProtoLens.FieldDescriptor Payload
        three__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "three"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"three")) ::
              Data.ProtoLens.FieldDescriptor Payload
        four__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "four"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"four")) ::
              Data.ProtoLens.FieldDescriptor Payload
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, one__field_descriptor),
           (Data.ProtoLens.Tag 2, two__field_descriptor),
           (Data.ProtoLens.Tag 3, three__field_descriptor),
           (Data.ProtoLens.Tag 4, four__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Payload'_unknownFields
        (\ x__ y__ -> x__ {_Payload'_unknownFields = y__})
  defMessage
    = Payload'_constructor
        {_Payload'one = Data.ProtoLens.fieldDefault,
         _Payload'two = Data.ProtoLens.fieldDefault,
         _Payload'three = Data.ProtoLens.fieldDefault,
         _Payload'four = Data.ProtoLens.fieldDefault,
         _Payload'_unknownFields = []}
  parseMessage
    = let
        loop :: Payload -> Data.ProtoLens.Encoding.Bytes.Parser Payload
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
                                       "one"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"one") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "two"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"two") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "three"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"three") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "four"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"four") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Payload"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"one") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"two") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"three") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"four") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Payload where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Payload'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Payload'one x__)
                (Control.DeepSeq.deepseq
                   (_Payload'two x__)
                   (Control.DeepSeq.deepseq
                      (_Payload'three x__)
                      (Control.DeepSeq.deepseq (_Payload'four x__) ()))))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\fnumber.proto\DC2\ACKNumber\"W\n\
    \\aPayload\DC2\DLE\n\
    \\ETXone\CAN\SOH \SOH(\rR\ETXone\DC2\DLE\n\
    \\ETXtwo\CAN\STX \SOH(\ENQR\ETXtwo\DC2\DC4\n\
    \\ENQthree\CAN\ETX \SOH(\EOTR\ENQthree\DC2\DC2\n\
    \\EOTfour\CAN\EOT \SOH(\ETXR\EOTfourJ\144\STX\n\
    \\ACK\DC2\EOT\NUL\NUL\b\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\SOH\NUL\SI\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ETX\NUL\b\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ETX\b\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\EOT\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\EOT\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\EOT\t\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\EOT\SI\DLE\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\ENQ\STX\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\ENQ\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\ENQ\b\v\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\ENQ\SO\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX\ACK\STX\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\ETX\ACK\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX\ACK\t\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX\ACK\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETX\a\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ENQ\DC2\ETX\a\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETX\a\b\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETX\a\SI\DLEb\ACKproto3"