defmodule SignableTest do
  use ExUnit.Case
  doctest Signable

  test "greets the world" do
    assert Signable.hello() == :world
  end
end
