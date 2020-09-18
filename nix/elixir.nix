let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
    };
  },
}:
with pkgs;

mix {
  name = "signable";
  version = "0.1.0";
  src = ./..;
  prePatch = ''
    cp -R ./elixir/* ./
    ELIXIR_TEST_DIR_PROTO=test/proto ./script/gen-proto.sh --elixir
  '';
  buildInputs = [
    git
    rebar
    rebar3
    erlang
    elixir
    protobuf
    protoc-gen-elixir
  ];
  preBuild = ''
    echo "preBuild ==> env"
    export HEX_HOME=`pwd`
    export MIX_HOME=`pwd`
    export MIX_ENV=prod

    echo "preBuild ==> rebar"
    mix local.rebar rebar ${rebar}/bin/rebar --force
    mix local.rebar rebar3 ${rebar3}/bin/rebar3 --force

    echo "preBuild ==> deps.get"
    mix deps.get

    echo "preBuild ==> deps.compile"
    mix deps.compile
  '';
  checkPhase = ''
    echo "checkPhase ==> env"
    export HEX_OFFLINE=1
    export HEX_HOME=`pwd`
    export MIX_HOME=`pwd`
    export MIX_ENV=test
    export MIX_NO_DEPS=1

    echo "checkPhase ==> test"
    SIGNABLE_TC_FILEPATH="$(pwd)/test-case/elixir.json" mix test
    SIGNABLE_TC_FILEPATH="$(pwd)/test-case/haskell.json" mix test
  '';
  doCheck = true;
  GIT_SSL_CAINFO = "${cacert}/etc/ssl/certs/ca-bundle.crt";
  SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";
}
