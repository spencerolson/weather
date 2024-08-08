defmodule Weather.Colors do
  @moduledoc """
  Provides ANSI color codes for use in the Weather module.
  """

  @doc """
  Formats and colorizes a given temperature.
  """
  @spec colorize(number) :: String.t()
  def colorize(temp) do
    temp
    |> color_code()
    |> IO.ANSI.color()
    |> then(&IO.ANSI.format([&1, "#{temp}°", IO.ANSI.reset()]))
    |> List.to_string()
  end

  @doc """
  Prints colorized text with associated color codes.
  """
  @spec list() :: :ok
  def list do
    Enum.each(0..255, &print_color/1)
    :ok
  end

  @doc """
  Prints the current color configuration.
  """
  @spec list_current() :: :ok
  def list_current do
    Enum.each(
      [-10, 0, 33, 40, 50, 60, 70, 80, 90, 100],
      fn temp ->
        temp
        |> colorize()
        |> IO.puts()
      end
    )
  end

  @doc """
  Removes ANSI characters from a given string.
  """
  @spec remove_ansi(String.t()) :: String.t()
  def remove_ansi(str) do
    ansi_characters = ~r"\x1B\[[0-?]*[ -/]*[@-~]"
    Regex.replace(ansi_characters, str, "")
  end

  defp color_code(temp) when temp < 0, do: 245
  defp color_code(temp) when temp in 0..32, do: 15
  defp color_code(temp) when temp in 33..39, do: 51
  defp color_code(temp) when temp in 40..49, do: 39
  defp color_code(temp) when temp in 50..59, do: 148
  defp color_code(temp) when temp in 60..69, do: 226
  defp color_code(temp) when temp in 70..79, do: 214
  defp color_code(temp) when temp in 80..89, do: 202
  defp color_code(temp) when temp in 90..99, do: 9
  defp color_code(temp) when temp >= 100, do: 88

  defp print_color(n) do
    [IO.ANSI.color(n), "IO.ANSI.color(#{n})"]
    |> IO.ANSI.format()
    |> IO.puts()
  end
end
