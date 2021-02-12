{ mkDerivation, base, base16-bytestring, bytestring, cereal
, deepseq, entropy, hashable, hspec, hspec-discover, HUnit
, libsecp256k1, monad-par, mtl, QuickCheck, stdenv
, string-conversions, unliftio-core
}:
mkDerivation {
  pname = "secp256k1-haskell";
  version = "0.5.0";
  sha256 = "edbc125b19143ffe697b483bb92774829d0c704f601ffacadcd5678e2535b7a2";
  libraryHaskellDepends = [
    base base16-bytestring bytestring cereal deepseq entropy hashable
    QuickCheck string-conversions unliftio-core
  ];
  libraryPkgconfigDepends = [ libsecp256k1 ];
  testHaskellDepends = [
    base base16-bytestring bytestring cereal deepseq entropy hashable
    hspec HUnit monad-par mtl QuickCheck string-conversions
    unliftio-core
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://github.com/haskoin/secp256k1-haskell#readme";
  description = "Bindings for secp256k1";
  license = stdenv.lib.licenses.mit;
}
