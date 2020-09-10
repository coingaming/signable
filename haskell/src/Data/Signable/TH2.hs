{-# LANGUAGE TemplateHaskell #-}

module Data.Signable.TH2
  ( ProtoModuleRoot (..),
    mkSignableProtoLens,
    mkSignableProtoLensFile,
  )
where

import qualified Data.List.NonEmpty as NE (toList)
import Data.Signable.Class
import Data.Signable.Import hiding (lift, toList)
import Language.Haskell.TH.Syntax hiding (Prim)
import Proto3.Suite
import Proto3.Suite.DotProto.Generate

newtype ProtoModuleRoot
  = ProtoModuleRoot String
  deriving (Show)

newtype ProtoModule
  = ProtoModule String
  deriving (Show)

mkSignableProtoLensFile :: ProtoModuleRoot -> [FilePath] -> FilePath -> Q [Dec]
mkSignableProtoLensFile r fps fp = do
  dp <- fst <$> (liftEither =<< runExceptT (readDotProtoWithContext fps fp))
  mkSignableProtoLens r dp

mkSignableProtoLens :: ProtoModuleRoot -> DotProto -> Q [Dec]
mkSignableProtoLens r dp =
  concat <$> mapM (parseDef mempty) (protoDefinitions dp)
  where
    m0 = protoModule r $ protoMeta dp
    parseDef ns = \case
      DotProtoMessage _ n ds -> do
        let t0 = ns <> protoName n
        x <- newName "x"
        xs <- mkChunks m0 x ds
        other <- parseIns (t0 <> "'") ds
        this <-
          [d|
            instance Signable $(pure $ ConT $ mkName $ coerce m0 <> "." <> t0) where
              toBinary $(pure $ VarP x) = mconcat $(pure $ ListE xs)
            |]
        return $ this <> other
      DotProtoEnum _ n _ -> do
        let t0 = ns <> protoName n
        x <- newName "x"
        [d|
          instance Signable $(pure $ ConT $ mkName $ coerce m0 <> "." <> t0) where
            toBinary $(pure $ VarP x) =
              case safeFromIntegral $ fromEnum $(pure $ VarE x) :: Maybe Int32 of
                Just v -> toBinary v
                Nothing -> error "ENUM_OVERFLOW"
          |]
      DotProtoService {} ->
        return []
    parseIns ns ds =
      concat
        <$> mapM
          ( \case
              DotProtoMessageDefinition d -> parseDef ns d
              _ -> return []
          )
          ds

mkChunks :: ProtoModule -> Name -> [DotProtoMessagePart] -> Q [Exp]
mkChunks m x ds =
  --
  -- TODO : sort by index
  --
  catMaybes <$> mapM (mkChunk m x) ds

mkChunk :: ProtoModule -> Name -> DotProtoMessagePart -> Q (Maybe Exp)
mkChunk m x = \case
  DotProtoMessageField f -> do
    let n0 = protoName $ dotProtoFieldName f
    let n = mkName $ coerce m <> "_Fields." <> camel n0
    let mn = mkName $ coerce m <> "_Fields." <> "maybe'" <> camel n0
    tag <- case safeFromIntegral . getFieldNumber $ dotProtoFieldNumber f of
      Just (v :: Int32) -> [e|toBinary ($(lift v) :: Int32)|]
      Nothing -> fail "TAG_OVERFLOW"
    case dotProtoFieldType f of
      Optional _ ->
        Just
          <$> [e|
            case view $(pure $ VarE mn) $(pure $ VarE x) of
              Nothing -> mempty
              Just v -> $(pure tag) <> toBinary v
            |]
      _ ->
        Just
          <$> [e|$(pure tag) <> toBinary (view $(pure $ VarE n) $(pure $ VarE x))|]
  _ ->
    return Nothing

protoModule :: ProtoModuleRoot -> DotProtoMeta -> ProtoModule
protoModule x =
  ProtoModule
    . intercalate "."
    . (toPascal . fromSnake <$>)
    . (coerce x :)
    . NE.toList
    . components
    . metaModulePath

protoName :: DotProtoIdentifier -> String
protoName = \case
  Single x -> x
  Dots xs -> intercalate "." $ NE.toList $ components xs
  Qualified l r -> protoName l <> "." <> protoName r
  Anonymous -> mempty
