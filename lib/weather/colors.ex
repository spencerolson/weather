defmodule Weather.Colors do
  @moduledoc """
  Provides ANSI color codes for use in the Weather module.
  """
  @type category() ::
          :arctic
          | :freezing
          | :cold
          | :chilly
          | :cool
          | :mild
          | :warm
          | :hot
          | :very_hot
          | :scorching

  @type codes() :: %{category() => integer()}

  @doc """
  Colorizes a string according to a color code.
  """
  @spec colorize(String.t(), integer()) :: String.t()
  def colorize(string, code) when is_integer(code) do
    code
    |> IO.ANSI.color()
    |> then(&IO.ANSI.format([&1, string, IO.ANSI.reset()]))
    |> List.to_string()
  end

  @doc """
  Formats and colorizes a temperature.
  """
  @spec colorize_temp(integer(), Weather.Opts.t()) :: String.t()
  def colorize_temp(temp, %Weather.Opts{} = opts \\ Weather.Opts.new!()) when is_integer(temp) do
    temp
    |> to_fahrenheit(opts)
    |> round()
    |> color_code(opts)
    |> then(&colorize("#{temp}°", &1))
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
  @spec list_current(Weather.Opts.t()) :: :ok
  def list_current(%Weather.Opts{} = opts \\ Weather.Opts.new!()) do
    IO.puts("Current Color Configuration (temps in fahrenheit)\n")

    Enum.each(
      [-10, 0, 33, 40, 50, 60, 70, 80, 90, 100],
      fn temp ->
        temp
        |> colorize_temp(opts)
        |> IO.puts()
      end
    )

    :ok
  end

  @doc """
  Returns the default ANSI color codes associated with temperature categories.
  """
  @spec default_color_codes() :: codes()
  def default_color_codes, do: struct(Weather.Opts).color_codes

  @doc """
  Removes ANSI characters from a given string.
  """
  @spec remove_ansi(String.t()) :: String.t()
  def remove_ansi(str) do
    ansi_characters = ~r"\x1B\[[0-?]*[ -/]*[@-~]"
    Regex.replace(ansi_characters, str, "")
  end

  defp color_code(temp, opts) do
    category = categorize(temp)
    Map.fetch!(opts.color_codes, category)
  end

  defp categorize(temp) when temp < 0, do: :arctic
  defp categorize(temp) when temp in 0..32, do: :freezing
  defp categorize(temp) when temp in 33..39, do: :cold
  defp categorize(temp) when temp in 40..49, do: :chilly
  defp categorize(temp) when temp in 50..59, do: :cool
  defp categorize(temp) when temp in 60..69, do: :mild
  defp categorize(temp) when temp in 70..79, do: :warm
  defp categorize(temp) when temp in 80..89, do: :hot
  defp categorize(temp) when temp in 90..99, do: :very_hot
  defp categorize(temp) when temp >= 100, do: :scorching

  defp print_color(n) do
    [IO.ANSI.color(n), "IO.ANSI.color(#{n})"]
    |> IO.ANSI.format()
    |> IO.puts()
  end

  defp to_fahrenheit(fahrenheit, %Weather.Opts{units: "imperial"}), do: fahrenheit
  defp to_fahrenheit(celsius, %Weather.Opts{units: "metric"}), do: celsius * 9 / 5 + 32
  defp to_fahrenheit(kelvin, %Weather.Opts{units: "standard"}), do: kelvin * 9 / 5 - 459.67
end
