{ mkDerivation, base, bytestring, Cabal, casing, containers, ghc
, ghc-paths, ghc-source-gen, hpack, lens-family, proto-lens
, proto-lens-protoc, proto-lens-runtime, proto-lens-setup, stdenv
, text
}:
mkDerivation {
  pname = "signable-haskell-protoc";
  version = "0.2";
  src = ./../haskell/signable-haskell-protoc;
  isLibrary = false;
  isExecutable = true;
  setupHaskellDepends = [ base Cabal proto-lens-setup ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    base bytestring casing containers ghc ghc-paths ghc-source-gen
    lens-family proto-lens proto-lens-protoc proto-lens-runtime text
  ];
  executableToolDepends = [ proto-lens-protoc ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/signable#readme";
  description = "Deterministic serialisation and signatures with proto-lens support";
  license = stdenv.lib.licenses.bsd3;
}
