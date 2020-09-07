{ mkDerivation, base, binary, bytestring, casing, containers
, cryptonite, generic-arbitrary, hpack, hspec, memory, microlens
, proto-lens, proto-lens-arbitrary, proto-lens-runtime, QuickCheck
, quickcheck-instances, secp256k1-haskell, stdenv, template-haskell
, text, universum
}:
mkDerivation {
  pname = "signable";
  version = "0.1";
  src = ./../haskell;
  libraryHaskellDepends = [
    base binary bytestring casing containers cryptonite
    generic-arbitrary hspec memory microlens proto-lens
    proto-lens-arbitrary proto-lens-runtime QuickCheck
    quickcheck-instances secp256k1-haskell template-haskell text
    universum
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base binary bytestring casing containers cryptonite
    generic-arbitrary hspec memory microlens proto-lens
    proto-lens-arbitrary proto-lens-runtime QuickCheck
    quickcheck-instances secp256k1-haskell template-haskell text
    universum
  ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/signable#readme";
  description = "Deterministic serialisation and signatures with proto-lens support";
  license = stdenv.lib.licenses.bsd3;
}
