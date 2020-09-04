{ mkDerivation, base, binary, bytestring, cryptonite, esqueleto
, generic-arbitrary, hpack, hspec, memory, microlens, persistent
, persistent-template, proto-lens, proto-lens-runtime, QuickCheck
, quickcheck-instances, secp256k1-haskell, stdenv, text, universum
}:
mkDerivation {
  pname = "signable";
  version = "0.1";
  src = ./../haskell;
  libraryHaskellDepends = [
    base binary bytestring cryptonite esqueleto generic-arbitrary hspec
    memory microlens persistent persistent-template proto-lens
    proto-lens-runtime QuickCheck quickcheck-instances
    secp256k1-haskell text universum
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base binary bytestring cryptonite esqueleto generic-arbitrary hspec
    memory microlens persistent persistent-template proto-lens
    proto-lens-runtime QuickCheck quickcheck-instances
    secp256k1-haskell text universum
  ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/signable#readme";
  description = "Deterministic serialisation and signatures with proto-lens support";
  license = stdenv.lib.licenses.bsd3;
}
