defmodule WeatherTest do
  use ExUnit.Case
  doctest Weather

  test "greets the world" do
    assert Weather.hello() == :world
  end
end
