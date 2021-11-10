{ mkDerivation, base, base16, bytestring, cereal, deepseq, entropy
, hashable, hspec, hspec-discover, HUnit, libsecp256k1, monad-par
, mtl, QuickCheck, stdenv, string-conversions, unliftio-core
}:
mkDerivation {
  pname = "secp256k1-haskell";
  version = "0.6.0";
  sha256 = "41ea8aeadc494910f1c3290cdf9a9c69869ca9643eaa6f608265ce607c3f0363";
  libraryHaskellDepends = [
    base base16 bytestring cereal deepseq entropy hashable QuickCheck
    string-conversions unliftio-core
  ];
  libraryPkgconfigDepends = [ libsecp256k1 ];
  testHaskellDepends = [
    base base16 bytestring cereal deepseq entropy hashable hspec HUnit
    monad-par mtl QuickCheck string-conversions unliftio-core
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://github.com/haskoin/secp256k1-haskell#readme";
  description = "Bindings for secp256k1";
  license = stdenv.lib.licenses.mit;
}
