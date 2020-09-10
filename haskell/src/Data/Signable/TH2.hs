{-# LANGUAGE TemplateHaskell #-}

module Data.Signable.TH2
  ( ProtoModuleRoot (..),
    mkProtoProxy,
    mkSignableProtoLensFile,
    protoModule,
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

newtype Proto3SuiteModule
  = Proto3SuiteModule String
  deriving (Show)

data Proto3SuiteType
  = Proto3SuiteMessage Proto3SuiteModule String
  | Proto3SuiteEnum Proto3SuiteModule String
  deriving (Show)

mkProtoProxy :: ProtoModuleRoot -> [FilePath] -> FilePath -> Q [Dec]
mkProtoProxy mr fps fp = do
  dp <- fst <$> (liftEither =<< runExceptT (readDotProtoWithContext fps fp))
  print dp
  let ts = parseProto3Suite mr dp
  concat
    <$> mapM
      ( \t -> do
          t0 <- [t|Proxy $(pure . ConT $ protoTypeName t)|]
          let sig = [SigD (proxyName t) t0]
          dec <- [d|$(pure . VarP $ proxyName t) = Proxy :: $(pure t0)|]
          return $ sig <> dec
      )
      ts

protoTypeName :: Proto3SuiteType -> Name
protoTypeName = mkName . \case
  Proto3SuiteMessage m x -> coerce m <> "." <> x
  Proto3SuiteEnum m x -> coerce m <> "." <> x

proxyName :: Proto3SuiteType -> Name
proxyName = mkName
  . ("proxy" <>)
  --
  -- TODO : replace . with _
  --
  . filter (/= '.')
  . \case
    Proto3SuiteMessage m x -> coerce m <> x
    Proto3SuiteEnum m x -> coerce m <> x

mkSignableProtoLensFile :: ProtoModuleRoot -> [FilePath] -> FilePath -> Q [Dec]
mkSignableProtoLensFile r fps fp = do
  dp <- fst <$> (liftEither =<< runExceptT (readDotProtoWithContext fps fp))
  mkSignableProtoLens r dp

mkSignableProtoLens :: ProtoModuleRoot -> DotProto -> Q [Dec]
mkSignableProtoLens r dp =
  concat <$> mapM (parseDef mempty) (protoDefinitions dp)
  where
    m0 = protoModule' r $ protoMeta dp
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

mkChunks :: Proto3SuiteModule -> Name -> [DotProtoMessagePart] -> Q [Exp]
mkChunks m x ds =
  --
  -- TODO : sort by index
  --
  catMaybes <$> mapM (mkChunk m x) ds

mkChunk :: Proto3SuiteModule -> Name -> DotProtoMessagePart -> Q (Maybe Exp)
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
        Just <$> [e|$(pure tag) <> toBinary (view $(pure $ VarE n) $(pure $ VarE x))|]
  _ ->
    return Nothing

--
-- Utils
--

parseProto3Suite :: ProtoModuleRoot -> DotProto -> [Proto3SuiteType]
parseProto3Suite m0 x0 =
  protoDefinitions x0 >>= parseDef mempty
  where
    m = protoModule' m0 $ protoMeta x0
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

protoModule' :: ProtoModuleRoot -> DotProtoMeta -> Proto3SuiteModule
protoModule' x =
  Proto3SuiteModule
    . intercalate "."
    . (toPascal . fromSnake <$>)
    . (coerce x :)
    . NE.toList
    . components
    . metaModulePath

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
