# Signable

Deterministic serialization and signatures with [proto-lens](https://github.com/coingaming/proto-lens) and [protobuf-elixir](https://github.com/coingaming/protobuf-elixir) support. Haskell version is based on generic type class, which means it can be implemented for any data type. There is [signable-haskell-protoc](https://github.com/coingaming/signable/tree/master/haskell/signable-haskell-protoc) plugin which generates implementation for proto-lens types. Elixir version is protobuf-elixir specific.

# Serialization

Protobuf standard doesn't guarantee deterministic serialization.
In order to deterministically serialize and sign a protobuf message specific serialization protocol should be followed :

1) Sort all message fields by index (ASC order)
2) Serialize index (as uint32 to 4 bytes) and field value (take a look to notes below)
3) Concatenate index-value bytestring pairs and then concatenate resulting bytestrings

Type-specific notes

- Integers are serialized in big endian format
- Enums are serialized as uint32
- Unset message values are serialized as empty bytestring
- Unset oneof values are serialized as empty bytestring
- Repeated values are serialized and concatenated according order in payload
- Serialization protocol don't support maps and floats

# Signature

Signature is defined as a ECDSA signature of SHA256 hash of serialized payload. At the moment only SECP256K1 curve is supported.

# Testing

Every implementation must comply **all** test cases provided in [test-case](https://github.com/coingaming/signable/tree/master/test-case) directory.
If new implementation is written, it should provide generated test cases as well, for compatibility testing in already existing implementations.
