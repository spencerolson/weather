defmodule Weather.CLI do
  @moduledoc """
  Provides a command-line interface for fetching weather data via the
  OpenWeatherMap API. This module is intended to be invoked as an escript.
  """

  @type args() :: [String.t()]

  @switches [
    help: :boolean,
    hide_alerts: :boolean,
    feels_like: :boolean,
    alert_titles_only: :boolean,
    colors: :boolean,
    color_codes: :string,
    every: :integer,
    hours: :integer,
    label: :string,
    latitude: :float,
    longitude: :float,
    api_key: :string,
    units: :string,
    test: :string,
    twelve: :boolean,
    zip: :string
  ]

  @aliases [
    h: :help,
    f: :feels_like,
    l: :hide_alerts,
    o: :alert_titles_only,
    c: :colors,
    d: :color_codes,
    e: :every,
    r: :hours,
    b: :label,
    t: :latitude,
    n: :longitude,
    a: :api_key,
    u: :units,
    s: :test,
    w: :twelve,
    z: :zip
  ]

  @descriptions %{
    help: "Prints this help message",
    hide_alerts:
      "Hides weather alerts, even when alerts are available. Default is false, which shows alerts if there are any available",
    alert_titles_only:
      "Shows only the titles of weather alerts. Default is false, which shows titles along with full alert descriptions",
    colors: "Enables colorized output for the hourly report. Defaults to true",
    color_codes:
      "A comma-separated list of up to 10 color codes to use for colorized output. Values must be integers in the range of 0 to 255 inclusive, or '_' to use the default. Defaults to 202,214,226,148,39,51,15,245,88,9. Values correspond with the following categories: arctic, freezing, cold, chilly, cool, mild, warm, hot, very_hot, scorching",
    every:
      "Sets the hour interval at which data is reported for the hourly report. Defaults to 3",
    hours:
      "Sets the number of hours to report on for the hourly report. Defaults to 12. Max is 48",
    feels_like:
      "Shows the 'feels like' temperature instead of the actual temperature. Defaults to false",
    latitude: "The latitude of the location for which to fetch weather data",
    longitude: "The longitude of the location for which to fetch weather data",
    label:
      "The name of the location for which weather data is being fetched. If present, the report will include the label in the output. If not provided but a zip code is provided, the label will be set to the name of the location associated with the zip code",
    api_key: "The OpenWeatherMap API key",
    test: "Fake weather data for testing purposes. Options: \"clear\", \"rain\", \"storm\"",
    twelve:
      "Enables 12-hour time format for the hourly report. Defaults to true. When false, 24-hour time format is used",
    units:
      "The units in which to return the weather data. Options: \"metric\" (celsius), \"celsius\", \"imperial\" (fahrenheit), \"fahrenheit\", \"standard\" (kelvin), \"kelvin\"",
    zip:
      "A zip code string to fetch weather data for. This can be used in place of latitude and longitude. For most accurate results format should be zip/post code and ISO 3166 country code divided by comma. See https://openweathermap.org/api/geocoding-api#direct_zip for more information"
  }

  @doc """
  The main module function invoked by the escript.
  """
  @spec main(args()) :: :ok
  def main(args \\ []) do
    args
    |> parse_args()
    |> handle_request()
    |> print_response()

    :ok
  end

  defp parse_args(args) do
    args
    |> OptionParser.parse(strict: @switches, aliases: @aliases)
    |> handle_parsed()
  end

  defp handle_parsed({parsed, _remaining, _invalid = []}), do: {:ok, parsed}

  defp handle_parsed({_parsed, _remaining, invalid}),
    do: {:error, Enum.map_join(invalid, "\n", &invalid_message/1)}

  defp invalid_message({k, nil}), do: "unknown option #{k}"

  defp invalid_message({k, v}), do: "#{v} is an invalid value for #{k}"

  defp handle_request({:error, reason}), do: {:error, reason}

  defp handle_request({:ok, parsed_args}) do
    if parsed_args[:help] do
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
    else
      parsed_args
      |> Weather.Opts.new()
      |> handle_opts()
    end
  end

  defp handle_opts({:ok, opts}), do: Weather.get(opts)
  defp handle_opts(result), do: result

  defp print_response({_, response}), do: IO.puts(response)

  defp format_switch({k, v}), do: "--#{atom_to_switch(k)}: #{@descriptions[k]}. (#{v})"

  defp format_alias({k, v}), do: "-#{k}: --#{atom_to_switch(v)}"

  defp atom_to_switch(atom) when is_atom(atom) do
    atom
    |> Atom.to_string()
    |> String.replace("_", "-")
  end
end
