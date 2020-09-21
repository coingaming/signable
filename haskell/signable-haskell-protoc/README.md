# signable-haskell-protoc

Signable instances protoc compiler plugin.

```
protoc \
  ./*.proto \
  --plugin=protoc-gen-signable=`which signable-haskell-protoc` \
  --signable_out=./src
```
