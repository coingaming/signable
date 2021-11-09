{ mkDerivation, base, bytestring, containers, deepseq, fetchgit
, ghc-prim, hpack, lens-family, lib, ncurses, parsec, pretty
, primitive, profunctors, protobuf, QuickCheck, tagged, tasty
, tasty-quickcheck, text, transformers, vector
}:
mkDerivation {
  pname = "proto-lens";
  version = "0.7.1.0";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens.git";
    sha256 = "021s2354qw8jc6v0s1dgpig1r86jssd1raxillnbb11n2637rbmg";
    rev = "845fc11ad95ca9edd73d5ff0a5994d1a5232e1e9";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    base bytestring containers deepseq ghc-prim lens-family parsec
    pretty primitive profunctors tagged text transformers vector
  ];
  libraryToolDepends = [ hpack ncurses protobuf ];
  testHaskellDepends = [
    base bytestring QuickCheck tasty tasty-quickcheck vector
  ];
  testToolDepends = [ ncurses protobuf ];
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  description = "A lens-based implementation of protocol buffers in Haskell";
  license = lib.licenses.bsd3;
}
