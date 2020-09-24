-- | Digital signature is common security-related practice.
-- One of the main difficulties of digital signature usage
-- is necessity of determenistic data serialization agreement.
-- This library provides `Signable` class which represents
-- the idea of such agreement. Also worth mentioning generic
-- <https://hackage.haskell.org/package/proto-lens proto-lens> compatible implementation
-- of serialization\/signing algorithm described <https://github.com/coingaming/signable/blob/master/README.md here>.
-- It's implemented as separate protoc plugin <https://hackage.haskell.org/package/signable-haskell-protoc signable-haskell-protoc>
-- which generates `Signable` class instances for given proto-lens messages and enums.
module Data.Signable
  ( module X,
  )
where

import Data.Signable.Class as X
import Data.Signable.Util as X (ifThenElse, safeFromIntegral)
