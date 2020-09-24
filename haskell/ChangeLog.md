# Version 0.2

- Field indexes of any unset field (message/repeated/oneof) are ignored in serialized payload to make possible rolling upgrades **BREAKING CHANGE**

- Fully qualified names are used in generated Signable class instances source code to prevent possible shadowing issues (bugfix)

- Signable class instances source code is generated in eta-reduced form to prevent possible shadowing issues (bugfix)

- Provided code for special cases where protobuf field is named as Haskell keyword like `data`, `class`, `instance` etc (bugfix)

# Version 0.1

- Initial version.
