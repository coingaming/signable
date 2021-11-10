{ mkDerivation, base, bytestring, containers, deepseq, fetchgit
, filepath, hpack, lens-family, lib, ncurses, proto-lens, protobuf
, text, vector
}:
mkDerivation {
  pname = "proto-lens-runtime";
  version = "0.7.0.1";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens.git";
    sha256 = "021s2354qw8jc6v0s1dgpig1r86jssd1raxillnbb11n2637rbmg";
    rev = "845fc11ad95ca9edd73d5ff0a5994d1a5232e1e9";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens-runtime; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring containers deepseq filepath lens-family proto-lens
    text vector
  ];
  libraryToolDepends = [ hpack ncurses protobuf ];
  doHaddock = false;
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  license = lib.licenses.bsd3;
}
