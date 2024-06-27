defmodule Weather.Mocks.DateTimeMock do
  @moduledoc """
  A mock module for DateTime that allows us to control the current time in tests.
  """
  def utc_now() do
    DateTime.new!(~D[2024-06-08], ~T[00:26:08.003])
  end
end
