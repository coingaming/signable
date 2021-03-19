{ mkDerivation, aeson, asn1-encoding, asn1-types, base
, base64-bytestring, binary, bytestring, casing, cryptonite
, directory, generic-arbitrary, hpack, hspec, memory, microlens
, pem, proto-lens, proto-lens-arbitrary, proto-lens-runtime
, QuickCheck, quickcheck-instances, secp256k1-haskell, stdenv, text
, universum, unordered-containers
}:
mkDerivation {
  pname = "signable";
  version = "0.4";
  src = ./../haskell;
  libraryHaskellDepends = [
    asn1-encoding asn1-types base binary bytestring casing cryptonite
    memory microlens pem proto-lens proto-lens-runtime
    secp256k1-haskell text universum
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson asn1-encoding asn1-types base base64-bytestring binary
    bytestring casing cryptonite directory generic-arbitrary hspec
    memory microlens pem proto-lens proto-lens-arbitrary
    proto-lens-runtime QuickCheck quickcheck-instances
    secp256k1-haskell text universum unordered-containers
  ];
  prePatch = "hpack";
  homepage = "https://github.com/coingaming/signable#readme";
  description = "Deterministic serialisation and signatures with proto-lens support";
  license = stdenv.lib.licenses.bsd3;
}
