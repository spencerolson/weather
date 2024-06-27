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

  @descriptions %{
    help: "Prints this help message",
    latitude: "The latitude of the location for which to fetch weather data",
    longitude: "The longitude of the location for which to fetch weather data",
    api_key: "The OpenWeatherMap API key",
    units:
      "The units in which to return the weather data. Options: 'metric' (celsius), 'imperial' (fahrenheit), 'standard' (kelvin)"
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
    |> elem(0)
    |> Enum.into(%{})
  end

  defp handle_request(%{help: true}) do
    {
      :ok,
      """
      Usage: weather [options]

      Options:
      #{Enum.map_join(@switches, "\n", &format_switch/1)}

      Aliases:
      #{Enum.map_join(@aliases, "\n", &format_alias/1)}
      """
    }
  end

  defp handle_request(parsed_args) do
    parsed_args
    |> Weather.Opts.new()
    |> Weather.get()
  end

  defp print_response({_, response}), do: IO.puts(response)
  defp format_switch({k, v}), do: "--#{k}: #{@descriptions[k]}. (#{v})"
  defp format_alias({k, v}), do: "-#{k}: --#{v}"
end
