{-# LANGUAGE TemplateHaskell #-}

module Data.Signable.TH1
  ( ProtoModuleRoot (..),
    mkSignableProtoLensFile,
  )
where

import qualified Data.List.NonEmpty as NE (toList)
import Data.Signable.Import hiding (lift, toList)
--import Data.Signable.TH
import Language.Haskell.TH.Syntax
import Proto3.Suite.DotProto.AST
import Proto3.Suite.DotProto.Generate

newtype ProtoModuleRoot
  = ProtoModuleRoot String
  deriving (Show)

newtype Proto3SuiteModule
  = Proto3SuiteModule String
  deriving (Show)

data Proto3SuiteType
  = Proto3SuiteMessage Proto3SuiteModule String
  | Proto3SuiteEnum Proto3SuiteModule String
  deriving (Show)

mkSignableProtoLensFile :: ProtoModuleRoot -> [FilePath] -> FilePath -> Q [Dec]
mkSignableProtoLensFile mr fps fp = do
  proto <- fst <$> (liftEither =<< runExceptT (readDotProtoWithContext fps fp))
  let xs = parseProto3Suite mr proto
  liftIO $ print xs
  es <-
    mapM
      ( \case
          Proto3SuiteMessage _ _ ->
            --p <- mkProxy (coerce m) x
            --[d|$(mkSignable $(return $ lift p))|]
            [d||]
          Proto3SuiteEnum _ _ ->
            [d||]
      )
      xs
  return $ concat es

--
-- Utils
--

parseProto3Suite :: ProtoModuleRoot -> DotProto -> [Proto3SuiteType]
parseProto3Suite m0 x0 =
  protoDefinitions x0 >>= parseDef mempty
  where
    m = protoModule m0 $ protoPackage x0
    parseDef ns = \case
      DotProtoMessage _ x xs ->
        let this = ns <> protoName x
         in (Proto3SuiteMessage m this) : (xs >>= parseMsg (this <> "'"))
      DotProtoEnum _ x _ ->
        [Proto3SuiteEnum m $ ns <> protoName x]
      DotProtoService _ _ _ ->
        []
    parseMsg ns = \case
      DotProtoMessageDefinition x -> parseDef ns x
      _ -> []

protoModule :: ProtoModuleRoot -> DotProtoPackageSpec -> Proto3SuiteModule
protoModule x = \case
  DotProtoNoPackage ->
    Proto3SuiteModule $ coerce x
  DotProtoPackageSpec s ->
    let n = protoName s
     in Proto3SuiteModule $
          if n == mempty
            then coerce x
            else coerce x <> "." <> n

protoName :: DotProtoIdentifier -> String
protoName = \case
  Single x -> x
  Dots xs -> intercalate "." $ NE.toList $ components xs
  Qualified l r -> protoName l <> "." <> protoName r
  Anonymous -> mempty

liftEither :: (MonadFail m, Show a) => Either a b -> m b
liftEither = \case
  Left x -> fail $ show x
  Right x -> return x
