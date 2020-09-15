{ mkDerivation, base, bytestring, containers, deepseq, fetchgit
, filepath, hpack, lens-family, proto-lens, stdenv, text, vector
}:
mkDerivation {
  pname = "proto-lens-runtime";
  version = "0.7.0.0";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens";
    sha256 = "1njkx0sxyghfyzn8bzphz2k5xnd0cfd5laz5cicvinksnq2z6fnl";
    rev = "f1402dad6f14157dbcb64a884cba5bd95ebbfff4";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens-runtime; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring containers deepseq filepath lens-family proto-lens
    text vector
  ];
  libraryToolDepends = [ hpack ];
  doHaddock = false;
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  license = stdenv.lib.licenses.bsd3;
}
