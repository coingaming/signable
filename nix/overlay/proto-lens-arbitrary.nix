{ mkDerivation, base, bytestring, containers, fetchgit, hpack
, lens-family, proto-lens, QuickCheck, stdenv, text
}:
mkDerivation {
  pname = "proto-lens-arbitrary";
  version = "0.1.2.9";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens";
    sha256 = "1njkx0sxyghfyzn8bzphz2k5xnd0cfd5laz5cicvinksnq2z6fnl";
    rev = "f1402dad6f14157dbcb64a884cba5bd95ebbfff4";
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
  license = stdenv.lib.licenses.bsd3;
}
