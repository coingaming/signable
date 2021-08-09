{- This file was auto-generated from repeated_msg.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds,
  BangPatterns, TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.RepeatedMsg (Payload(), Payload'Msg()) where
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

    * 'Proto.RepeatedMsg_Fields.msg' @:: Lens' Payload [Payload'Msg]@
    * 'Proto.RepeatedMsg_Fields.vec'msg' @:: Lens' Payload (Data.Vector.Vector Payload'Msg)@
 -}
data Payload = Payload{_Payload'msg ::
                       !(Data.Vector.Vector Payload'Msg),
                       _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload "msg"
           ([Payload'Msg])
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'msg
               (\ x__ y__ -> x__{_Payload'msg = y__}))
              Prelude..
              Lens.Family2.Unchecked.lens Data.Vector.Generic.toList
                (\ _ y__ -> Data.Vector.Generic.fromList y__)
instance Data.ProtoLens.Field.HasField Payload "vec'msg"
           (Data.Vector.Vector Payload'Msg)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'msg
               (\ x__ y__ -> x__{_Payload'msg = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Payload where
        messageName _ = Data.Text.pack "RepeatedMsg.Payload"
        fieldsByTag
          = let msg__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "msg"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor Payload'Msg)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Data.ProtoLens.Field.field @"msg"))
                      :: Data.ProtoLens.FieldDescriptor Payload
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, msg__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Payload'_unknownFields
              (\ x__ y__ -> x__{_Payload'_unknownFields = y__})
        defMessage
          = Payload{_Payload'msg = Data.Vector.Generic.empty,
                    _Payload'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Payload ->
                       Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector
                         Data.ProtoLens.Encoding.Growing.RealWorld
                         Payload'Msg
                         -> Data.ProtoLens.Encoding.Bytes.Parser Payload
                loop x mutable'msg
                  = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
                       if end then
                         do frozen'msg <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'msg)
                            let missing = [] in
                              if Prelude.null missing then Prelude.return () else
                                Prelude.fail
                                  (("Missing required fields: ") Prelude.++
                                     Prelude.show (missing :: ([Prelude.String])))
                            Prelude.return
                              (Lens.Family2.over Data.ProtoLens.unknownFields
                                 (\ !t -> Prelude.reverse t)
                                 (Lens.Family2.set (Data.ProtoLens.Field.field @"vec'msg")
                                    frozen'msg
                                    x))
                         else
                         do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                            case tag of
                                10 -> do !y <- (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                   Data.ProtoLens.Encoding.Bytes.isolate
                                                     (Prelude.fromIntegral len)
                                                     Data.ProtoLens.parseMessage)
                                                 Data.ProtoLens.Encoding.Bytes.<?> "msg"
                                         v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.append mutable'msg
                                                   y)
                                         loop x v
                                wire -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                                   wire
                                           loop
                                             (Lens.Family2.over Data.ProtoLens.unknownFields
                                                (\ !t -> (:) y t)
                                                x)
                                             mutable'msg
              in
              (do mutable'msg <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
                  loop Data.ProtoLens.defMessage mutable'msg)
                Data.ProtoLens.Encoding.Bytes.<?> "Payload"
        buildMessage
          = (\ _x ->
               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                  (\ _v ->
                     (Data.ProtoLens.Encoding.Bytes.putVarInt 10) Data.Monoid.<>
                       (((\ bs ->
                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                              Data.Monoid.<> Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Prelude.. Data.ProtoLens.encodeMessage)
                         _v)
                  (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'msg") _x))
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Payload'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Payload'msg x__) (())))
{- | Fields :

    * 'Proto.RepeatedMsg_Fields.x' @:: Lens' Payload'Msg Data.Word.Word32@
 -}
data Payload'Msg = Payload'Msg{_Payload'Msg'x :: !Data.Word.Word32,
                               _Payload'Msg'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload'Msg where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload'Msg "x"
           (Data.Word.Word32)
         where
        fieldOf _
          = (Lens.Family2.Unchecked.lens _Payload'Msg'x
               (\ x__ y__ -> x__{_Payload'Msg'x = y__}))
              Prelude.. Prelude.id
instance Data.ProtoLens.Message Payload'Msg where
        messageName _ = Data.Text.pack "RepeatedMsg.Payload.Msg"
        fieldsByTag
          = let x__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "x"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Optional
                         (Data.ProtoLens.Field.field @"x"))
                      :: Data.ProtoLens.FieldDescriptor Payload'Msg
              in Data.Map.fromList [(Data.ProtoLens.Tag 1, x__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _Payload'Msg'_unknownFields
              (\ x__ y__ -> x__{_Payload'Msg'_unknownFields = y__})
        defMessage
          = Payload'Msg{_Payload'Msg'x = Data.ProtoLens.fieldDefault,
                        _Payload'Msg'_unknownFields = ([])}
        parseMessage
          = let loop ::
                     Payload'Msg -> Data.ProtoLens.Encoding.Bytes.Parser Payload'Msg
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
                                               Data.ProtoLens.Encoding.Bytes.<?> "x"
                                        loop
                                          (Lens.Family2.set (Data.ProtoLens.Field.field @"x") y x)
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
               (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"x") _x in
                  if (_v) Prelude.== Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty else
                    (Data.ProtoLens.Encoding.Bytes.putVarInt 8) Data.Monoid.<>
                      ((Data.ProtoLens.Encoding.Bytes.putVarInt) Prelude..
                         Prelude.fromIntegral)
                        _v)
                 Data.Monoid.<>
                 Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload'Msg where
        rnf
          = (\ x__ ->
               Control.DeepSeq.deepseq (_Payload'Msg'_unknownFields x__)
                 (Control.DeepSeq.deepseq (_Payload'Msg'x x__) (())))