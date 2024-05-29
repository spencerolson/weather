defmodule Weather.CLI do
  alias Weather.ENV

  @moduledoc """
  Documentation for `Weather.CLI`.
  """

  @doc """
  Hello world.
  """
  def main(_args) do
    Req.default_options(ENV.get(:finch_config))
    data = Weather.API.fetch_weather()
    IO.puts(inspect(data))
  end
end
