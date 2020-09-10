module Data.Signable.Util
  ( safeFromIntegral,
    liftEither,
  )
where

import Universum

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

liftEither :: (MonadFail m, Show a) => Either a b -> m b
liftEither = \case
  Left x -> fail $ show x
  Right x -> return x
