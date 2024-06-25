defmodule Weather.Mocks.DateTimeMock do
  def utc_now() do
    DateTime.new!(~D[2024-06-08], ~T[00:26:08.003])
  end
end
