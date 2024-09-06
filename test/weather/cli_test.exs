defmodule Weather.CLITest do
  @moduledoc nodoc: true
  use ExUnit.Case, async: true

  alias ExUnit.CaptureIO
  alias Weather.API
  alias Weather.CLI
  alias Weather.TestResponse.Clear

  doctest CLI

  describe "main/1" do
    setup do
      %{
        args: [
          "--no-colors",
          "--api-key",
          "123abc",
          "-t",
          "30.308689",
          "-n",
          "-84.248528"
        ]
      }
    end

    test "gets weather data", context do
      Req.Test.expect(API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      {result, output} = CaptureIO.with_io(fn -> CLI.main(context.args) end)

      assert result == :ok

      assert output ==
               """

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity

               """
    end

    test "has a --help option" do
      {result, output} = CaptureIO.with_io(fn -> CLI.main(["--help"]) end)

      assert result == :ok

      assert output ==
               """
               Usage: weather [options]

               Options:
               --help: Prints this help message. (boolean)
               --hide-alerts: Hides weather alerts, even when alerts are available. Default is false, which shows alerts if there are any available. (boolean)
               --feels-like: Shows the 'feels like' temperature instead of the actual temperature. Defaults to false. (boolean)
               --alert-titles-only: Shows only the titles of weather alerts. Default is false, which shows titles along with full alert descriptions. (boolean)
               --colors: Enables colorized output for the hourly report. Defaults to true. (boolean)
               --every: Sets the hour interval at which data is reported for the hourly report. Defaults to 3. (integer)
               --hours: Sets the number of hours to report on for the hourly report. Defaults to 12. Max is 48. (integer)
               --label: The name of the location for which weather data is being fetched. If present, the report will include the label in the output. If not provided but a zip code is provided, the label will be set to the name of the location associated with the zip code.. (string)
               --latitude: The latitude of the location for which to fetch weather data. (float)
               --longitude: The longitude of the location for which to fetch weather data. (float)
               --api-key: The OpenWeatherMap API key. (string)
               --units: The units in which to return the weather data. Options: "metric" (celsius), "celsius", "imperial" (fahrenheit), "fahrenheit", "standard" (kelvin), "kelvin". (string)
               --test: Fake weather data for testing purposes. Options: "clear", "rain", "storm". (string)
               --twelve: Enables 12-hour time format for the hourly report. Defaults to true. When false, 24-hour time format is used. (boolean)
               --zip: A zip code string to fetch weather data for. This can be used in place of latitude and longitude. (string)

               * Note that boolean switches take no values. --<switch> sets the value to true and --no-<switch> sets the value to false.

               Aliases:
               -h: --help
               -f: --feels-like
               -l: --hide-alerts
               -o: --alert-titles-only
               -c: --colors
               -e: --every
               -r: --hours
               -b: --label
               -t: --latitude
               -n: --longitude
               -a: --api-key
               -u: --units
               -s: --test
               -w: --twelve
               -z: --zip

               """
    end
  end
end
