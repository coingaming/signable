{ mkDerivation, base, bytestring, conduit, containers, exceptions
, fetchgit, fgl, hpack, monad-logger, mtl, persistent
, persistent-postgresql, persistent-template, process, QuickCheck
, resource-pool, stdenv, tasty, tasty-golden, tasty-quickcheck
, temporary, text, time, unordered-containers, yaml
}:
mkDerivation {
  pname = "persistent-migration";
  version = "0.1.0";
  src = fetchgit {
    url = "https://github.com/tkachuk-labs/persistent-migration";
    sha256 = "0sbq8ks81x42ih5a66g1fm0gwgmpmhwnyq9v13sqiaiwv8fnrkid";
    rev = "d75fb27181319e3fe18ff19e45198feee6a88187";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    base containers fgl mtl persistent text time unordered-containers
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base bytestring conduit containers exceptions monad-logger mtl
    persistent persistent-postgresql persistent-template process
    QuickCheck resource-pool tasty tasty-golden tasty-quickcheck
    temporary text time yaml
  ];
  prePatch = "hpack";
  homepage = "https://github.com/brandonchinn178/persistent-migration#readme";
  description = "Manual migrations for the persistent library";
  license = stdenv.lib.licenses.bsd3;
}
