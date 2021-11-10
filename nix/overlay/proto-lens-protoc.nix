{ mkDerivation, base, bytestring, containers, fetchgit, filepath
, ghc, ghc-paths, ghc-source-gen, hpack, lens-family, lib, ncurses
, pretty, proto-lens, proto-lens-runtime, protobuf, text
}:
mkDerivation {
  pname = "proto-lens-protoc";
  version = "0.7.1.0";
  src = fetchgit {
    url = "https://github.com/coingaming/proto-lens.git";
    sha256 = "021s2354qw8jc6v0s1dgpig1r86jssd1raxillnbb11n2637rbmg";
    rev = "845fc11ad95ca9edd73d5ff0a5994d1a5232e1e9";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/proto-lens-protoc; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base filepath ];
  libraryToolDepends = [ hpack ncurses protobuf ];
  executableHaskellDepends = [
    base bytestring containers filepath ghc ghc-paths ghc-source-gen
    lens-family pretty proto-lens proto-lens-runtime text
  ];
  executableToolDepends = [ ncurses protobuf ];
  prePatch = "hpack";
  homepage = "https://github.com/google/proto-lens#readme";
  description = "Protocol buffer compiler for the proto-lens library";
  license = lib.licenses.bsd3;
}
