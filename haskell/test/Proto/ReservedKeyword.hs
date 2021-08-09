{- This file was auto-generated from reserved_keyword.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.ReservedKeyword
       (Payload(), Payload'List(), Payload'List'Either(..),
        _Payload'List'X, _Payload'List'Xs)
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

    * 'Proto.ReservedKeyword_Fields.module'' @:: Lens' Payload Data.ByteString.ByteString@
    * 'Proto.ReservedKeyword_Fields.data'' @:: Lens' Payload [Payload'List]@
    * 'Proto.ReservedKeyword_Fields.vec'data'' @:: Lens' Payload (Data.Vector.Vector Payload'List)@
    * 'Proto.ReservedKeyword_Fields.type'' @:: Lens' Payload [Data.ByteString.ByteString]@
    * 'Proto.ReservedKeyword_Fields.vec'type'' @:: Lens' Payload (Data.Vector.Vector Data.ByteString.ByteString)@
    * 'Proto.ReservedKeyword_Fields.class'' @:: Lens' Payload Payload'List@
    * 'Proto.ReservedKeyword_Fields.maybe'class'' @:: Lens' Payload (Prelude.Maybe Payload'List)@
    * 'Proto.ReservedKeyword_Fields.instance'' @:: Lens' Payload Data.ByteString.ByteString@
    * 'Proto.ReservedKeyword_Fields.if'' @:: Lens' Payload Prelude.Bool@
 -}
