defmodule Signable do
  alias Signable.SerializerError

  @spec serialize(message :: struct()) :: binary()
  def serialize(message) do
    %Protobuf.MessageProps{field_props: props, oneof: oneof_list} =
      message.__struct__.__message_props__()

    ## oneof_list is a keyword name_atom -> index, but we need a reverse to lookup
    oneof_map =
      oneof_list
      |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, v, k) end)

    props
    |> Enum.sort(fn {index1, _}, {index2, _} -> index1 <= index2 end)
    |> Enum.reduce(<<>>, &(&2 <> prop_handler(&1, message, oneof_map)))
  end

  @spec prop_handler(
          {index :: non_neg_integer(), prop :: Protobuf.FieldProps.t()},
          message :: struct(),
          oneof_map :: %{atom() => non_neg_integer()}
        ) :: binary()
  defp prop_handler({index, prop}, message, oneof_map) do
    %Protobuf.FieldProps{
      oneof: oneof_index,
      name_atom: name_atom
    } = prop

    prop_val = Map.get(message, name_atom)

    cond do
      not is_nil(oneof_index) ->
        oneof_key = Map.fetch!(oneof_map, oneof_index)
        {key, oneof_val} = Map.fetch!(message, oneof_key)

        if key == name_atom do
          serialize_index(index) <> serialize_one(prop, oneof_val)
        else
          <<>>
        end

      is_nil(prop_val) or prop_val == [] ->
        <<>>

      true ->
        serialize_index(index) <> serialize_one(prop, prop_val)
    end
  end

  @spec serialize_one(prop :: Protobuf.FieldProps.t(), message :: any()) :: binary()
  defp serialize_one(prop, message) when is_list(message) do
    Enum.reduce(message, <<>>, &(&2 <> serialize_one(prop, &1)))
  end

  defp serialize_one(prop, message) do
    %Protobuf.FieldProps{
      type: type,
      embedded?: embedded?,
      enum?: enum?
    } = prop

    cond do
      enum? ->
        {:enum, enum_type} = type
        serialize_enum(enum_type, message)

      embedded? ->
        serialize(message)

      true ->
        serialize_scalar(type, message)
    end
  end

  @spec serialize_index(index :: non_neg_integer()) :: binary()
  defp serialize_index(index) do
    serialize_scalar(:uint32, index)
  end

  @spec serialize_enum(enum :: atom(), value :: atom()) :: binary()
  defp serialize_enum(enum, value) do
    index = enum.mapping() |> Map.get(value)
    serialize_scalar(:uint32, index)
  end

  @spec serialize_scalar(type :: atom(), value :: integer() | String.t() | boolean()) :: binary()
  defp serialize_scalar(type, value) when type == :uint32 or type == :int32 do
    <<value::32>>
  end

  defp serialize_scalar(type, value) when type == :uint64 or type == :int64 do
    <<value::64>>
  end

  defp serialize_scalar(type, value) when type == :string or type == :bytes do
    value
  end

  defp serialize_scalar(:bool, value) do
    if value do
      <<1::8>>
    else
      <<0::8>>
    end
  end

  defp serialize_scalar(type, value) do
    raise SerializerError, message: "unsupported type #{inspect(type)}", type: type, value: value
  end
end

defmodule Signable.SerializerError do
  defexception([:type, :value, :message])
end
