defmodule Mix.Tasks.RegenTestcases do
  use Mix.Task

  @impl Mix.Task
  def run([tc_file]) do
    test_config = File.read!(tc_file) |> Poison.decode!()

    curve = Map.get(test_config, "curve") |> String.to_atom()

    private_key =
      test_config
      |> Map.get("private_key_pem")
      |> :public_key.pem_decode()
      |> hd()
      |> :public_key.pem_entry_decode()
      |> elem(2)

    new_testcases = Enum.map(test_config["testcases"], fn tc ->
      proto_mod = String.to_atom("Elixir." <> tc["proto_message_type"])
      proto_message = tc["proto_serialized_b64"] |> Base.decode64!() |> proto_mod.decode()

      signable_serialized = Signable.serialize(proto_message)
      signature = Signable.sign(signable_serialized, private_key, curve)

      tc |> Map.put("signable_serialized_b64", Base.encode64(signable_serialized)) |> Map.put("signable_signature_b64", Base.encode64(signature))
    end)

    File.write!(tc_file, Poison.encode!(Map.put(test_config, "testcases", new_testcases), pretty: true))
  end
end
