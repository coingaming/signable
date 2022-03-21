defimpl Protobuf.Encodable, for: Any do
  def encode(value, _type), do: value
end
