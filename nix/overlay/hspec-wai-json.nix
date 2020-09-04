{ mkDerivation, aeson, aeson-qq, base, bytestring, case-insensitive
, hspec, hspec-wai, stdenv, template-haskell
}:
mkDerivation {
  pname = "hspec-wai-json";
  version = "0.10.1";
  sha256 = "6672dc4c9a2c1adfaa3012ed6f858af2bde168956b44de0d2d711a4264c4b712";
  libraryHaskellDepends = [
    aeson aeson-qq base bytestring case-insensitive hspec-wai
    template-haskell
  ];
  testHaskellDepends = [ base hspec hspec-wai ];
  homepage = "https://github.com/hspec/hspec-wai#readme";
  description = "Testing JSON APIs with hspec-wai";
  license = stdenv.lib.licenses.mit;
}
