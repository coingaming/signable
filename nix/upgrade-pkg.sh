#!/bin/sh

set -e

(cd ./haskell && hpack)
(cd ./haskell/signable-haskell-protoc && hpack)
(cd ./nix/ && \
  cabal2nix ./../haskell > ./pkg.nix && \
  cabal2nix ./../haskell/signable-haskell-protoc > ./pkg-signable-haskell-protoc.nix)
