{ mkDerivation, base, base16-bytestring, bytestring, criterion
, deepseq, primitive, QuickCheck, random-bytestring, stdenv, tasty
, tasty-hunit, tasty-quickcheck, text, text-short
}:
mkDerivation {
  pname = "base16";
  version = "0.3.0.2";
  sha256 = "7ffb11cebb03350ad1666724271ffd5f42159499997952e935f19d581958539a";
  libraryHaskellDepends = [
    base bytestring deepseq primitive text text-short
  ];
  testHaskellDepends = [
    base base16-bytestring bytestring QuickCheck random-bytestring
    tasty tasty-hunit tasty-quickcheck text text-short
  ];
  benchmarkHaskellDepends = [
    base base16-bytestring bytestring criterion deepseq
    random-bytestring text
  ];
  homepage = "https://github.com/emilypi/base16";
  description = "Fast RFC 4648-compliant Base16 encoding";
  license = stdenv.lib.licenses.bsd3;
}
