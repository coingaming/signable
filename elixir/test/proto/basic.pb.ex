defmodule Basic.CurrencyCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :BTC | :EUR | :USD | :ETH

  field :BTC, 0
  field :EUR, 1
  field :USD, 2
  field :ETH, 3
end

defmodule Basic.RequestType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :USER | :LEDGER

  field :USER, 0
  field :LEDGER, 1
end

defmodule Basic.Payload do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          to: {atom, any},
          user_id_from: non_neg_integer,
          amount: Basic.UMoney.t() | nil,
          request_type: Basic.RequestType.t(),
          add_fee: boolean,
          comments: [String.t()]
        }
  defstruct to: nil, user_id_from: 0, amount: nil, request_type: nil, add_fee: false, comments: []

  oneof :to, 0

  field :user_id_from, 1, type: :uint64
  field :amount, 2, type: Basic.UMoney
  field :request_type, 3, type: Basic.RequestType, enum: true
  field :add_fee, 4, type: :bool
  field :comments, 5, repeated: true, type: :string
  field :user_id_to, 6, type: :uint64, oneof: 0
  field :merchant_id_to, 7, type: :string, oneof: 0
  field :invoice_to, 8, type: Google.Protobuf.StringValue, oneof: 0
end

defmodule Basic.UMoney do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          amount: non_neg_integer,
          currency_code: Basic.CurrencyCode.t() | nil
        }
  defstruct amount: 0, currency_code: nil

  field :amount, 1, type: :uint64
  field :currency_code, 2, type: Basic.CurrencyCodeValue
end

defmodule Basic.CurrencyCodeValue do
  @moduledoc false
  use Protobuf, syntax: :proto3, wrapper?: true

  @type t :: %__MODULE__{
          value: Basic.CurrencyCode.t()
        }
  defstruct value: nil

  field :value, 1, type: Basic.CurrencyCode, enum: true
end
