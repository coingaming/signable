defmodule SignablePropTest do
  use ExUnit.Case, async: true
  use PropCheck

  def payload_gen() do
    let [umoney, user_id, request_type, add_fee, comments, to] <- [
          umoney_gen(),
          user_id_gen(),
          request_type_gen(),
          bool(),
          comments_gen(),
          to_gen()
        ] do
      %Basic.Payload{
        amount: umoney,
        user_id_from: user_id,
        request_type: request_type,
        add_fee: add_fee,
        comments: comments,
        to: to
      }
    end
  end

  def to_gen() do
    oneof([to_user_id_gen(), to_merchant_id_gen(), to_invoice_gen()])
  end

  def to_user_id_gen() do
    let user_id <- user_id_gen() do
      {:user_id_to, user_id}
    end
  end

  def to_merchant_id_gen() do
    let merchant_id <- utf8(32) do
      {:merchant_id_to, merchant_id}
    end
  end

  def to_invoice_gen() do
    let invoice <- utf8(256) do
      {:invoice_to, invoice}
    end
  end

  def comments_gen() do
    elements([nil, [], [utf8(100)], [utf8(100), utf8(100), utf8(100)]])
  end

  def user_id_gen() do
    choose(1, 100_000_000_000)
  end

  def umoney_gen() do
    gen =
      let [amount, currency_code] <- [amount_gen(), currency_code_gen()] do
        %Basic.UMoney{
          amount: amount,
          currency_code: %Basic.CurrencyCodeValue{value: currency_code}
        }
      end

    elements([gen, nil])
  end

  def amount_gen() do
    choose(1, 100_000_000_000)
  end

  def currency_code_gen() do
    elements([:EUR, :USD, :BTC, :ETH])
  end

  def request_type_gen() do
    elements([:USER, :LEDGER])
  end

  property "Basic.Payload serialization" do
    forall payload <- payload_gen() do
      try do
        res = Signable.serialize(Basic.Payload, payload)

        is_binary(res)
        |> when_fail(
          IO.puts("""
          Result: #{inspect(res, pretty: true)}
          """)
        )
      rescue
        e in _ ->
          IO.puts("GOT ERROR: #{inspect(e)}")
          IO.puts(Exception.format_stacktrace())
          false
      end
    end
  end
end
