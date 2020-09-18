#! /bin/sh

set -e

gen_haskell() {
    #
    # Haskell
    #
    # To install Haskell protoc plugin without nix,
    # run `stack install proto-lens-protoc` and the
    # same for `signable-haskell-protoc`.
    #
    # Haskell stack is needed for this as well
    # https://docs.haskellstack.org/
    #
    # In general - it's much better just to use nix.
    # To spawn nix shell, run `./nix/shell.sh`.
    #
    export HASKELL_TEST_DIR="${HASKELL_TEST_DIR:-haskell/test}"
    export HASKELL_TEST_DIR_SUPPORT="$HASKELL_TEST_DIR/Support"
    export HASKELL_TEST_DIR_PROTO="$HASKELL_TEST_DIR/Proto"
    echo "==> trying to create $HASKELL_TEST_DIR_SUPPORT"
    rm -rf "$HASKELL_TEST_DIR_SUPPORT"
    mkdir -p "$HASKELL_TEST_DIR_SUPPORT"
    cp -R ./test-proto $HASKELL_TEST_DIR_SUPPORT/test-proto
    cp -R ./*-testcases.json $HASKELL_TEST_DIR_SUPPORT/
    echo "==> trying to generate $HASKELL_TEST_DIR_PROTO"
    rm -rf "$HASKELL_TEST_DIR_PROTO"
    mkdir -p "$HASKELL_TEST_DIR_PROTO"
    (cd ./test-proto/ && protoc \
      ./*.proto \
      --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
      --haskell_out=../$HASKELL_TEST_DIR)
    echo "==> generated $HASKELL_TEST_DIR_PROTO"
    (cd ./test-proto/ && protoc \
      ./*.proto \
      --plugin=protoc-gen-signable=`which signable-haskell-protoc` \
      --signable_out=../$HASKELL_TEST_DIR)
    echo "==> generated orphan signable instances in $HASKELL_TEST_DIR_PROTO"
}

gen_elixir() {
    export ELIXIR_TEST_DIR_PROTO="${ELIXIR_TEST_DIR_PROTO:-elixir/test/proto}"
    echo "==> trying to generate $ELIXIR_TEST_DIR_PROTO"
    rm -rf "$ELIXIR_TEST_DIR_PROTO"
    mkdir -p "$ELIXIR_TEST_DIR_PROTO"
    (cd ./test-proto/ && protoc \
        ./*.proto \
        --elixir_opt=using_value_wrappers=true \
        --elixir_out=../$ELIXIR_TEST_DIR_PROTO)
    echo "==> generated $ELIXIR_TEST_DIR_PROTO"
}

gen_all() {
    gen_elixir
    gen_haskell
}

if [ -z "$*" ]; then
    gen_all
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
