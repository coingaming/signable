{ mkDerivation, base, bytestring, casing, containers, ghc
, ghc-paths, ghc-source-gen, hpack, lens-family, pretty, proto-lens
, proto-lens-protoc, proto-lens-runtime, stdenv, text
}:
mkDerivation {
  pname = "signable-haskell-protoc";
  version = "0.1";
  src = ./../haskell/signable-haskell-protoc;
  isLibrary = false;
  isExecutable = true;
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    base bytestring casing containers ghc ghc-paths ghc-source-gen
    lens-family pretty proto-lens proto-lens-protoc proto-lens-runtime
    text
  ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/signable#readme";
  description = "Signable orphan instances compiler";
  license = stdenv.lib.licenses.bsd3;
}
