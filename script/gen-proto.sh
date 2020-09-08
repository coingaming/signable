#! /bin/sh

set -e

gen_haskell() {
    #
    # Haskell
    #
    # To install Haskell protoc plugin without nix,
    # run `stack install proto-lens-protoc`.
    # Haskell stack is needed for this as well
    # https://docs.haskellstack.org/
    #
    # In general - it's much better just to use nix.
    # To spawn nix shell, run `./nix/shell.sh`.
    #
    export HASKELL_TEST_DIR="${HASKELL_TEST_DIR:-haskell/test}"
    export HASKELL_TEST_DIR_PROTO="$HASKELL_TEST_DIR/Proto"
    echo "==> trying to generate $HASKELL_TEST_DIR_PROTO"
    rm -rf "$HASKELL_TEST_DIR_PROTO"
    mkdir -p "$HASKELL_TEST_DIR_PROTO"
    (cd ./test-proto/ && protoc \
      ./*.proto \
      --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
      --haskell_out=../$HASKELL_TEST_DIR)
    echo "==> generated $HASKELL_TEST_DIR_PROTO"
}

gen_elixir() {
    rm -rf ./elixir/test/proto
    mkdir -p ./elixir/test/proto
    (cd ./test-proto/ && protoc \
        ./*.proto \
        --elixir_opt=using_value_wrappers=true \
        --elixir_out=../elixir/test/proto)
}

gen_all() {
    gen_elixir
    gen_haskell
}

if [ -z "$*" ]; then
    # gen_all
    gen_haskell
else
    for arg in "$@"
    do
        case $arg in
            -h|--haskell)
            gen_haskell
            shift
            ;;
            -e|--elixir)
            gen_elixir
            shift
            ;;
        -a|--all)
            gen_all
            break
            ;;
        esac
    done
fi
