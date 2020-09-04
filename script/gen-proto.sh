#/bin/sh

set -e

#
# Haskell
#
# To install Haskell protoc compiler without nix,
# run `stack install proto-lens-protoc`.
#
rm -rf ./haskell/test/Proto
mkdir -p ./haskell/test/Proto
(cd ./test-proto/ && protoc \
  ./*.proto \
  --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
  --haskell_out=../haskell/test)
