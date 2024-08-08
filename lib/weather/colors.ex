defmodule Weather.Colors do
  @moduledoc """
  Provides ANSI color codes for use in the Weather module.
  """

  @doc """
  Formats and colorizes a given temperature.
  """
  @spec colorize(number, Weather.Opts.t()) :: String.t()
  def colorize(temp, opts) do
    temp
    |> to_fahrenheit(opts)
    |> round()
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
    IO.puts("Current Color Configuration (temps in fahrenheit)\n")
    opts = Weather.Opts.new(api_key: "123", latitude: 123.0, longitude: 234.0)

    Enum.each(
      [-10, 0, 33, 40, 50, 60, 70, 80, 90, 100],
      fn temp ->
        temp
        |> colorize(opts)
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

  defp to_fahrenheit(fahrenheit, %Weather.Opts{units: "imperial"}), do: fahrenheit
  defp to_fahrenheit(celsius, %Weather.Opts{units: "metric"}), do: celsius * 9 / 5 + 32
  defp to_fahrenheit(kelvin, %Weather.Opts{units: "standard"}), do: kelvin * 9 / 5 - 459.67
end
