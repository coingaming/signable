{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

module Main where

import qualified Data.ByteString as B
-- Force the use of the Reflected API when decoding DescriptorProto
-- so that we can run the test suite against the Generated API.
-- TODO: switch back to Data.ProtoLens.Encoding once the Generated encoding is
-- good enough.

import Data.Int
import Data.List (sortBy)
import Data.ProtoLens (decodeMessage, defMessage, encodeMessage)
import Data.ProtoLens.Compiler.ModuleName
import Data.ProtoLens.Compiler.Plugin ()
import Data.String (fromString)
import qualified Data.Text as T
import Data.Text (Text, intercalate, pack, unpack)
import DynFlags (DynFlags, getDynFlags)
import GHC (runGhc)
import GHC.Paths (libdir)
import GHC.SourceGen
import GHC.SourceGen.Pretty (showPpr)
import GhcMonad (liftIO)
import Lens.Family2
import Proto.Google.Protobuf.Compiler.Plugin
  ( CodeGeneratorRequest,
    CodeGeneratorResponse,
  )
import Proto.Google.Protobuf.Descriptor
import System.Environment (getProgName)
import System.Exit (ExitCode (..), exitWith)
import System.IO as IO
import Text.Casing

data ProtoMod
  = ProtoMod
      { modName :: String,
        modTypes :: [ProtoType]
      }
  deriving (Show)

data ProtoType
  = ProtoMsg String DescriptorProto
  | ProtoEnum String
  deriving (Show)

main :: IO ()
main = do
  contents <- B.getContents
  progName <- getProgName
  case decodeMessage contents of
    Left e -> IO.hPutStrLn stderr e >> exitWith (ExitFailure 1)
    Right x -> runGhc (Just libdir) $ do
      dflags <- getDynFlags
      liftIO $ B.putStr $ encodeMessage $
        makeResponse dflags progName x

makeResponse :: DynFlags -> String -> CodeGeneratorRequest -> CodeGeneratorResponse
makeResponse dflags prog req =
  defMessage
    & #file
      .~ [ defMessage
             & #name .~ "Proto/SignableOrphan.hs"
             & #content .~ header <> body
         ]
  where
    protoMods :: [ProtoMod]
    protoMods =
      (\x -> ProtoMod (parseModName x) $ parseModTypes x)
        <$> req ^. #protoFile
    imports :: [ImportDecl']
    imports =
      [ import' "Universum",
        import' "Data.Signable"
      ]
        <> ( protoMods
               >>= ( \x ->
                       let n = modName x
                        in import' . fromString <$> [n, n <> "_Fields"]
                   )
           )
    body :: Text
    body =
      pack . showPpr dflags $
        module'
          (Just "Proto.SignableOrphan")
          (Just [])
          imports
          (protoMods >>= mkImpls)
    header :: Text
    header =
      Data.Text.intercalate "\n" $
        [ "{- This file was auto-generated by the "
            <> pack prog
            <> " program. -}",
          "{-# OPTIONS_GHC -fno-warn-orphans #-}"
        ]

parseModName :: FileDescriptorProto -> String
parseModName fd = protoModuleName (T.unpack $ fd ^. #name)

parseModTypes :: FileDescriptorProto -> [ProtoType]
parseModTypes x =
  (parseEnum mempty <$> x ^. #enumType)
    <> ((x ^. #messageType) >>= parseMsg mempty)

parseEnum :: String -> EnumDescriptorProto -> ProtoType
parseEnum ns x = ProtoEnum $ ns <> unpack (x ^. #name)

parseMsg :: String -> DescriptorProto -> [ProtoType]
parseMsg ns0 x =
  ProtoMsg n x
    : (parseEnum ns <$> x ^. #enumType)
    <> ((x ^. #nestedType) >>= parseMsg ns)
  where
    n = ns0 <> unpack (x ^. #name)
    ns = n <> "'"

mkImpls :: ProtoMod -> [HsDecl']
mkImpls x =
  mk (modName x) <$> modTypes x
  where
    mk m = \case
      ProtoMsg t d -> mkMsgImpl m t d
      ProtoEnum t -> mkEnumImpl m t

mkMsgImpl :: String -> String -> DescriptorProto -> HsDecl'
mkMsgImpl m t d =
  instance'
    (var "Signable" @@ var (fromString $ m <> "." <> t))
    [ funBind "toBinary" $
        match
          [bvar "x"]
          ( var "mconcat"
              @@ ( list
                     . (mkMsgChunk m <$>)
                     . sortBy (\x y -> compare (x ^. #number) (y ^. #number))
                     $ d ^. #field
                 )
          )
    ]

mkMsgChunk :: String -> FieldDescriptorProto -> HsExpr'
mkMsgChunk m d =
  case d ^. #type' of
    FieldDescriptorProto'TYPE_MESSAGE ->
      case'
        (var "view" @@ var (fromString mn) @@ var "x")
        [ match
            [conP "Just" [bvar "v"]]
            (op tag "<>" (var "toBinary" @@ var "v")),
          match
            [conP_ "Nothing"]
            (var "mempty")
        ]
    _ ->
      op
        tag
        "<>"
        (var "toBinary" @@ par (var "view" @@ var (fromString n) @@ var "x"))
  where
    n0 = camel . unpack $ d ^. #name
    n = m <> "_Fields." <> n0
    mn = m <> "_Fields." <> "maybe'" <> n0
    tag = case safeFromIntegral $ d ^. #number :: Maybe Int32 of
      Just v ->
        var "toBinary"
          @@ int (fromIntegral v :: Integer) @::@ var "Int32"
      Nothing -> error "TAG_OVERFLOW"

mkEnumImpl :: String -> String -> HsDecl'
mkEnumImpl m t =
  instance'
    (var "Signable" @@ var (fromString $ m <> "." <> t))
    [ funBind "toBinary" $
        match
          [bvar "x"]
          ( case'
              ( (var "safeFromIntegral" @@ par (var "fromEnum" @@ var "x"))
                  @::@ par (var "Maybe" @@ var "Int32")
              )
              [ match
                  [conP "Just" [bvar "v"]]
                  (var "toBinary" @@ var "v"),
                match
                  [conP_ "Nothing"]
                  (var "error" @@ string "ENUM_OVERFLOW")
              ]
          )
    ]

safeFromIntegral ::
  forall a b. (Integral a, Integral b, Bounded b) => a -> Maybe b
safeFromIntegral x =
  if (intX >= intMin) && (intX <= intMax)
    then Just $ fromIntegral x
    else Nothing
  where
    intX = fromIntegral x :: Integer
    intMin = fromIntegral (minBound :: b) :: Integer
    intMax = fromIntegral (maxBound :: b) :: Integer
