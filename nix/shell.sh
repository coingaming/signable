#!/bin/sh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
VIM_BACKGROUND="${VIM_BACKGROUND:-light}"
VIM_COLOR_SCHEME="${VIM_COLOR_SCHEME:-PaperColor}"
USER="${USER:-haskell}"
NIX_CONF="http2 = false
trusted-users = root $USER
extra-substituters = https://cache.nixos.org https://hydra.iohk.io https://all-hies.cachix.org
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k=
"

if [ -z "$*" ]; then
  LANGUAGE="all"
else
  for arg in "$@"
  do
    case $arg in
      -h|--haskell|haskell)
      LANGUAGE="haskell"
      shift
      ;;
      -e|--elixir|elixir)
      LANGUAGE="elixir"
      shift
      ;;
      -a|--all|all)
      LANGUAGE="all"
      break
      ;;
    esac
  done
fi

docker run -it --rm \
  -e NIXPKGS_ALLOW_BROKEN=1 \
  -v "$THIS_DIR/..:/app" \
  -v "nix-$USER:/nix" \
  -v "nix-home-$USER:/home/$USER" \
  -w "/app" nixos/nix:2.3.12 \
  sh -c "
  adduser $USER -D &&
  echo \"$NIX_CONF\" >> /etc/nix/nix.conf &&
  (nix-daemon &) &&
  sleep 1 &&
  su $USER -c \"NIX_REMOTE=daemon nix-shell ./nix/shell.nix \
    --pure \
    --show-trace -v \
    --arg usingDocker true \
    --argstr language $LANGUAGE \
    --argstr vimBackground $VIM_BACKGROUND \
    --argstr vimColorScheme $VIM_COLOR_SCHEME\"
  "
