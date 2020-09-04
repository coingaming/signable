{ mkDerivation, array, base, base64-string, bytestring, cryptohash
, fetchgit, mime-mail, mtl, network, network-bsd, old-time, pretty
, stdenv, text
}:
mkDerivation {
  pname = "HaskellNet";
  version = "0.5.1";
  src = fetchgit {
    url = "https://github.com/tkachuk-labs/HaskellNet";
    sha256 = "1g8082bjqbfmkic34q41727h13mjpkg9gzg33lrp7xy1q43flrqh";
    rev = "73bf47e9e4ee7ec18da0da2b23a18d4e4baa8485";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    array base base64-string bytestring cryptohash mime-mail mtl
    network network-bsd old-time pretty text
  ];
  homepage = "https://github.com/jtdaugherty/HaskellNet";
  description = "Client support for POP3, SMTP, and IMAP";
  license = stdenv.lib.licenses.bsd3;
}
