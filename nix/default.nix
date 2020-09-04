let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
    };
  },
}:
with pkgs;

let callPackage = lib.callPackageWith haskellPackages;
    pkg = callPackage ./pkg.nix {inherit stdenv;};
    systemDeps = [
      protobuf
      haskellPackages.proto-lens-protoc
      which
      makeWrapper
      cacert
    ];
    testDeps = [];
in
  haskell.lib.overrideCabal pkg (drv: {
    src = ./..;
    prePatch = ''
      cp -R ./haskell/* ./
      HASKELL_TEST_DIR=test ./script/gen-proto.sh
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
    enableSharedExecutables = false;
    enableLibraryProfiling = false;
    isLibrary = true;
    doHaddock = false;
  })
