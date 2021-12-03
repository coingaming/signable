#!/bin/sh

set -e

PLATFORM=`uname -m`
if [ "$PLATFORM" = "aarch64" ]; then
  PLATFORM="arm64"
fi

nix-build ./nix/signable-haskell-protoc.nix \
  -v --show-trace \
  --argstr platform $PLATFORM
nix-build ./nix/haskell.nix \
  -v --show-trace \
  --argstr platform $PLATFORM
nix-build ./nix/elixir.nix \
  -v --show-trace \
  --argstr platform $PLATFORM
