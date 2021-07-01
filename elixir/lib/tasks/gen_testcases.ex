defmodule Mix.Tasks.GenTestcases do
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

    generators =
      [
        Number.Payload,
        Text.Payload,
        Basic.Payload
      ]
      |> Enum.map(&gen_generator/1)
      |> Enum.map(fn generator_ast ->
        generator_ast
        |> Code.eval_quoted()
        |> elem(0)
      end)
  end

  def gen_generator(proto_mod) do
    %Protobuf.MessageProps{field_props: props, oneof: oneof_list} = proto_mod.__message_props__()

    oneof_map = oneof_list |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, v) end)

    proto_struct = proto_mod.new()

    prop_names =
      proto_struct
      |> Map.from_struct()
      |> Map.keys()

    gen_binds =
      prop_names
      |> Enum.map(fn prop_name ->
        field_prop =
          props
          |> Map.values()
          |> prop_by_name(prop_name)

        prop_gen_ast =
          if is_nil(field_prop) do
            oneof_index = oneof_map[prop_name]

            props
            |> Map.values()
            |> Enum.filter(fn %Protobuf.FieldProps{oneof: oneof} -> oneof == oneof_index end)
            |> gen_prop_ast()
          else
            %Protobuf.FieldProps{type: type, repeated?: repeated} = field_prop

            if repeated do
              quote do
                StreamData.list_of(unquote(gen_prop_ast(type)))
              end
            else
              quote do
                StreamData.one_of([unquote(gen_prop_ast(type)), StreamData.constant(nil)])
              end
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

    proto_mod_alias =
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
              {:__aliases__, [alias: false], proto_mod_alias},
              {:%{}, [], gen_struct}
            ]}
       ]
     ]}
  end

  def gen_prop_ast(oneof_props) when is_list(oneof_props) do
    prop_atoms =
      oneof_props
      |> props_to_atoms()

    oneof_prop_generators =
      quote do
        unquote(prop_atoms)
        |> Enum.map(&StreamData.constant/1)
      end

    quote do
      StreamData.bind(StreamData.one_of(unquote(oneof_prop_generators)), fn prop_name ->
        %Protobuf.FieldProps{type: type} = unquote(__MODULE__).prop_by_name(unquote(oneof_props |> Macro.escape()), prop_name)

        stream_data = unquote(__MODULE__).gen_prop_ast(type)
          |> Code.eval_quoted()
          |> elem(0)

        StreamData.one_of([stream_data, StreamData.constant(nil)])
        |> StreamData.bind(fn val ->
          StreamData.constant({prop_name, val})
        end)
      end)
    end
  end

  def gen_prop_ast(prop_type) do
    case prop_type do
      :int32 ->
        quote do
          StreamData.integer()
          |> StreamData.filter(&(&1 > -2_147_483_648 and &1 < 2_147_483_648))
        end

      :int64 ->
        quote do
          StreamData.integer()
          |> StreamData.filter(
            &(&1 > -9_223_372_036_854_775_808 and &1 < 9_223_372_036_854_775_808)
          )
        end

      :uint32 ->
        quote do
          StreamData.integer()
          |> StreamData.filter(&(&1 > 0 and &1 < 4_294_967_295))
        end

      :uint64 ->
        quote do
          StreamData.integer()
          |> StreamData.filter(&(&1 > 0 and &1 < 18_446_744_073_709_551_615))
        end

      :string ->
        quote do
          StreamData.string(:alphanumeric)
        end

      :bool ->
        quote do
          StreamData.boolean()
        end

      :bytes ->
        quote do
          StreamData.byte()
        end

      nil ->
        quote do
          StreamData.constant(nil)
        end

      {:enum, enum_type} ->
        %Protobuf.MessageProps{field_props: enum_props} = enum_type.__message_props__()

        prop_atoms =
          enum_props
          |> Map.values()
          |> props_to_atoms()

        quote do
          unquote(prop_atoms)
          |> Enum.map(&StreamData.constant/1)
          |> Enum.concat([StreamData.positive_integer(), StreamData.constant(nil)])
          |> StreamData.one_of()
        end

      _proto_mod ->
        gen_generator(prop_type)
    end
  end

  defp props_to_atoms(props) do
    Enum.map(props, fn %Protobuf.FieldProps{name_atom: name_atom} ->
      name_atom
    end)
  end

  def prop_by_name(props, name) do
    Enum.find(props, fn %Protobuf.FieldProps{name_atom: name_atom} ->
      name == name_atom
    end)
  end
end
