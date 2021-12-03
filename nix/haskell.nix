let nixpkgs = import ./nixpkgs21.nix;
    signable-haskell-protoc = import ./signable-haskell-protoc.nix {};
in
{
  profile ? false,
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
      inherit platform;
    };
  },
  platform ? "x86_64"
}:
with pkgs;

let callPackage = lib.callPackageWith haskellPackages;
    pkg = callPackage ./pkg.nix {inherit stdenv;};
    systemDeps = [
      # Proto
      protobuf
      haskellPackages.proto-lens-protoc
      signable-haskell-protoc
      # Crypto
      secp256k1
      pkg-config
      # Misc
      which
    ];
    testDeps = [
    ];
in
  haskell.lib.overrideCabal pkg (drv: {
    src = ./..;
    prePatch = ''
      cp -R ./haskell/* ./
      HASKELL_TEST_DIR=test ./script/gen-proto.sh --haskell
      hpack --force
    '';
    setupHaskellDepends =
      if drv ? "setupHaskellDepends"
      then drv.setupHaskellDepends ++ systemDeps
      else systemDeps;
    testSystemDepends =
      if drv ? "testSystemDepends"
      then drv.testSystemDepends ++ testDeps
      else testDeps;
    isExecutable = false;
    enableSharedExecutables = profile;
    enableLibraryProfiling = profile;
    isLibrary = true;
    doHaddock = false;
  })
