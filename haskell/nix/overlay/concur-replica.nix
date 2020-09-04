{ mkDerivation, aeson, base, bytestring, concur-core, containers
, fetchgit, free, hpack, mtl, random, replica, stdenv, stm, text
, transformers, wai, wai-websockets, warp, websockets
}:
mkDerivation {
  pname = "concur-replica";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/tkachuk-labs/concur-replica";
    sha256 = "1p156cx04sz0i0myv3d0kjjcp5y3s3c341jwsjdcxw65c1zzpz0v";
    rev = "7d16bcc93114c62252e3e22c208dc2a819f02435";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bytestring concur-core containers free replica stm text
    transformers wai wai-websockets warp websockets
  ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    aeson base bytestring concur-core containers free mtl random
    replica stm text transformers wai wai-websockets warp websockets
  ];
  prePatch = "hpack";
  homepage = "https://github.com/pkamenarsky/concur-replica#readme";
  description = "Replica backend for Concur";
  license = stdenv.lib.licenses.bsd3;
}
