defmodule Weather.CLI do
  @moduledoc """
  A command-line interface for fetching weather data via the
  OpenWeatherMap API. This module is intended to be invoked as an escript.
  """

  @type args() :: [String.t()]

  @switches [
    help: :boolean,
    colors: :boolean,
    every: :integer,
    hours: :integer,
    latitude: :float,
    longitude: :float,
    api_key: :string,
    units: :string,
    twelve: :boolean
  ]

  @aliases [
    h: :help,
    c: :colors,
    e: :every,
    r: :hours,
    t: :latitude,
    n: :longitude,
    a: :api_key,
    u: :units,
    w: :twelve
  ]

  @descriptions %{
    help: "Prints this help message",
    colors: "Enables colorized output for the hourly report. Defaults to true",
    every:
      "Sets the hour interval at which data is reported for the hourly report. Defaults to 3",
    hours:
      "Sets the number of hours to report on for the hourly report. Defaults to 12. Max is 48",
    latitude: "The latitude of the location for which to fetch weather data",
    longitude: "The longitude of the location for which to fetch weather data",
    api_key: "The OpenWeatherMap API key",
    twelve:
      "Enables 12-hour time format for the hourly report. Defaults to true. When false, 24-hour time format is used",
    units:
      "The units in which to return the weather data. Options: 'metric' (celsius), 'celsius', 'imperial' (fahrenheit), 'fahrenheit', 'standard' (kelvin), 'kelvin'"
  }

  @doc """
  The main module function invoked by the escript.
  """

  @spec main(args()) :: term()
  def main(args) do
    args
    |> parse_args()
    |> handle_request()
    |> print_response()
  end

  defp parse_args(args) do
    args
    |> OptionParser.parse(strict: @switches, aliases: @aliases)
    |> handle_parsed()
  end

  defp handle_parsed({parsed, _remaining, _invalid = []}), do: {:ok, Enum.into(parsed, %{})}

  defp handle_parsed({_parsed, _remaining, invalid}),
    do: {:error, Enum.map_join(invalid, "\n", &invalid_message/1)}

  defp invalid_message({k, nil}), do: "unknown option #{k}"

  defp invalid_message({k, v}), do: "#{v} is an invalid value for #{k}"

  defp handle_request({:error, reason}), do: {:error, reason}

  defp handle_request({:ok, %{help: true}}) do
    {
      :ok,
      """
      Usage: weather [options]

      Options:
      #{Enum.map_join(@switches, "\n", &format_switch/1)}

      * Note that boolean switches take no values. --<switch> sets the value to true and --no-<switch> sets the value to false.

      Aliases:
      #{Enum.map_join(@aliases, "\n", &format_alias/1)}
      """
    }
  end

  defp handle_request({:ok, parsed_args}) do
    parsed_args
    |> Weather.Opts.new()
    |> Weather.get()
  end

  defp print_response({_, response}), do: IO.puts(response)

  defp format_switch({k, v}), do: "--#{atom_to_switch(k)}: #{@descriptions[k]}. (#{v})"

  defp format_alias({k, v}), do: "-#{k}: --#{atom_to_switch(v)}"

  defp atom_to_switch(atom) when is_atom(atom) do
    atom
    |> Atom.to_string()
    |> String.replace("_", "-")
  end
end
