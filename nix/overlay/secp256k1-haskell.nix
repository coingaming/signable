{ mkDerivation, base, base16-bytestring, bytestring, cereal
, deepseq, entropy, fetchgit, hashable, hpack, hspec
, hspec-discover, HUnit, libsecp256k1, monad-par, mtl, QuickCheck
, stdenv, string-conversions, unliftio
}:
mkDerivation {
  pname = "secp256k1-haskell";
  version = "0.4.0";
  src = fetchgit {
    url = "https://github.com/coingaming/secp256k1-haskell";
    sha256 = "0rvch2yvhx7sgqipggd5acqmg6ckkp1rs3z3gc3a0ii5vl62mvlh";
    rev = "5c6bc5601ee2cd6725789df3edd052b5697ecbc6";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    base base16-bytestring bytestring cereal deepseq entropy hashable
    QuickCheck string-conversions unliftio
  ];
  libraryPkgconfigDepends = [ libsecp256k1 ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base base16-bytestring bytestring cereal deepseq entropy hashable
    hspec HUnit monad-par mtl QuickCheck string-conversions unliftio
  ];
  testToolDepends = [ hspec-discover ];
  prePatch = "hpack";
  homepage = "http://github.com/haskoin/secp256k1-haskell#readme";
  description = "Bindings for secp256k1";
  license = stdenv.lib.licenses.mit;
}
