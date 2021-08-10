{- This file was auto-generated from repeated_msg.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.RepeatedMsg (
        Payload(), Payload'Msg()
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
     
         * 'Proto.RepeatedMsg_Fields.msg' @:: Lens' Payload [Payload'Msg]@
         * 'Proto.RepeatedMsg_Fields.vec'msg' @:: Lens' Payload (Data.Vector.Vector Payload'Msg)@ -}
data Payload
  = Payload'_constructor {_Payload'msg :: !(Data.Vector.Vector Payload'Msg),
                          _Payload'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload "msg" [Payload'Msg] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'msg (\ x__ y__ -> x__ {_Payload'msg = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Payload "vec'msg" (Data.Vector.Vector Payload'Msg) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'msg (\ x__ y__ -> x__ {_Payload'msg = y__}))
        Prelude.id
instance Data.ProtoLens.Message Payload where
  messageName _ = Data.Text.pack "RepeatedMsg.Payload"
  packedMessageDescriptor _
    = "\n\
      \\aPayload\DC2*\n\
      \\ETXmsg\CAN\SOH \ETX(\v2\CAN.RepeatedMsg.Payload.MsgR\ETXmsg\SUB\DC3\n\
      \\ETXMsg\DC2\f\n\
      \\SOHx\CAN\SOH \SOH(\rR\SOHx"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        msg__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "msg"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Payload'Msg)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"msg")) ::
              Data.ProtoLens.FieldDescriptor Payload
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, msg__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Payload'_unknownFields
        (\ x__ y__ -> x__ {_Payload'_unknownFields = y__})
  defMessage
    = Payload'_constructor
        {_Payload'msg = Data.Vector.Generic.empty,
         _Payload'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Payload
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Payload'Msg
             -> Data.ProtoLens.Encoding.Bytes.Parser Payload
        loop x mutable'msg
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'msg <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'msg)
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
                              (Data.ProtoLens.Field.field @"vec'msg") frozen'msg x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "msg"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'msg y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'msg
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'msg <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'msg)
          "Payload"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
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
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'msg") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Payload where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Payload'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Payload'msg x__) ())
{- | Fields :
     
         * 'Proto.RepeatedMsg_Fields.x' @:: Lens' Payload'Msg Data.Word.Word32@ -}
data Payload'Msg
  = Payload'Msg'_constructor {_Payload'Msg'x :: !Data.Word.Word32,
                              _Payload'Msg'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Payload'Msg where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Payload'Msg "x" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Payload'Msg'x (\ x__ y__ -> x__ {_Payload'Msg'x = y__}))
        Prelude.id
instance Data.ProtoLens.Message Payload'Msg where
  messageName _ = Data.Text.pack "RepeatedMsg.Payload.Msg"
  packedMessageDescriptor _
    = "\n\
      \\ETXMsg\DC2\f\n\
      \\SOHx\CAN\SOH \SOH(\rR\SOHx"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        x__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "x"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"x")) ::
              Data.ProtoLens.FieldDescriptor Payload'Msg
      in Data.Map.fromList [(Data.ProtoLens.Tag 1, x__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Payload'Msg'_unknownFields
        (\ x__ y__ -> x__ {_Payload'Msg'_unknownFields = y__})
  defMessage
    = Payload'Msg'_constructor
        {_Payload'Msg'x = Data.ProtoLens.fieldDefault,
         _Payload'Msg'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Payload'Msg -> Data.ProtoLens.Encoding.Bytes.Parser Payload'Msg
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
                                       "x"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"x") y x)
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
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"x") _x
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
instance Control.DeepSeq.NFData Payload'Msg where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Payload'Msg'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Payload'Msg'x x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC2repeated_msg.proto\DC2\vRepeatedMsg\"J\n\
    \\aPayload\DC2*\n\
    \\ETXmsg\CAN\SOH \ETX(\v2\CAN.RepeatedMsg.Payload.MsgR\ETXmsg\SUB\DC3\n\
    \\ETXMsg\DC2\f\n\
    \\SOHx\CAN\SOH \SOH(\rR\SOHxJ\229\SOH\n\
    \\ACK\DC2\EOT\NUL\NUL\b\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\SOH\NUL\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ETX\NUL\b\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ETX\b\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\EOT\STX\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\ETX\EOT\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\EOT\v\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\EOT\SI\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\EOT\NAK\SYN\n\
    \\f\n\
    \\EOT\EOT\NUL\ETX\NUL\DC2\EOT\ENQ\STX\a\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\ETX\NUL\SOH\DC2\ETX\ENQ\n\
    \\r\n\
    \\r\n\
    \\ACK\EOT\NUL\ETX\NUL\STX\NUL\DC2\ETX\ACK\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\EOT\DC2\EOT\ACK\EOT\ENQ\SI\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ENQ\DC2\ETX\ACK\EOT\n\
    \\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\SOH\DC2\ETX\ACK\v\f\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\STX\NUL\ETX\DC2\ETX\ACK\SI\DLEb\ACKproto3"