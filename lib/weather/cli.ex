defmodule Weather.CLI do
  @moduledoc """
  A command-line interface for fetching weather data via the
  OpenWeatherMap API. This module is intended to be invoked as an escript.
  """

  @type args() :: [String.t()]

  @switches [
    help: :boolean,
    latitude: :float,
    longitude: :float,
    api_key: :string,
    units: :string
  ]

  @aliases [h: :help, t: :latitude, n: :longitude, a: :api_key, u: :units]

  @descriptions [
    help: "Prints this help message",
    latitude: "The latitude of the location for which to fetch weather data",
    longitude: "The longitude of the location for which to fetch weather data",
    api_key: "The OpenWeatherMap API key",
    units:
      "The units in which to return the weather data. Options: 'metric' (celsius), 'imperial' (fahrenheit), 'standard' (kelvin)"
  ]

  @doc """
  The main module function invoked by the escript.
  """

  @spec main(args()) :: term()
  def main(args) do
    {options, _args, _invalid} = parsed_options(args)

    if options[:help] do
      display_help()
    else
      options
      |> Weather.Opts.new()
      |> Weather.get()
      |> elem(1)
      |> IO.puts()
    end

    :ok
  end

  defp parsed_options(args), do: OptionParser.parse(args, strict: @switches, aliases: @aliases)

  defp display_help do
    IO.puts("""
    Usage: weather [options]

    Options:
    #{report(@switches, &format_switch/1)}

    Aliases:
    #{report(@aliases, &format_alias/1)}
    """)
  end

  defp report(options, formatter) do
    options
    |> Enum.map(formatter)
    |> Enum.join("\n")
  end

  defp format_switch({k, v}), do: "--#{k}: #{@descriptions[k]}. (#{v})"
  defp format_alias({k, v}), do: "-#{k}: --#{v}"
end
