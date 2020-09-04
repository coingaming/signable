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
    systemDeps = [ protobuf makeWrapper cacert ];
    testDeps = [ postgresql ];
in
  haskell.lib.overrideCabal pkg (drv: {
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
    prePatch = "hpack --force";
    preCheck = ''
      source ./nix/export-test-envs.sh;
      sh ./nix/reset-test-data.sh;
      sh ./nix/spawn-test-deps.sh;
    '';
    postCheck = ''
      sh ./nix/shutdown-test-deps.sh
    '';
  })
