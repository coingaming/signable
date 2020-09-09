# Signable - deterministic protobuf serialization

```protobuf
syntax="proto3";
package Example;

import "lab_protobuf/global/umoney.proto";
import "lab_protobuf/google_protobuf.proto";

message Request {
  Payload payload = 1;
  bytes signature = 2;

  message Payload {
    uint64 user_id_from = 1;
    Lab.Global.UMoney amount = 2;
    oneof to {
      uint64 user_id_to = 3;
      string merchant_id_to = 4;
      Google.Protobuf.StringValue invoice_to = 5;
    }
  }
}
```

In order to correctly serialize and sign a protobuf message one needs to agree on specific serialization protocol (protobuf itself doesn't guarantee deterministic serialization).
The rules are:
Start with an empty byte array and append each field starting from 1 to the end of array according to following rules:
1. If field is of simple (integer, string, bytes, bool) type, encode it into bytes (big endian, with sign if necessary) and append it together with field number:
```elixir
def encode(:uint64, field_index, uint64_val, acc) do
  acc <> <<field_index::32, uint64_val::64>>
end

def encode(:int64, field_index, int64_val, acc) do
  acc <> <<field_index::32, int64_val::64>>
end

def encode(:string, field_index, string_val, acc) do
  acc <> <<field_index::32>> <> string_val
end

def encode(:bool, field_index, bool_val, acc) do
  if bool_val do
    acc <> <<field_index::32, 1::8>>
  else
    acc <> <<field_index::32, 0::8>>
  end
end
```
2. If field is of enum type, encode it's index as uint32
```elixir
def encode(LabFlask.Proto.Lab.Global.PaymentMethod, payment_method, acc) do
  ## mapping() returns a map of atom to index
  index = LabFlask.Proto.Lab.Global.PaymentMethod.mapping() |> Map.get(payment_method)
  encode(:uint32, index, acc)
end
```

3. If field is of embedded type, put nothing if value is absent(nil), otherwise put data according to 1
```elixir
def encode(Google.Protobuf.StringValue, nil, acc) do
  acc
end
def encode(Google.Protobuf.StringValue, str, acc) do
  acc <> <<field_index::32>> <> str
end

def encode(UMoney, nil, acc), do: acc
def encode(UMoney, val, acc), do: ...
```
4. If field is of oneof type, put only existing data according to 1 or 2
5. If the field is of repeated type, serialize all its elements according to rules defined in 1-3
In other words: if field has value nil, put nothing to the encoded byte array, if value is not nil, encode it and put into byte array

Handling of other cases will be defined later

# Signature
Signature is defined as a ECDSA signature of sha256 hash of serialized payload
