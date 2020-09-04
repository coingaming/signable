{ mkDerivation, aeson, async, base, blaze-builder, bytestring
, case-insensitive, data-default-class, directory, exceptions, fail
, hspec, hspec-discover, hspec-wai, http-types, lifted-base
, monad-control, mtl, nats, network, regex-compat, stdenv, text
, transformers, transformers-base, transformers-compat, wai
, wai-extra, warp
}:
mkDerivation {
  pname = "scotty";
  version = "0.11.5";
  sha256 = "6f3be75e2fed8b7c7d655a96788fe385629ded5196316158d814a0f9873cd2df";
  libraryHaskellDepends = [
    aeson base blaze-builder bytestring case-insensitive
    data-default-class exceptions fail http-types monad-control mtl
    nats network regex-compat text transformers transformers-base
    transformers-compat wai wai-extra warp
  ];
  testHaskellDepends = [
    async base bytestring data-default-class directory hspec hspec-wai
    http-types lifted-base network text wai
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "https://github.com/scotty-web/scotty";
  description = "Haskell web framework inspired by Ruby's Sinatra, using WAI and Warp";
  license = stdenv.lib.licenses.bsd3;
}
