{ mkDerivation, base, bytestring, cryptonite, esqueleto
, generic-arbitrary, hpack, hspec, persistent, persistent-template
, QuickCheck, quickcheck-instances, stdenv, text, universum
}:
mkDerivation {
  pname = "signable";
  version = "0.1";
  src = ./..;
  libraryHaskellDepends = [
    base bytestring cryptonite esqueleto generic-arbitrary hspec
    persistent persistent-template QuickCheck quickcheck-instances text
    universum
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base bytestring cryptonite esqueleto generic-arbitrary hspec
    persistent persistent-template QuickCheck quickcheck-instances text
    universum
  ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/signable#readme";
  description = "Deterministic serialisation and signatures with proto-lens support";
  license = stdenv.lib.licenses.bsd3;
}
