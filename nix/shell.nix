let nixpkgs = import ./nixpkgs.nix;
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
    /* Protobuf */
    protobuf
    haskellPackages.proto-lens-protoc
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
