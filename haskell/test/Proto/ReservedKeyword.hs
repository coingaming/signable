{- This file was auto-generated from reserved_keyword.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.ReservedKeyword (
        Payload(), Payload'List(), Payload'List'Either(..),
        _Payload'List'X, _Payload'List'Xs
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
     
         * 'Proto.ReservedKeyword_Fields.module'' @:: Lens' Payload Data.ByteString.ByteString@
         * 'Proto.ReservedKeyword_Fields.data'' @:: Lens' Payload [Payload'List]@
         * 'Proto.ReservedKeyword_Fields.vec'data'' @:: Lens' Payload (Data.Vector.Vector Payload'List)@
         * 'Proto.ReservedKeyword_Fields.type'' @:: Lens' Payload [Data.ByteString.ByteString]@
         * 'Proto.ReservedKeyword_Fields.vec'type'' @:: Lens' Payload (Data.Vector.Vector Data.ByteString.ByteString)@
         * 'Proto.ReservedKeyword_Fields.class'' @:: Lens' Payload Payload'List@
         * 'Proto.ReservedKeyword_Fields.maybe'class'' @:: Lens' Payload (Prelude.Maybe Payload'List)@
         * 'Proto.ReservedKeyword_Fields.instance'' @:: Lens' Payload Data.ByteString.ByteString@
         * 'Proto.ReservedKeyword_Fields.if'' @:: Lens' Payload Prelude.Bool@ -}
data Payload
  = Payload'_constructor {_Payload'module' :: !Data.ByteString.ByteString,
                          _Payload'data' :: !(Data.Vector.Vector Payload'List),
                          _Payload'type' :: !(Data.Vector.Vector Data.ByteString.ByteString),
                          _Payload'class' :: !(Prelude.Maybe Payload'List),
                          _Payload'instance' :: !Data.ByteString.ByteString,
                          _Payload'if' :: !Prelude.Bool,
                          _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload "module'" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'module' (\ x__ y__ -> x__ {_Payload'module' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "data'" [Payload'List] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'data' (\ x__ y__ -> x__ {_Payload'data' = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Payload "vec'data'" (Data.Vector.Vector Payload'List) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'data' (\ x__ y__ -> x__ {_Payload'data' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "type'" [Data.ByteString.ByteString] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'type' (\ x__ y__ -> x__ {_Payload'type' = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Payload "vec'type'" (Data.Vector.Vector Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'type' (\ x__ y__ -> x__ {_Payload'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "class'" Payload'List where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'class' (\ x__ y__ -> x__ {_Payload'class' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Payload "maybe'class'" (Prelude.Maybe Payload'List) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'class' (\ x__ y__ -> x__ {_Payload'class' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "instance'" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'instance' (\ x__ y__ -> x__ {_Payload'instance' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload "if'" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'if' (\ x__ y__ -> x__ {_Payload'if' = y__}))
        Prelude.id
instance Data.ProtoLens.Message Payload where
  messageName _ = Data.Text.pack "ReservedKeyword.Payload"
  packedMessageDescriptor _
    = "\n\
      \\aPayload\DC2\SYN\n\
      \\ACKmodule\CAN\SOH \SOH(\fR\ACKmodule\DC21\n\
      \\EOTdata\CAN\STX \ETX(\v2\GS.ReservedKeyword.Payload.ListR\EOTdata\DC2\DC2\n\
      \\EOTtype\CAN\ETX \ETX(\fR\EOTtype\DC23\n\
      \\ENQclass\CAN\EOT \SOH(\v2\GS.ReservedKeyword.Payload.ListR\ENQclass\DC2\SUB\n\
      \\binstance\CAN\ENQ \SOH(\fR\binstance\DC2\SO\n\
      \\STXif\CAN\ACK \SOH(\bR\STXif\SUBQ\n\
      \\EOTList\DC2\SO\n\
      \\SOHx\CAN\SOH \SOH(\fH\NULR\SOHx\DC2/\n\
      \\STXxs\CAN\STX \SOH(\v2\GS.ReservedKeyword.Payload.ListH\NULR\STXxsB\b\n\
      \\ACKeither"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        module'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "module"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"module'")) ::
              Data.ProtoLens.FieldDescriptor Payload
        data'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "data"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Payload'List)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"data'")) ::
              Data.ProtoLens.FieldDescriptor Payload
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"type'")) ::
              Data.ProtoLens.FieldDescriptor Payload
        class'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "class"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Payload'List)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'class'")) ::
              Data.ProtoLens.FieldDescriptor Payload
        instance'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "instance"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"instance'")) ::
              Data.ProtoLens.FieldDescriptor Payload
        if'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "if"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"if'")) ::
              Data.ProtoLens.FieldDescriptor Payload
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, module'__field_descriptor),
           (Data.ProtoLens.Tag 2, data'__field_descriptor),
           (Data.ProtoLens.Tag 3, type'__field_descriptor),
           (Data.ProtoLens.Tag 4, class'__field_descriptor),
           (Data.ProtoLens.Tag 5, instance'__field_descriptor),
           (Data.ProtoLens.Tag 6, if'__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Payload'_unknownFields
        (\ x__ y__ -> x__ {_Payload'_unknownFields = y__})
  defMessage
    = Payload'_constructor
        {_Payload'module' = Data.ProtoLens.fieldDefault,
         _Payload'data' = Data.Vector.Generic.empty,
         _Payload'type' = Data.Vector.Generic.empty,
         _Payload'class' = Prelude.Nothing,
         _Payload'instance' = Data.ProtoLens.fieldDefault,
         _Payload'if' = Data.ProtoLens.fieldDefault,
         _Payload'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Payload
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Payload'List
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.ByteString.ByteString
                -> Data.ProtoLens.Encoding.Bytes.Parser Payload
        loop x mutable'data' mutable'type'
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'data' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'data')
                      frozen'type' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'type')
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
                              (Data.ProtoLens.Field.field @"vec'data'")
                              frozen'data'
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'type'") frozen'type' x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "module"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"module'") y x)
                                  mutable'data'
                                  mutable'type'
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "data"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'data' y)
                                loop x v mutable'type'
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getBytes
                                              (Prelude.fromIntegral len))
                                        "type"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'type' y)
                                loop x mutable'data' v
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "class"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"class'") y x)
                                  mutable'data'
                                  mutable'type'
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "instance"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"instance'") y x)
                                  mutable'data'
                                  mutable'type'
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "if"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"if'") y x)
                                  mutable'data'
                                  mutable'type'
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'data'
                                  mutable'type'
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'data' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'type' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'data' mutable'type')
          "Payload"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"module'") _x
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
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
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
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'data'") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'type'") _x))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'class'") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
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
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"instance'") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                  ((\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     _v))
                         ((Data.Monoid.<>)
                            (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"if'") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (\ b -> if b then 1 else 0)
                                        _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData Payload where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Payload'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Payload'module' x__)
                (Control.DeepSeq.deepseq
                   (_Payload'data' x__)
                   (Control.DeepSeq.deepseq
                      (_Payload'type' x__)
                      (Control.DeepSeq.deepseq
                         (_Payload'class' x__)
                         (Control.DeepSeq.deepseq
                            (_Payload'instance' x__)
                            (Control.DeepSeq.deepseq (_Payload'if' x__) ()))))))
{- | Fields :
     
         * 'Proto.ReservedKeyword_Fields.maybe'either' @:: Lens' Payload'List (Prelude.Maybe Payload'List'Either)@
         * 'Proto.ReservedKeyword_Fields.maybe'x' @:: Lens' Payload'List (Prelude.Maybe Data.ByteString.ByteString)@
         * 'Proto.ReservedKeyword_Fields.x' @:: Lens' Payload'List Data.ByteString.ByteString@
         * 'Proto.ReservedKeyword_Fields.maybe'xs' @:: Lens' Payload'List (Prelude.Maybe Payload'List)@
         * 'Proto.ReservedKeyword_Fields.xs' @:: Lens' Payload'List Payload'List@ -}