data Payload = Payload{_Payload'module' ::
                       !Data.ByteString.ByteString,
                       _Payload'data' :: !(Data.Vector.Vector Payload'List),
                       _Payload'type' :: !(Data.Vector.Vector Data.ByteString.ByteString),
                       _Payload'class' :: !(Prelude.Maybe Payload'List),
                       _Payload'instance' :: !Data.ByteString.ByteString,
                       _Payload'if' :: !Prelude.Bool,
                       _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload "module'"
           (Data.ByteString.ByteString)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'module'
               (\ x__ y__ -> x__{_Payload'module' = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "data'"
           ([Payload'List])
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'data'
               (\ x__ y__ -> x__{_Payload'data' = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens Data.Vector.Generic.toList
                (\ _ y__ -> Data.Vector.Generic.fromList y__)
instance Data.ProtoLens.Field.HasField Payload "vec'data'"
           (Data.Vector.Vector Payload'List)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'data'
               (\ x__ y__ -> x__{_Payload'data' = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "type'"
           ([Data.ByteString.ByteString])
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'type'
               (\ x__ y__ -> x__{_Payload'type' = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens Data.Vector.Generic.toList
                (\ _ y__ -> Data.Vector.Generic.fromList y__)
instance Data.ProtoLens.Field.HasField Payload "vec'type'"
           (Data.Vector.Vector Data.ByteString.ByteString)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'type'
               (\ x__ y__ -> x__{_Payload'type' = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "class'"
           (Payload'List)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'class'
               (\ x__ y__ -> x__{_Payload'class' = y__}))
              Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.defMessage
instance Data.ProtoLens.Field.HasField Payload "maybe'class'"
           (Prelude.Maybe Payload'List)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'class'
               (\ x__ y__ -> x__{_Payload'class' = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "instance'"
           (Data.ByteString.ByteString)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'instance'
               (\ x__ y__ -> x__{_Payload'instance' = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload "if'" (Prelude.Bool)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'if'
               (\ x__ y__ -> x__{_Payload'if' = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Payload where
        messageName _ = Data.Text.pack "ReservedKeyword.Payload"
        fieldsByTag
          = let module'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "module"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"module'"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                data'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "data"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor Payload'List)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Data.ProtoLens.Field.field @"data'"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Data.ProtoLens.Field.field @"type'"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                class'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "class"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor Payload'List)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'class'"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                instance'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "instance"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"instance'"))
                      :: Data.ProtoLens.FieldDescriptor Payload
                if'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "if"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"if'"))
                      :: Data.ProtoLens.FieldDescriptor Payload
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, module'__field_descriptor),
                 (Data.ProtoLens.Tag 2, data'__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor),
                 (Data.ProtoLens.Tag 4, class'__field_descriptor),
                 (Data.ProtoLens.Tag 5, instance'__field_descriptor),
                 (Data.ProtoLens.Tag 6, if'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Payload'_unknownFields
              (\ x__ y__ -> x__{_Payload'_unknownFields = y__})
        defMessage
          = Payload{_Payload'module' = Data.ProtoLens.fieldDefault,
                    _Payload'data' = Data.Vector.Generic.empty,
                    _Payload'type' = Data.Vector.Generic.empty,
                    _Payload'class' = Prelude.Nothing,
                    _Payload'instance' = Data.ProtoLens.fieldDefault,
                    _Payload'if' = Data.ProtoLens.fieldDefault,
                    _Payload'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Payload ->
                       Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector
                         Data.ProtoLens.Encoding.Growing.RealWorld
                         Payload'List
                         ->
                         Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector
                           Data.ProtoLens.Encoding.Growing.RealWorld
                           Data.ByteString.ByteString
                           -> Data.ProtoLens.Encoding.Bytes.Parser Payload
                loop x mutable'data' mutable'type'
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do frozen'data' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'data')
                            frozen'type' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'type')
                            let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 (Lens.Family2.set (Data.ProtoLens.Field.field @"vec'data'")
                                    frozen'data'
                                    (Lens.Family2.set (Data.ProtoLens.Field.field @"vec'type'")
                                       frozen'type'
                                       x)))
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                10 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.getBytes
                                                    (Prelude.fromIntegral len))
                                                Data.ProtoLens.Encoding.Bytes.<?> "module"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"module'")
                                              y
                                              x)
                                           mutable'data'
                                           mutable'type'
                                18 -> do !y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                   Data.ProtoLens.Encoding.Bytes.isolate
                                                     (Prelude.fromIntegral len)
                                                     Data.ProtoLens.parseMessage)
                                                 Data.ProtoLens.Encoding.Bytes.<?> "data"
                                         v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.append
                                                   mutable'data'
                                                   y)
                                         loop x v mutable'type'
                                26 -> do !y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                   Data.ProtoLens.Encoding.Bytes.getBytes
                                                     (Prelude.fromIntegral len))
                                                 Data.ProtoLens.Encoding.Bytes.<?> "type"
                                         v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.append
                                                   mutable'type'
                                                   y)
                                         loop x mutable'data' v
                                34 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                    (Prelude.fromIntegral len)
                                                    Data.ProtoLens.parseMessage)
                                                Data.ProtoLens.Encoding.Bytes.<?> "class"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"class'")
                                              y
                                              x)
                                           mutable'data'
                                           mutable'type'
                                42 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.getBytes
                                                    (Prelude.fromIntegral len))
                                                Data.ProtoLens.Encoding.Bytes.<?> "instance"
                                         loop
                                           (Lens.Family2.set
                                              (Data.ProtoLens.Field.field @"instance'")
                                              y
                                              x)
                                           mutable'data'
                                           mutable'type'
                                48 -> do y <- (Prelude.fmap ((Prelude./=) 0)
                                                 Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                Data.ProtoLens.Encoding.Bytes.<?> "if"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"if'") y
                                              x)
                                           mutable'data'
                                           mutable'type'
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
                                             mutable'data'
                                             mutable'type'
              in
              (do mutable'data' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
                  mutable'type' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
                  loop Data.ProtoLens.defMessage mutable'data' mutable'type')
                Data.ProtoLens.Encoding.Bytes.<?> "Payload"
        buildMessage
          = (\ _x ->
               (let _v
                      = Lens.Family2.view (Data.ProtoLens.Field.field @"module'") _x
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
                 (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                    (\ _v ->
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18) Data.Monoid.<>
                         (((\ bs ->
                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Prelude.. Data.ProtoLens.encodeMessage)
                           _v)
                    (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'data'") _x))
                   Data.Monoid.<>
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v ->
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 26) Data.Monoid.<>
                           (\ bs ->
                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs)
                             _v)
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'type'") _x))
                     Data.Monoid.<>
                     (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'class'") _x
                        of
                          (Prelude.Nothing) -> Data.Monoid.mempty
                          Prelude.Just _v -> (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
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
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"instance'") _x
                          in
                          if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                            Data.Monoid.mempty else
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 42) Data.Monoid.<>
                              (\ bs ->
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs)
                                _v)
                         Data.Monoid.<>
                         (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"if'") _x
                            in
                            if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                              Data.Monoid.mempty else
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 48) Data.Monoid.<>
                                ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                                   (\ b -> if b then 1 else 0))
                                  _v)
                           Data.Monoid.<>
                           Data.ProtoLens.Encoding.Wire.buildFieldSet
                             (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Payload'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Payload'module' x__)
                    (Control.DeepSeq.deepseq (_Payload'data' x__)
                       (Control.DeepSeq.deepseq (_Payload'type' x__)
                          (Control.DeepSeq.deepseq (_Payload'class' x__)
                             (Control.DeepSeq.deepseq (_Payload'instance' x__)
                                (Control.DeepSeq.deepseq (_Payload'if' x__) (()))))))))
{- | Fields :

    * 'Proto.ReservedKeyword_Fields.maybe'either' @:: Lens' Payload'List (Prelude.Maybe Payload'List'Either)@
    * 'Proto.ReservedKeyword_Fields.maybe'x' @:: Lens' Payload'List (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.ReservedKeyword_Fields.x' @:: Lens' Payload'List Data.ByteString.ByteString@
    * 'Proto.ReservedKeyword_Fields.maybe'xs' @:: Lens' Payload'List (Prelude.Maybe Payload'List)@
    * 'Proto.ReservedKeyword_Fields.xs' @:: Lens' Payload'List Payload'List@
 -}
data Payload'List = Payload'List{_Payload'List'either ::
                                 !(Prelude.Maybe Payload'List'Either),
                                 _Payload'List'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload'List where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
data Payload'List'Either = Payload'List'X !Data.ByteString.ByteString
                         | Payload'List'Xs !Payload'List
                             deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Payload'List "maybe'either"
           (Prelude.Maybe Payload'List'Either)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'List'either
               (\ x__ y__ -> x__{_Payload'List'either = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Field.HasField Payload'List "maybe'x"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'List'either
               (\ x__ y__ -> x__{_Payload'List'either = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens
                (\ x__ ->
                   case x__ of
                       Prelude.Just (Payload'List'X x__val) -> Prelude.Just x__val
                       _otherwise -> Prelude.Nothing)
                (\ _ y__ -> Prelude.fmap Payload'List'X y__)
instance Data.ProtoLens.Field.HasField Payload'List "x"
           (Data.ByteString.ByteString)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'List'either
               (\ x__ y__ -> x__{_Payload'List'either = y__}))
              Prelude..
              (Lens.Family2.Unchecked.lens
                 (\ x__ ->
                    case x__ of
                        Prelude.Just (Payload'List'X x__val) -> Prelude.Just x__val
                        _otherwise -> Prelude.Nothing)
                 (\ _ y__ -> Prelude.fmap Payload'List'X y__))
                Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault
instance Data.ProtoLens.Field.HasField Payload'List "maybe'xs"
           (Prelude.Maybe Payload'List)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'List'either
               (\ x__ y__ -> x__{_Payload'List'either = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens
                (\ x__ ->
                   case x__ of
                       Prelude.Just (Payload'List'Xs x__val) -> Prelude.Just x__val
                       _otherwise -> Prelude.Nothing)
                (\ _ y__ -> Prelude.fmap Payload'List'Xs y__)
instance Data.ProtoLens.Field.HasField Payload'List "xs"
           (Payload'List)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'List'either
               (\ x__ y__ -> x__{_Payload'List'either = y__}))
              Prelude..
              (Lens.Family2.Unchecked.lens
                 (\ x__ ->
                    case x__ of
                        Prelude.Just (Payload'List'Xs x__val) -> Prelude.Just x__val
                        _otherwise -> Prelude.Nothing)
                 (\ _ y__ -> Prelude.fmap Payload'List'Xs y__))
                Prelude.. Data.ProtoLens.maybeLens Data.ProtoLens.defMessage
instance Data.ProtoLens.Message Payload'List where
        messageName _ = Data.Text.pack "ReservedKeyword.Payload.List"
        fieldsByTag
          = let x__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "x"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'x"))
                      :: Data.ProtoLens.FieldDescriptor Payload'List
                xs__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "xs"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor Payload'List)
                      (Data.ProtoLens.OptionalField
                         (Data.ProtoLens.Field.field @"maybe'xs"))
                      :: Data.ProtoLens.FieldDescriptor Payload'List
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, x__field_descriptor),
                 (Data.ProtoLens.Tag 2, xs__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Payload'List'_unknownFields
              (\ x__ y__ -> x__{_Payload'List'_unknownFields = y__})
        defMessage
          = Payload'List{_Payload'List'either = Prelude.Nothing,
                         _Payload'List'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Payload'List -> Data.ProtoLens.Encoding.Bytes.Parser Payload'List
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
                                                Data.ProtoLens.Encoding.Bytes.<?> "x"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"x") y x)
                                18 -> do y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                  Data.ProtoLens.Encoding.Bytes.isolate
                                                    (Prelude.fromIntegral len)
                                                    Data.ProtoLens.parseMessage)
                                                Data.ProtoLens.Encoding.Bytes.<?> "xs"
                                         loop
                                           (Lens.Family2.set (Data.ProtoLens.Field.field @"xs") y x)
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
              in
              (do loop Data.ProtoLens.defMessage)
                Data.ProtoLens.Encoding.Bytes.<?> "List"
        buildMessage
          = (\ _x ->
               (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'either") _x
                  of
                    (Prelude.Nothing) -> Data.Monoid.mempty
                    Prelude.Just
                      (Payload'List'X v) -> (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                                              Data.Monoid.<>
                                              (\ bs ->
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                   Data.Monoid.<>
                                                   Data.ProtoLens.Encoding.Bytes.putBytes bs)
                                                v
                    Prelude.Just
                      (Payload'List'Xs v) -> (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                                               Data.Monoid.<>
                                               (((\ bs ->
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                      Data.Monoid.<>
                                                      Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                                  Prelude.. Data.ProtoLens.encodeMessage)
                                                 v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload'List where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Payload'List'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Payload'List'either x__) (())))
instance Control.DeepSeq.NFData Payload'List'Either where
        rnf (Payload'List'X x__) = Control.DeepSeq.rnf x__
        rnf (Payload'List'Xs x__) = Control.DeepSeq.rnf x__
_Payload'List'X ::
                Data.ProtoLens.Prism.Prism' Payload'List'Either
                  Data.ByteString.ByteString
_Payload'List'X
  = Data.ProtoLens.Prism.prism' Payload'List'X
      (\ p__ ->
         case p__ of
             Payload'List'X p__val -> Prelude.Just p__val
             _otherwise -> Prelude.Nothing)
_Payload'List'Xs ::
                 Data.ProtoLens.Prism.Prism' Payload'List'Either Payload'List
_Payload'List'Xs
  = Data.ProtoLens.Prism.prism' Payload'List'Xs
      (\ p__ ->
         case p__ of
             Payload'List'Xs p__val -> Prelude.Just p__val
             _otherwise -> Prelude.Nothing)