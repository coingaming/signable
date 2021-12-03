let nixpkgs = import ./nixpkgs21.nix;
    pkgs20 = import (import ./nixpkgs20.nix) {};
    signable-haskell-protoc = import ./signable-haskell-protoc.nix {};
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
      inherit vimBackground vimColorScheme platform;
    };
  },
  vimBackground ? "light",
  vimColorScheme ? "PaperColor",
  language ? "all",
  platform ? "x86_64"
}:
with pkgs;
with builtins;
with lib.lists;
with lib.strings;

let inputs-registry = {
      haskell = [
        haskell-ide
        haskellPackages.proto-lens-protoc
        signable-haskell-protoc
      ];
      elixir = [
        rebar
        rebar3
        erlang
        elixir
        protoc-gen-elixir
      ];
      minimal = [

      ];
    };
    derived-inputs =
      if language == "all"
      then concatLists (attrValues inputs-registry)
      else getAttr language inputs-registry;
    hooks-registry = {
      haskell = ''

        export HOOGLEDB=/root/.hoogle
        if [ "$(ls -A $HOOGLEDB)" ]; then
          echo "hoogle database already exists..."
        else
          echo "building hoogle database..."
          stack --stack-yaml=/app/stack.yaml exec hoogle generate
        fi

        if [ "$(ls -A ~/.cabal)" ]; then
          echo "cabal database already exists..."
        else
          echo "building cabal database..."
          cabal v2-update
        fi

        sh ./script/gen-proto.sh haskell

      '';
      elixir = ''

        export MIX_HOME=`pwd`/.mix
        export HEX_HOME=`pwd`/.hex
        mix local.rebar rebar ${rebar}/bin/rebar --force
        mix local.rebar rebar3 ${rebar3}/bin/rebar3 --force

        sh ./script/gen-proto.sh elixir

      '';
      minimal = ''

      '';
    };
    derived-hooks =
      if language == "all"
      then concatStrings (attrValues hooks-registry)
      else getAttr language hooks-registry;

in

stdenv.mkDerivation {
  name = "signable-shell";
  buildInputs = [
    protobuf
    /* Crypto */
    secp256k1
    pkg-config
    openssh
    /* Nix */
    nix
    pkgs20.cabal2nix
    nix-prefetch-scripts
    /* Other */
    git
    cacert
    which
  ] ++ derived-inputs;
  shellHook = ''

  '' + derived-hooks;
  TERM="xterm-256color";
  GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_PATH="/nix/var/nix/profiles/per-user/root/channels";
}
