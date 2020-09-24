# signable-haskell-protoc

Deterministic serialisation and signatures with proto-lens support.
Generate Signable class instances with command:

```
protoc \
  ./*.proto \
  --plugin=protoc-gen-signable=`which signable-haskell-protoc` \
  --signable_out=./src
```
