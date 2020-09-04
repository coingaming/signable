{ mkDerivation, base, fetchgit, free, hpack, mtl
, natural-transformation, stdenv, stm, transformers
}:
mkDerivation {
  pname = "concur-core";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/tkachuk-labs/concur";
    sha256 = "1gdp8n8p11gyyna8lazcljijfkl11sxmbwnh3kgg5j9bcxw2cb1f";
    rev = "dc5347b35c79654d58fa95716f425ee7248504fb";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/concur-core; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base free mtl natural-transformation stm transformers
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/ajnsit/concur#readme";
  description = "A UI framework for Haskell. Core framework.";
  license = stdenv.lib.licenses.bsd3;
}
