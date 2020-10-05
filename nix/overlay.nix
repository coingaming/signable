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
          fetchTarball "https://github.com/tim2CF/ultimate-haskell-ide/tarball/01f50964156a60957428ce103e238b093861328e"
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
            persistent-migration = dontCheck (
              callPackage ./overlay/persistent-migration.nix {
                stdenv = self.stdenv;
                fetchgit = self.fetchgit;
              });
            hspec-wai = callPackage ./overlay/hspec-wai.nix {
              stdenv = self.stdenv;
            };
            hspec-wai-json = callPackage ./overlay/hspec-wai-json.nix {};
            scotty = callPackage ./overlay/scotty.nix {};
            HaskellNet = callPackage ./overlay/haskell-net.nix {};
            concur-core = callPackage ./overlay/concur-core.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            replica = callPackage ./overlay/replica.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            concur-replica = callPackage ./overlay/concur-replica.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
            parameterized = dontCheck super'.parameterized;
            swagger2 = callPackage ./overlay/swagger2.nix {
              stdenv = self.stdenv;
            };
            grpc-haskell-core = callPackage ./overlay/grpc-haskell-core.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
              grpc = self.grpc;
            };
            grpc-haskell = dontCheck (callPackage ./overlay/grpc-haskell.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            });
            proto3-suite = dontCheck (doJailbreak
              (callPackage ./overlay/proto3-suite.nix {
                stdenv = self.stdenv;
                fetchgit = self.fetchgit;
              })
            );
            proto3-wire = callPackage ./overlay/proto3-wire.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
            };
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
            secp256k1-haskell = callPackage ./overlay/secp256k1-haskell.nix {
              stdenv = self.stdenv;
              fetchgit = self.fetchgit;
              libsecp256k1 = self.secp256k1;
            };
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
