{ mkDerivation, base, bytestring, Cabal, directory, fetchgit
, filepath, process, stdenv, unix
}:
mkDerivation {
  pname = "entropy";
  version = "0.4.1.7";
  src = fetchgit {
    url = "https://github.com/coingaming/entropy.git";
    sha256 = "1gi56yv45nd4dcbzi2a477wkxwmag5z3ii865risdbbmyvd6ajgs";
    rev = "0916ac52d1bf36cc048fd2486c6abf10b1e09cd4";
    fetchSubmodules = true;
  };
  setupHaskellDepends = [ base Cabal directory filepath process ];
  libraryHaskellDepends = [ base bytestring unix ];
  homepage = "https://github.com/TomMD/entropy";
  description = "A platform independent entropy source";
  license = stdenv.lib.licenses.bsd3;
}
