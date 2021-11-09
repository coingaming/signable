{ mkDerivation, base, bytestring, containers, fetchgit, hpack
, lens-family, lib, proto-lens, QuickCheck, text
}:
mkDerivation {
  pname = "proto-lens-arbitrary";
  version = "0.1.2.10";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens.git";
    sha256 = "021s2354qw8jc6v0s1dgpig1r86jssd1raxillnbb11n2637rbmg";
    rev = "845fc11ad95ca9edd73d5ff0a5994d1a5232e1e9";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens-arbitrary; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring containers lens-family proto-lens QuickCheck text
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  description = "Arbitrary instances for proto-lens";
  license = lib.licenses.bsd3;
}
