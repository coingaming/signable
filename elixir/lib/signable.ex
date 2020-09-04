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
    |> Enum.reduce(<<>>, fn {index, prop}, acc ->
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
            merge(acc <> serialize_index(index), serialize_one(prop, oneof_val))
          else
            acc
          end

        is_nil(prop_val) or prop_val == [] ->
          acc

        true ->
          merge(acc <> serialize_index(index), serialize_one(prop, prop_val))
      end
    end)
  end

  defp serialize_one(prop, message) when is_list(message) do
    Enum.reduce(message, <<>>, &merge(&2, serialize_one(prop, &1)))
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

  defp merge(acc, val) do
    if is_nil(val) do
      acc
    else
      acc <> val
    end
  end

  def serialize_index(index) do
    serialize_scalar(:uint32, index)
  end

  def serialize_enum(enum, value) do
    index = enum.mapping() |> Map.get(value)
    serialize_scalar(:uint32, index)
  end

  def serialize_scalar(type, value) when type == :uint32 or type == :int32 do
    <<value::32>>
  end

  def serialize_scalar(type, value) when type == :uint64 or type == :int64 do
    <<value::64>>
  end

  def serialize_scalar(type, value) when type == :string or type == :bytes do
    value
  end

  def serialize_scalar(:bool, value) do
    if value do
      <<1::8>>
    else
      <<0::8>>
    end
  end

  def serialize_scalar(type, value) do
    raise SerializerError, message: "unsupported type #{inspect(type)}", type: type, value: value
  end
end

defmodule Signable.SerializerError do
  defexception([:type, :value, :message])
end
