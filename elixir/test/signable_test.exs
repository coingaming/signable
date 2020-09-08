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
  end
end
