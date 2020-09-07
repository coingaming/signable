#! /bin/sh

set -e

gen_haskell() {
    # To install Haskell protoc compiler without nix,
    # run `stack install proto-lens-protoc`.
    #
    echo "haskell"
    rm -rf ./haskell/test/Proto
    mkdir -p ./haskell/test/Proto
    (cd ./test-proto/ && protoc \
        ./*.proto \
        --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
        --haskell_out=../haskell/test)
}

gen_elixir() {
    echo "elixir"
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
