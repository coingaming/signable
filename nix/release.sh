#!/bin/sh

set -e

./nix/bootstrap.sh

export NIXPKGS_ALLOW_BROKEN=1

nix-build ./nix/signable-haskell-protoc.nix -v --show-trace
nix-build ./nix/haskell.nix -v --show-trace
nix-build ./nix/elixir.nix -v --show-trace
