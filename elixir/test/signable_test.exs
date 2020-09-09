defmodule Signable.SignableTest do
  use ExUnit.Case, async: true

  doctest Signable

  setup_all do
    {pk, sk} = :crypto.generate_key(:ecdh, :secp256r1)
    {:ok, %{pk: pk, sk: sk, crv: :secp256r1}}
  end

  describe "sign/3" do
    test "success", %{sk: sk, crv: crv} do
      signature = Signable.sign("payload", sk, crv)
      assert is_binary(signature)
    end
  end

  describe "verify_signature/4" do
    test "valid signature", %{pk: pk, sk: sk, crv: crv} do
      signature = Signable.sign("payload", sk, crv)
      assert Signable.verify_signature("payload", signature, pk, crv)
    end

    test "invalid signature", %{pk: pk, sk: sk, crv: crv} do
      Signable.sign("payload", sk, crv)
      assert Signable.verify_signature("payload", "bad signature", pk, crv) == false
    end

    test "bad payload", %{pk: pk, sk: sk, crv: crv} do
      signature = Signable.sign("payload", sk, crv)
      assert Signable.verify_signature("bad payload", signature, pk, crv) == false
    end
  end

  describe "serialize/2" do
    setup do
      tc_filepath = System.get_env("SIGNABLE_TC_FILEPATH", "../testcases.json")
      test_config = File.read!(tc_filepath) |> Poison.decode!()

      public_key =
        test_config
        |> Map.get("public_key_pem")
        |> :public_key.pem_decode()
        |> hd()
        |> :public_key.pem_entry_decode()
        |> elem(0)
        |> elem(1)

      curve = Map.get(test_config, "curve") |> String.to_atom()
      {:ok, testcases: Map.get(test_config, "testcases"), public_key: public_key, curve: curve}
    end

    test "main tests", %{testcases: testcases, public_key: public_key, curve: curve} do
      success? =
        Enum.reduce(testcases, true, fn tc, success? ->
          proto_mod = String.to_atom("Elixir." <> tc["proto_message_type"])
          proto_message = tc["proto_serialized_b64"] |> Base.decode64!() |> proto_mod.decode()

          {actual_result, serialize_success?} =
            test_serialization(
              proto_message,
              tc["signable_serialized_b64"],
              tc["test_description"]
            )

          if serialize_success? do
            test_signature(
              public_key,
              curve,
              actual_result,
              tc["signable_signature_b64"],
              tc["test_description"]
            ) and success?
          else
            serialize_success?
          end
        end)

      assert(success?, "Some tests have failed")
    end
  end

  defp test_serialization(proto_message, expected_result, test_description) do
    actual_result = Signable.serialize(proto_message)

    if actual_result |> Base.encode64() != expected_result do
      IO.puts(
        "Test #{test_description} serialization failed: expected #{expected_result}, got #{
          actual_result
        }"
      )

      IO.puts("Failed message: #{inspect(proto_message)}")
      {actual_result, false}
    else
      {actual_result, true}
    end
  end

  defp test_signature(public_key, curve, payload, expected_signature, test_description) do
    if Signable.verify_signature(
         payload,
         expected_signature |> Base.decode64!(),
         public_key,
         curve
       ) do
      true
    else
      IO.puts("Test #{test_description} signature verification failed")

      false
    end
  end
end
