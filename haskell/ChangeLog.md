# Version 0.4

- Deriving `Eq`, `Ord` and `Show` for the most of types

# Version 0.3

- Support of `secp256k1-haskell-0.5`

- Removed `toSha256` and `Sha256` redundant exports

- Moved `sign` and `verify` out of the `Signable` class

- Function `sign` output is `Sig` instead of `Maybe Sig`

# Version 0.2

- Field indexes of any unset field (message/repeated/oneof) are ignored in serialized payload to make possible rolling upgrades **BREAKING CHANGE**

- Fully qualified names are used in generated Signable class instances source code to prevent possible shadowing issues (bugfix)

- Signable class instances source code is generated in eta-reduced form to prevent possible shadowing issues (bugfix)

- Provided code for special cases where protobuf field is named as Haskell keyword like `data`, `class`, `instance` etc (bugfix)

# Version 0.1

- Initial version.
