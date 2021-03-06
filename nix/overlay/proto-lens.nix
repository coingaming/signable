{ mkDerivation, base, bytestring, containers, deepseq, fetchgit
, ghc-prim, hpack, lens-family, parsec, pretty, primitive
, profunctors, QuickCheck, stdenv, tagged, tasty, tasty-quickcheck
, text, transformers, vector
}:
mkDerivation {
  pname = "proto-lens";
  version = "0.7.0.0";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens";
    sha256 = "1njkx0sxyghfyzn8bzphz2k5xnd0cfd5laz5cicvinksnq2z6fnl";
    rev = "f1402dad6f14157dbcb64a884cba5bd95ebbfff4";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    base bytestring containers deepseq ghc-prim lens-family parsec
    pretty primitive profunctors tagged text transformers vector
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base bytestring QuickCheck tasty tasty-quickcheck vector
  ];
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  description = "A lens-based implementation of protocol buffers in Haskell";
  license = stdenv.lib.licenses.bsd3;
}
