#!/bin/sh

set -e

(cd ./nix/ && cabal2nix ./../haskell > ./pkg.nix)
