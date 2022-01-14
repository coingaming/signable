let nixpkgs = import ./nixpkgs21.nix;
    pkgs20 = import (import ./nixpkgs20.nix) {};
    signable-haskell-protoc = import ./signable-haskell-protoc.nix {};
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
      inherit vimBackground vimColorScheme;
    };
  },
  language ? "all",
  vimBackground ? "light",
  vimColorScheme ? "PaperColor"
}:
with pkgs;
with builtins;
with lib.lists;
with lib.strings;

let inputs-registry = {
      haskell = [
        # ide
        haskell-ide
        # proto
        haskellPackages.proto-lens-protoc
        signable-haskell-protoc
        # nix
        pkgs20.cabal2nix
      ];
      elixir = [
        # compiler
        rebar
        rebar3
        erlang
        elixir
        # proto
        protoc-gen-elixir
      ];
    };
    derived-inputs =
      if language == "all"
      then concatLists (attrValues inputs-registry)
      else getAttr language inputs-registry;
    hooks-registry = {
      haskell = ''

        export HOOGLEDB=~/.hoogle
        if [ "$(ls -A $HOOGLEDB)" ]; then
          echo "hoogle database already exists..."
        else
          echo "building hoogle database..."
          stack --stack-yaml=/app/haskell/stack.yaml exec hoogle generate
        fi

        if [ "$(ls -A ~/.cabal)" ]; then
          echo "cabal database already exists..."
        else
          echo "building cabal database..."
          cabal v2-update
        fi

      '';
      elixir = ''

        export MIX_HOME=`pwd`/.mix
        export HEX_HOME=`pwd`/.hex
        mix local.rebar rebar ${rebar}/bin/rebar --force
        mix local.rebar rebar3 ${rebar3}/bin/rebar3 --force

      '';
    };
    derived-hooks =
      if language == "all"
      then concatStrings (attrValues hooks-registry)
      else getAttr language hooks-registry;

in

stdenv.mkDerivation {
  name = "signable-shell";
  buildInputs = derived-inputs ++ [
    # proto
    protobuf
    # crypto
    secp256k1
    pkg-config
    openssh
    # nix
    nix-prefetch-scripts
    # other
    git
    cacert
    which
  ];

  TERM="xterm-256color";
  GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_PATH="/nix/var/nix/profiles/per-user/root/channels";

  shellHook = derived-hooks + ''
    source ./nix/export-test-envs.sh
    sh ./nix/reset-test-data.sh
    sh ./nix/spawn-test-deps.sh
    sh ./script/gen-proto.sh ${language}
  '';
}
