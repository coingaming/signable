defmodule Mix.Tasks.GenTestcases do
  use Mix.Task
  require Number.Payload

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

    generators =
      [
        Number.Payload
      ]
      |> Enum.map(fn proto_mod ->
        quote do
          gen all(
                name <- binary(),
                email <- email_generator
              ) do
            %User{name: name, email: email}
          end
        end

        %Protobuf.MessageProps{field_props: props, oneof: oneof_list} =
          proto_mod.__message_props__()

        oneof_map =
          oneof_list
          |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, v, k) end)

        proto_struct = proto_mod.new()

        prop_names =
          proto_struct
          |> Map.from_struct()
          |> Map.keys()

        gen_binds =
          prop_names
          |> Enum.map(fn prop_name ->
            %Protobuf.FieldProps{type: type} =
              props
              |> Map.values()
              |> Enum.find(fn %Protobuf.FieldProps{name_atom: name_atom} ->
                prop_name == name_atom
              end)

            prop_gen_ast =
              case type do
                :int32 ->
                  quote do
                    StreamData.integer()
                    |> StreamData.filter(&(&1 > -2_147_483_648 and &1 < 2_147_483_648))
                  end

                :int64 ->
                  quote do
                    StreamData.integer(-9_223_372_036_854_775_808..9_223_372_036_854_775_808)
                  end

                :uint32 ->
                  quote do
                    StreamData.integer(0..4_294_967_295)
                  end

                :uint64 ->
                  quote do
                    StreamData.integer(0..18_446_744_073_709_551_615)
                  end
              end

            {:<-, [],
             [
               {prop_name, [], Elixir},
               prop_gen_ast
             ]}
          end)

        gen_struct =
          prop_names
          |> Enum.map(fn prop_name ->
            {prop_name, {prop_name, [], Elixir}}
          end)

        xs =
          proto_mod
          |> Module.split()
          |> Enum.map(&String.to_atom/1)

        {:gen, [context: Elixir, import: ExUnitProperties],
         [
           {:all, [], gen_binds},
           [
             do:
               {:%, [],
                [
                  {:__aliases__, [alias: false], xs},
                  {:%{}, [], gen_struct}
                ]}
           ]
         ]}
        |> Code.eval_quoted()
        |> elem(0)

        # quote do
        #  ExUnitProperties.gen all name <- StreamData.string(:alphanumeric),
        #                           domain <- StreamData.member_of(domains) do
        #    name <> "@" <> domain
        #  end
        # end
      end)

    Enum.each(generators, fn x ->
      Enum.take(x, 100)
      |> IO.inspect()
    end)

    # new_testcases = Enum.flat_map(0..1000, fn ->
    #  Enum.map(test_config["testcases"], fn tc ->
    #    proto_mod = String.to_atom("Elixir." <> tc["proto_message_type"])

    #    proto_message = gen_proto_message(proto_mod)

    #    signable_serialized = Signable.serialize(proto_message)
    #    signature = Signable.sign(signable_serialized, private_key, curve)

    #    tc
    #      |> Map.put("signable_serialized_b64", Base.encode64(signable_serialized))
    #      |> Map.put("signable_signature_b64", Base.encode64(signature))
    #  end)
    # end)

    # File.write!(tc_file, Poison.encode!(Map.put(test_config, "testcases", new_testcases), pretty: true))
  end

  defp gen_proto_message(proto_mod) do
    %Protobuf.MessageProps{field_props: props, oneof: oneof_list} = proto_mod.__message_props__()

    oneof_map =
      oneof_list
      |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, v, k) end)

    proto_struct = proto_mod.new()

    proto_struct
    |> Map.from_struct()
    |> Map.keys()
    |> Enum.reduce(proto_struct, fn prop_name, proto_struct ->
      prop =
        props
        |> Map.values()
        |> Enum.find(fn %Protobuf.FieldProps{name_atom: name_atom} ->
          prop_name == name_atom
        end)

      prop_val =
        if is_nil(prop) do
          gen_prop_val(prop_name, props, oneof_map)
        else
          gen_prop_val(prop)
        end

      Map.put(proto_struct, prop_name, prop_val)
    end)
  end

  defp gen_prop_val(_, _, _) do
  end

  defp gen_prop_val(%Protobuf.FieldProps{embedded?: true, type: type}) do
    gen_proto_message(type)
  end

  defp gen_prop_val(%Protobuf.FieldProps{enum?: true, type: {:enum, type}}) do
  end

  defp gen_prop_val(%Protobuf.FieldProps{repeated?: true, type: type}) do
    gen_val(type)
  end

  defp gen_prop_val(%Protobuf.FieldProps{type: type}) do
    gen_val(type)
  end

  def gen_val(type) do
    case type do
      :int32 -> StreamData.integer()
      :int64 -> StreamData.integer()
      :uint32 -> StreamData.integer(0..100)
      :uint64 -> StreamData.integer(0..100)
      :string -> "string generator"
      :bool -> "bool generator"
      :bytes -> "bytes generator"
    end
  end
end
