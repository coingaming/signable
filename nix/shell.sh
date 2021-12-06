#!/bin/sh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
VIM_BACKGROUND="${VIM_BACKGROUND:-light}"
VIM_COLOR_SCHEME="${VIM_COLOR_SCHEME:-PaperColor}"
USER="${USER:-developer}"
PLATFORM=`uname -m`
if [ "$PLATFORM" = "aarch64" ]; then
  PLATFORM="arm64"
fi
if [ -n "$NIX_STORE_PRV_KEY" ]; then
  NIX_CONF_SECRET="secret-key-files = /app/nix_store_prv_key"
fi
NIX_CONF="http2 = false
sandbox = false
filter-syscalls = false
cores = 2
max-jobs = 16
trusted-users = root $USER
substituters = file:///app/nix_ci_cache https://cache.nixos.org https://hydra.iohk.io https://all-hies.cachix.org
trusted-substituters = file:///app/nix_ci_cache
trusted-public-keys = $NIX_STORE_PUB_KEY cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k=
$NIX_CONF_SECRET
"

case "$1" in
  all)
    LANGUAGE="$1"
    shift
  ;;
  haskell)
    LANGUAGE="$1"
    shift
  ;;
  elixir)
    LANGUAGE="$1"
    shift
  ;;
  minimal)
    LANGUAGE="$1"
    shift
  ;;
  *)
    LANGUAGE="all"
  ;;
esac
NIX_EXTRA_ARGS="$@"

docker run -it --rm \
  -v "$THIS_DIR/..:/app" \
  -v "nix-$USER:/nix" \
  -v "nix-home-$USER:/home/$USER" \
  -w "/app" "heathmont/nix:alpine-$PLATFORM-2.3.15" sh -c "
  adduser $USER -D &&
  echo \"$NIX_STORE_PRV_KEY\" > /app/nix_store_prv_key &&
  echo \"$NIX_CONF\" >> /etc/nix/nix.conf &&
  (nix-daemon &) &&
  su $USER -c \"NIX_REMOTE=daemon nix-shell ./nix/shell.nix \
    --pure \
    --show-trace -v \
    --argstr vimBackground $VIM_BACKGROUND \
    --argstr vimColorScheme $VIM_COLOR_SCHEME \
    --argstr language $LANGUAGE \
    --argstr platform $PLATFORM \
    $NIX_EXTRA_ARGS\"
  "
