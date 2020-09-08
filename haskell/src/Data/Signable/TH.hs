{-# LANGUAGE TemplateHaskell #-}

module Data.Signable.TH
  ( mkProxy,
    mkSignable,
    mkSignableEnum,
  )
where

import Data.Map (toList)
import Data.ProtoLens
import Data.Signable.Class
import Data.Signable.Import hiding (lift, toList)
import Language.Haskell.TH.Syntax

mkProxy :: String -> Q Exp
mkProxy t0 = do
  let t = pure $ ConT $ mkName t0
  [e|($(lift t0), Proxy :: Proxy $(t))|]

mkSignable :: forall a. Message a => (String, Proxy a) -> Q [Dec]
mkSignable (t0, _) = do
  let t = pure $ ConT $ mkName t0
  x <- newName "x"
  xs <- mkChunks x
  [d|
    instance Signable $(t) where
      toBinary $(pure $ VarP x) = mconcat $(pure $ ListE xs)
    |]
  where
    mkChunks :: Name -> Q [Exp]
    mkChunks x =
      mapM (mkChunk x)
        $ sortBy (\(x0, _) (x1, _) -> compare x0 x1)
        $ toList fieldsByTag
    mkChunk :: Name -> (Tag, FieldDescriptor a) -> Q Exp
    mkChunk x (tag0, (FieldDescriptor n0 t1 _)) = do
      let n = mkName $ camel n0
      let mn = mkName $ camel $ "maybe'" <> n0
      tag <- case safeFromIntegral $ unTag tag0 of
        Just (v :: Int32) -> [e|toBinary ($(lift v) :: Int32)|]
        Nothing -> fail "TAG_OVERFLOW"
      case t1 of
        ScalarField _ ->
          [e|$(pure tag) <> toBinary (view $(pure $ VarE n) $(pure $ VarE x))|]
        MessageField _ ->
          [e|
            case view $(pure $ VarE mn) $(pure $ VarE x) of
              Nothing -> mempty
              Just v -> $(pure tag) <> toBinary v
            |]

--
-- TODO : make this function in generic way?
-- probably don't need TH there?
-- just need to be able to shrink enum set
-- to protobuf-only enums.
--
mkSignableEnum :: (String, Proxy a) -> Q [Dec]
mkSignableEnum (t0, _) = do
  let t = pure $ ConT $ mkName t0
  x <- newName "x"
  [d|
    instance Signable $(t) where
      toBinary $(pure $ VarP x) =
        case safeFromIntegral $ fromEnum $(pure $ VarE x) :: Maybe Int32 of
          Just v -> toBinary v
          Nothing -> error "ENUM_OVERFLOW"
    |]