data Payload'List
  = Payload'List'_constructor {_Payload'List'either :: !(Prelude.Maybe Payload'List'Either),
                               _Payload'List'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload'List where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Payload'List'Either
  = Payload'List'X !Data.ByteString.ByteString |
    Payload'List'Xs !Payload'List
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Payload'List "maybe'either" (Prelude.Maybe Payload'List'Either) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'List'either
           (\ x__ y__ -> x__ {_Payload'List'either = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Payload'List "maybe'x" (Prelude.Maybe Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'List'either
           (\ x__ y__ -> x__ {_Payload'List'either = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Payload'List'X x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Payload'List'X y__))
instance Data.ProtoLens.Field.HasField Payload'List "x" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'List'either
           (\ x__ y__ -> x__ {_Payload'List'either = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Payload'List'X x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Payload'List'X y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Payload'List "maybe'xs" (Prelude.Maybe Payload'List) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'List'either
           (\ x__ y__ -> x__ {_Payload'List'either = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Payload'List'Xs x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Payload'List'Xs y__))
instance Data.ProtoLens.Field.HasField Payload'List "xs" Payload'List where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'List'either
           (\ x__ y__ -> x__ {_Payload'List'either = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Payload'List'Xs x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Payload'List'Xs y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Payload'List where
  messageName _ = Data.Text.pack "ReservedKeyword.Payload.List"
  packedMessageDescriptor _
    = "\n\
      \\EOTList\DC2\SO\n\
      \\SOHx\CAN\SOH \SOH(\fH\NULR\SOHx\DC2/\n\
      \\STXxs\CAN\STX \SOH(\v2\GS.ReservedKeyword.Payload.ListH\NULR\STXxsB\b\n\
      \\ACKeither"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        x__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "x"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'x")) ::
              Data.ProtoLens.FieldDescriptor Payload'List
        xs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "xs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Payload'List)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'xs")) ::
              Data.ProtoLens.FieldDescriptor Payload'List
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, x__field_descriptor),
           (Data.ProtoLens.Tag 2, xs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Payload'List'_unknownFields
        (\ x__ y__ -> x__ {_Payload'List'_unknownFields = y__})
  defMessage
    = Payload'List'_constructor
        {_Payload'List'either = Prelude.Nothing,
         _Payload'List'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Payload'List -> Data.ProtoLens.Encoding.Bytes.Parser Payload'List
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
                                       "x"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"x") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "xs"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"xs") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "List"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'either") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Payload'List'X v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((\ bs
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                   (Prelude.fromIntegral (Data.ByteString.length bs)))
                                (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          v)
                (Prelude.Just (Payload'List'Xs v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload'List where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Payload'List'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Payload'List'either x__) ())
instance Control.DeepSeq.NFData Payload'List'Either where
  rnf (Payload'List'X x__) = Control.DeepSeq.rnf x__
  rnf (Payload'List'Xs x__) = Control.DeepSeq.rnf x__
_Payload'List'X ::
  Data.ProtoLens.Prism.Prism' Payload'List'Either Data.ByteString.ByteString
_Payload'List'X
  = Data.ProtoLens.Prism.prism'
      Payload'List'X
      (\ p__
         -> case p__ of
              (Payload'List'X p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Payload'List'Xs ::
  Data.ProtoLens.Prism.Prism' Payload'List'Either Payload'List
_Payload'List'Xs
  = Data.ProtoLens.Prism.prism'
      Payload'List'Xs
      (\ p__
         -> case p__ of
              (Payload'List'Xs p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SYNreserved_keyword.proto\DC2\SIReservedKeyword\"\156\STX\n\
    \\aPayload\DC2\SYN\n\
    \\ACKmodule\CAN\SOH \SOH(\fR\ACKmodule\DC21\n\
    \\EOTdata\CAN\STX \ETX(\v2\GS.ReservedKeyword.Payload.ListR\EOTdata\DC2\DC2\n\
    \\EOTtype\CAN\ETX \ETX(\fR\EOTtype\DC23\n\
    \\ENQclass\CAN\EOT \SOH(\v2\GS.ReservedKeyword.Payload.ListR\ENQclass\DC2\SUB\n\
    \\binstance\CAN\ENQ \SOH(\fR\binstance\DC2\SO\n\
    \\STXif\CAN\ACK \SOH(\bR\STXif\SUBQ\n\
    \\EOTList\DC2\SO\n\
    \\SOHx\CAN\SOH \SOH(\fH\NULR\SOHx\DC2/\n\
    \\STXxs\CAN\STX \SOH(\v2\GS.ReservedKeyword.Payload.ListH\NULR\STXxsB\b\n\
    \\ACKeitherJ\144\ENQ\n\
    \\ACK\DC2\EOT\NUL\NUL\DC1\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\SOH\NUL\CAN\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ETX\NUL\DC1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ETX\b\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\EOT\STX\DC3\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\EOT\EOT\STX\ETX\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\EOT\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\EOT\b\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\EOT\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\ENQ\STX\EM\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\ETX\ENQ\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\ENQ\v\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\ENQ\DLE\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\ENQ\ETB\CAN\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX\ACK\STX\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\EOT\DC2\ETX\ACK\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\ETX\ACK\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX\ACK\DC1\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX\ACK\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETX\a\STX\DC1\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\ETX\EOT\DC2\EOT\a\STX\ACK\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ACK\DC2\ETX\a\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETX\a\a\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETX\a\SI\DLE\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\EOT\DC2\ETX\b\STX\NAK\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\EOT\EOT\DC2\EOT\b\STX\a\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ENQ\DC2\ETX\b\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\SOH\DC2\ETX\b\b\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ETX\DC2\ETX\b\DC3\DC4\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\ENQ\DC2\ETX\t\STX\SO\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\ENQ\EOT\DC2\EOT\t\STX\b\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ENQ\DC2\ETX\t\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\SOH\DC2\ETX\t\a\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ETX\DC2\ETX\t\f\r\n\
    \\f\n\
    \\EOT\EOT\NUL\ETX\NUL\DC2\EOT\v\STX\DLE\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\ETX\NUL\SOH\DC2\ETX\v\n\
    \\SO\n\
    \\SO\n\
    \\ACK\EOT\NUL\ETX\NUL\b\NUL\DC2\EOT\f\EOT\SI\ENQ\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\b\NUL\SOH\DC2\ETX\f\n\
    \\DLE\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\NUL\DC2\ETX\r\ACK\DC2\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ENQ\DC2\ETX\r\ACK\v\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\SOH\DC2\ETX\r\f\r\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ETX\DC2\ETX\r\DLE\DC1\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\SOH\DC2\ETX\SO\ACK\DC2\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\ACK\DC2\ETX\SO\ACK\n\
    \\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\SOH\DC2\ETX\SO\v\r\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\SOH\ETX\DC2\ETX\SO\DLE\DC1b\ACKproto3"