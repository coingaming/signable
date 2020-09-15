#!/bin/sh

set -e

(cd ./nix/ && \
  cabal2nix ./../haskell > ./pkg.nix && \
  cabal2nix ./../haskell/signable-haskell-protoc > ./pkg-signable-haskell-protoc.nix)
