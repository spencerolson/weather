defmodule Weather.Colors do
  @moduledoc """
  Provides ANSI color codes for use in the Weather module.
  """

  @doc """
  Prints colorized text with associated color codes.
  """
  @spec list() :: :ok
  def list do
    Enum.each(0..255, &print_color/1)
    :ok
  end

  defp print_color(n) do
    [IO.ANSI.color(n), "IO.ANSI.color(#{n})"]
    |> IO.ANSI.format()
    |> IO.puts()
  end
end
