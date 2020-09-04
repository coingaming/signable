#/bin/sh

set -e

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
