let nixpkgs = import ./../nixpkgs.nix;
in
{
  pkgs ? import nixpkgs {}
}:
with pkgs;

let hex = callPackage (
            nixpkgs + "/pkgs/development/beam-modules/hex/default.nix"
          ) {};
    mix = callPackage (
            nixpkgs + "/pkgs/development/beam-modules/build-mix.nix"
          ) {inherit hex;};
in

mix {
  name = "protoc-gen-elixir";
  version = "0.1.0";
  src = fetchTarball {
    url="https://github.com/coingaming/protobuf-elixir/archive/ac717176ed6deb0ba473c4bc30d4d001d4b026e4.tar.gz";
    sha256="08jbq74180qhbfzvs3c0v6xj29nbhpdrb03ba3qz9f4np8nz9qq7";
  };
  buildInputs = [
    git
    rebar
    rebar3
    cacert
    erlang
    elixir
    openssh
    coreutils
  ];
  nativeBuildInputs = [ makeWrapper ];
  preBuild = ''
    echo "preBuild ==> env"
    export MIX_ENV=prod
    export MIX_HOME=`pwd`
    export HEX_HOME=`pwd`

    echo "preBuild ==> rebar"
    mix local.rebar rebar ${rebar}/bin/rebar --force
    mix local.rebar rebar3 ${rebar3}/bin/rebar3 --force

    echo "preBuild ==> deps.get"
    mix deps.get

    echo "preBuild ==> deps.compile"
    mix deps.compile
  '';
  postBuild = ''
    echo "postBuild ==> escript"
    mix escript.build --no-deps-check
  '';
  doCheck = true;
  installPhase = ''
    echo "installPhase ==> copy executable"
    rm -rf $out
    mkdir -p $out/bin/
    cp ./protoc-gen-elixir $out/bin/protoc-gen-elixir
    wrapProgram $out/bin/protoc-gen-elixir --prefix PATH ":" ${erlang}/bin ;
  '';
  GIT_SSL_CAINFO = "${cacert}/etc/ssl/certs/ca-bundle.crt";
  SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";
}

