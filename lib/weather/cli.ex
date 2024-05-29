defmodule Weather.CLI do
  @moduledoc """
  Documentation for `Weather.CLI`.
  """

  @doc """
  Hello world.
  """
  def main(args) do
    IO.puts(
      "hello, world! args are #{inspect(args)}, config is: #{inspect(Application.get_all_env(:weather))}"
    )
  end
end
