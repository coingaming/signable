# Signable

Deterministic serialization and signatures with [proto-lens](https://github.com/coingaming/proto-lens) and [protobuf-elixir](https://github.com/coingaming/protobuf-elixir) support. Haskell version is based on generic type class, which means it can be implemented for any data type. There is [signable-haskell-protoc](https://github.com/coingaming/signable/tree/master/haskell/signable-haskell-protoc) plugin which generates implementation for proto-lens types. Elixir version is protobuf-elixir specific.

# Serialization

Protobuf standard doesn't guarantee deterministic serialization.
In order to deterministically serialize and sign a protobuf message specific serialization protocol should be followed:

1) Sort all message fields by index (ASC order)
2) Serialize every field value (take a look to type-specific notes below)
3) If field value is unset (message/oneof) or is empty list (repeated) then leave serialized value as it is (empty bytestring), otherwise prepend it with serialized field index (as uint32 4 bytes)
4) Concatenate resulting bytestrings

## Type-specific notes

- Integers are serialized in big endian format
- Enums are serialized as uint32
- Unset message values are serialized as empty bytestring
- Unset oneof values are serialized as empty bytestring
- Repeated values are serialized and concatenated according order in payload
- Serialization protocol don't support maps and floats

## Protobuf schema upgrade

1) Add new **optional** (message/repeated/oneof) field to protobuf schema
2) Upgrade **receiver** side (signatures of unupgraded sender still will be valid in case where optional field has been added)
3) Upgrade **sender** side

## Explanation

Suppose we have upgraded proto message by adding a new required field. Signature verification is going to work like this:

| Sender    | Receiver  | Signature status    |
|-----------|-----------|---------------------|
| aware     | aware     | signatures match    |
| aware     | not aware | signatures mismatch |
| not aware | aware     | signatures match    |
| not aware | not aware | signatures match    |

From this table its clear that only scenario where signatures can mismatch is the second one. To prevent that, we must
start all proto upgrades from receiver side. However if we add a required field and upgrade the receiver, he will get a signature
mismatch since there will be no data for serialized representation of newly added field (since sender is not aware of upgrade yet).
To avoid this issue, all newly added scalar fields must be added in wrapper type (Google.Protobuf.StringValue, Google.Protobuf.BytesValue, etc.).

# Signature

Signature is defined as a ECDSA signature of SHA256 hash of serialized payload. At the moment only SECP256K1 curve is supported.

# Testing

Every implementation must comply **all** test cases provided in [test-case](https://github.com/coingaming/signable/tree/master/test-case) directory.
If new implementation is written, it should provide generated test cases as well, for compatibility testing in already existing implementations.

## Test-case file description
Each test case file is a json object with following fields:
* `public_key_pem`: EC public key that can be used to verify signatures in test cases, PEM format
* `private_key_pem`: EC private key that can be used to generate new signatures (generate new test cases), PEM format
* `curve`: Elliptic curve type of `public_key_pem` and `private_key_pem`, lowercase
* `testcases`: json array of test case objects:
   * `test_description`: Test description
   * `proto_message_type`: Protobuf message used in this test case
   * `proto_serialized_b64`: Protobuf message of type `proto_message_type` encoded in base64
   * `signable_serialized_b64`: Same message serialized using signable library, encoded in base64
   * `signable_signature_b64`: Signature of sha256 hash of binary data generated by `signable` serializer from this protobuf message, encoded in base64

## Test cases execution
For each test case in `testcases` array:
1. Deserialize `proto_serialized_b64` into protobuf message `proto_message_type` using protobuf decoder, store result in `message`
2. Serialize `message` using your `signable` implementation, store result in `message_serialized`
3. Encode `message_serialized` into base64 and compare with `signable_serialized_b64`. Test is failed if they are different
4. Verify a EC signature of sha256 hash of payload `message_serialized` with signature `signable_signature_b64` (decode from base64 first), public key is `public_key_pem` from json root. If signature verification failed, test is failed as well
