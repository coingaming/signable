module Data.Signable.Util
  ( safeFromIntegral,
    liftEither,
    ifThenElse,
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

ifThenElse :: (a -> Bool) -> (a -> b) -> (a -> b) -> a -> b
ifThenElse p t f x = if p x then t x else f x
