{ mkDerivation, array, base, base-compat, base-orphans, binary
, bytestring, containers, deepseq, Diff, directory, filepath
, integer-logarithms, mtl, optparse-applicative, parsec, pretty
, process, QuickCheck, stdenv, stm, tagged, tar, tasty
, tasty-golden, tasty-hunit, tasty-quickcheck, temporary, text
, time, transformers, tree-diff, unix
}:
mkDerivation {
  pname = "Cabal";
  version = "3.2.0.0";
  sha256 = "f2053a57c66457cfe48db906f0bdf98eb717a12c3c16a98561921f15035de66f";
  revision = "1";
  editedCabalFile = "0zxp3h8bvmby0h8yibnn1wpsg1fb5lk6xmb2iwg391x6m6rysaml";
  setupHaskellDepends = [ mtl parsec ];
  libraryHaskellDepends = [
    array base binary bytestring containers deepseq directory filepath
    mtl parsec pretty process text time transformers unix
  ];
  testHaskellDepends = [
    array base base-compat base-orphans binary bytestring containers
    deepseq Diff directory filepath integer-logarithms
    optparse-applicative pretty process QuickCheck stm tagged tar tasty
    tasty-golden tasty-hunit tasty-quickcheck temporary text tree-diff
  ];
  doCheck = false;
  homepage = "http://www.haskell.org/cabal/";
  description = "A framework for packaging Haskell software";
  license = stdenv.lib.licenses.bsd3;
}
