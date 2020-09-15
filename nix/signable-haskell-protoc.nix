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
    pkg = callPackage ./pkg-signable-haskell-protoc.nix {inherit stdenv;};
    systemDeps = [ protobuf cacert ];
    testDeps = [ ];
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
    isExecutable = true;
    enableSharedExecutables = false;
    enableLibraryProfiling = false;
    isLibrary = false;
    doHaddock = false;
    prePatch = "hpack --force";
    postFixup = "rm -rf $out/lib $out/nix-support $out/share/doc";
  })
