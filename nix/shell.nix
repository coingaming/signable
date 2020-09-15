let nixpkgs = import ./nixpkgs.nix;
    signable-haskell-protoc = import ./signable-haskell-protoc.nix {};
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
      inherit vimBackground vimColorScheme;
    };
  },
  vimBackground ? "light",
  vimColorScheme ? "PaperColor"
}:
with pkgs;

stdenv.mkDerivation {
  name = "signable-shell";
  buildInputs = [
    /* IDE */
    haskell-ide
    /* BEAM */
    rebar
    rebar3
    erlang
    elixir
    /* Protobuf */
    protobuf
    haskellPackages.proto-lens-protoc
    signable-haskell-protoc
    protoc-gen-elixir
    /* Crypto */
    secp256k1
    pkg-config
    openssh
    /* Nix */
    cabal2nix
    nix-prefetch-scripts
    /* Other */
    git
    cacert
    which
  ];

  TERM="xterm-256color";
  GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_PATH="/nix/var/nix/profiles/per-user/root/channels";

  shellHook = ''
    export MIX_HOME=`pwd`/.mix
    export HEX_HOME=`pwd`/.hex
    mix local.rebar rebar ${rebar}/bin/rebar --force
    mix local.rebar rebar3 ${rebar3}/bin/rebar3 --force

    source ./nix/export-test-envs.sh
    sh ./nix/reset-test-data.sh
    sh ./nix/spawn-test-deps.sh
    sh ./script/gen-proto.sh

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
  '';
}
