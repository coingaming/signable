module Data.Signable.Util
  ( safeFromIntegral,
    applyWithDef,
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

applyWithDef :: (a -> b) -> (b -> Bool) -> (b -> c) -> c -> a -> c
applyWithDef f0 p1 f1 def x0 =
  if p1 x1
    then f1 x1
    else def
  where
    x1 = f0 x0
