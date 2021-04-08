let nixpkgs20 = import ./nixpkgs20.nix;
    pkgs20 = import nixpkgs20 {};
    hex = pkgs20.callPackage (
      nixpkgs20 + "/pkgs/development/beam-modules/hex/default.nix"
    ) {};
    mix = pkgs20.callPackage (
      nixpkgs20 + "/pkgs/development/beam-modules/build-mix.nix"
    ) {inherit hex;};
in
{
  vimBackground ? "light",
  vimColorScheme ? "PaperColor",
  haskellPackagesLens ? (x: x.haskell.packages.ghc865)
}:
[
  (self: super:
    let
      callPackage = self.lib.callPackageWith self.haskellPackages;
      dontCheck = self.haskell.lib.dontCheck;
      doJailbreak = self.haskell.lib.doJailbreak;
    in
      {
        haskell-ide = import (
          fetchTarball "https://github.com/tim2CF/ultimate-haskell-ide/tarball/a3424a3100f9be4fa88603999db988bf87d91718"
        ) {inherit vimBackground vimColorScheme;};
        rebar = pkgs20.rebar;
        rebar3 = pkgs20.rebar3;
        erlang = pkgs20.erlang;
        elixir = pkgs20.elixir;
        hex = hex;
        mix = mix;
        protoc-gen-elixir = import ./overlay/protoc-gen-elixir.nix {};
        haskellPackages = (haskellPackagesLens super).extend(
          self': super': {
            universum = dontCheck super'.universum;
            parameterized = dontCheck super'.parameterized;
            cryptonite = callPackage ./overlay/cryptonite.nix {
              stdenv = self.stdenv;
            };
            swagger2 = callPackage ./overlay/swagger2.nix {
              stdenv = self.stdenv;
            };
            base16-bytestring = callPackage ./overlay/base16-bytestring.nix {
              stdenv = self.stdenv;
            };
            cryptohash-md5 = dontCheck (callPackage ./overlay/cryptohash-md5.nix {
              stdenv = self.stdenv;
            });
            cryptohash-sha1 = dontCheck (callPackage ./overlay/cryptohash-sha1.nix {
              stdenv = self.stdenv;
            });
            proto-lens = callPackage ./overlay/proto-lens.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            proto-lens-protoc = callPackage ./overlay/proto-lens-protoc.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            proto-lens-runtime = callPackage ./overlay/proto-lens-runtime.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            proto-lens-arbitrary = callPackage ./overlay/proto-lens-arbitrary.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            secp256k1-haskell = dontCheck (callPackage ./overlay/secp256k1-haskell.nix {
              stdenv = self.stdenv;
              libsecp256k1 = self.secp256k1;
            });
            ghc-source-gen = callPackage ./overlay/ghc-source-gen.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            asn1-encoding = callPackage ./overlay/asn1-encoding.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
          }
        );
      })
]
