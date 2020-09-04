{ mkDerivation, aeson, base, bytestring, containers, Diff, fetchgit
, file-embed, hpack, http-types, QuickCheck, quickcheck-instances
, stdenv, stm, template-haskell, text, wai, wai-websockets
, websockets
}:
mkDerivation {
  pname = "replica";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/tkachuk-labs/replica";
    sha256 = "0yfcgbqfmgw8ax8lf0lc3p9gvgqshakjzmw20fyvq0dp5wf5a6aa";
    rev = "c0046ff9b3be5e20e5306de743b83620cf59c6a9";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    aeson base bytestring containers Diff file-embed http-types stm
    template-haskell text wai wai-websockets websockets
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson base bytestring containers Diff file-embed http-types
    QuickCheck quickcheck-instances stm template-haskell text wai
    wai-websockets websockets
  ];
  prePatch = "hpack";
  homepage = "https://github.com/https://github.com/pkamenarsky/replica#readme";
  description = "Remote virtual DOM library";
  license = stdenv.lib.licenses.bsd3;
}
