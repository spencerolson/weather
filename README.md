# Weather

[![Build
Status](https://github.com/spencerolson/weather/actions/workflows/elixir.yml/badge.svg)](https://github.com/spencerolson/weather/actions/workflows/elixir.yml) [![Hex.pm](https://img.shields.io/hexpm/v/weather.svg)](https://hex.pm/packages/weather) [![Documentation](https://img.shields.io/badge/documentation-purple)](https://hexdocs.pm/weather)

An Elixir library for fetching data from the [OpenWeatherMap One Call API 3.0](https://openweathermap.org/api/one-call-3) service.

Use it as a dependency in your project:

```elixir
Mix.install([
  {:weather, "~> 0.2.8"}
])

opts = Weather.Opts.new(test: "rain")
Weather.API.fetch_weather(opts)
# =>
# {:ok,
#  %Req.Response{
#    status: 200,
#    headers: %{},
#    body: %{
#      "current" => %{...},
#      "daily" => %{...},
#      "hourly" => %{...},
#      "minutely" => %{...},
#      ...
#    }
#  }
# }

Weather.get!(opts) |> IO.puts

                    << 🌧️ 12:28PM - 1:27PM >>

 [                                                            ]
 [                                                            ]
 [                    ........................................]
 [............................................................]
 [............................................................]
 [............................................................]
                 +              +              +

 🌧️ 12PM - 2PM, 3PM - 5PM

 🌞 11:01AM | 🌚 12:52AM

 66°  ⬇   65°  ⬆   67°  ⬆   73°  ⬇   71°
 12PM     3PM      6PM      9PM      12AM

 66° | moderate rain | 92% humidity

# => :ok
```

or standalone as a command line interface:

```bash
$ weather --units metric --no-twelve

🌞 06:08 | 🌚 19:42

24°  ⬇   23°  ⬇   18°  ⬇   16°  ⬇   15°
16       19       22       01       04

25° | clear sky | 48% humidity
```

## Getting Started

In order to fetch real weather data, you'll want to first create an API Key for OpenWeatherMap's ["One Call API 3.0"](https://openweathermap.org/api/one-call-3) service. However, if you're not ready to do that yet, you can always play around with `Weather` by passing the `test` option (for more information, see the [Options](#options) section below).

### Creating an API Key

Follow the directions on OpenWeatherMap's ["One Call API 3.0"](https://openweathermap.org/api/one-call-3) page for creating an API Key. Up to 1,000 calls per day are provided for free.

After creating your API Key, make sure to set your "Calls per day (no more than)" to 1,000 at your [subscriptions](https://home.openweathermap.org/subscriptions) page. This ensures you'll never go over the limit of the 1,000 free API calls per day (I believe the default is 2,000 which is a bit irritating).

Note that it can take some time for your API key to become ready for use. I think it took a few hours for my key to become activated.

### <a id="set-env-vars"></a> (Optional) Set environment variables for your API Key, Latitude, and Longitude

Set the `OPENWEATHER_API_KEY`, `WEATHER_LATITUDE`, and `WEATHER_LONGITUDE` environment variables. With these set, you won't need to pass `api_key`, `latitude`, or `longitude` to [`Weather.Opts.new/1`] and it'll default to using these values.

For example, with these environment variables set you can simply:

```elixir
Weather.get!() |> IO.puts()

🌞 6:09AM | 🌚 7:40PM

76°  ⬆   77°  ⮕   77°  ⬇   68°  ⬇   64°
12PM     3PM      6PM      9PM      12AM

76° | clear sky | 51% humidity

# => :ok
```

### Using `Weather` as a Dependency

Add `weather` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:weather, "~> 0.2.8"}]
end
```

and you're ready to go!

```elixir
# If you haven't created an OpenWeatherMap API Key yet, this can be:
# opts = Weather.Opts.new(test: "rain")
#
# If you've set the environment variables for your API key, latitude, and longitude,
# this can be:
# opts = Weather.Opts.new()
opts = Weather.Opts.new(
  api_key: "your-openweather-api-key",
  latitude: 41.411835,
  longitude: -75.665245
)
{:ok, response} = Weather.API.fetch_weather(opts)
# =>
# {:ok,
#  %Req.Response{
#    status: 200,
#    headers: %{},
#    body: %{
#      "current" => %{...},
#      "daily" => %{...},
#      "hourly" => %{...},
#      "minutely" => %{...},
#      ...
#    }
#  }
# }

{sun_report, _, _} = Weather.Report.SunriseSunset.generate({[], response.body, opts})
IO.puts(sun_report)
🌞 6:20AM | 🌚 7:50PM
# => :ok
```

See [Options](#options) for the list of options you can pass to [`Weather.Opts.new/1`].

All available modules can be found on [hexdocs](https://hexdocs.pm/weather).

### Using `Weather` as a Commmand Line Interface

1. Clone the repository
   ```bash
   $ git clone https://github.com/spencerolson/weather.git
   ```
2. Generate the executable and move it to a directory that is in your `PATH`
   ```bash
   $ cd weather
   $ mix deps.get
   $ mix escript.build
   $ mv weather ~/bin/ # or some other directory that is in your PATH
   ```
3. Use it from anywhere!

   If you've created an OpenWeatherMap API Key:
   ```bash
   $ weather --api-key your-openweather-api-key --latitude 41.411835 --longitude -75.665245

   🌞 6:20AM | 🌚 7:50PM

   77°  ⮕   77°  ⬇   69°  ⬇   59°  ⬇   57°
   1PM      4PM      7PM      10PM     1AM

   77° | clear sky | 51% humidity

   ```

   If you haven't created an OpenWeatherMap API Key yet:
   ```bash
   $ weather --test clear

   🌞 5:17AM | 🌚 8:25PM

   76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
   3PM      6PM      9PM      12AM     3AM

   77° | scattered clouds | 37% humidity

   ```

   If you've set the environment variables for your API key, latitude, and longitude:
   ```bash
   $ weather

   🌞 6:20AM | 🌚 7:50PM

   77°  ⮕   77°  ⬇   69°  ⬇   59°  ⬇   57°
   1PM      4PM      7PM      10PM     1AM

   77° | clear sky | 51% humidity
   ```

   For a list of all available options, see:
   ```bash
   $ weather --help

   <big list of options>
   ```

## Options
Option names listed below are for the command line interface. All options can also be passed as a [Keyword list](https://hexdocs.pm/elixir/keywords-and-maps.html#keyword-lists) to [`Weather.Opts.new/1`]. Note that hyphens must be converted to underscores for the option names passed to [`Weather.Opts.new/1`]. For example, `Weather.Opts.new(hide_alerts: true)`

*Note that boolean switches take no values. --someval sets the value to `true` and --no-someval sets the value to `false`.*

- `--help` (`-h`): Prints the help message. (boolean)
- `--hide-alerts` (`-l`): Hides weather alerts, even when alerts are available. Default is false, which shows alerts if there are any available. (boolean)
- `--alert-titles-only` (`-o`): Shows only the titles of weather alerts. Default is false, which shows titles along with full alert descriptions. (boolean)
- `--colors` (`-c`): Enables colorized output for the hourly report. Defaults to true. (boolean)
- `--every` (`-e`): Sets the hour interval at which data is reported for the hourly report. Defaults to 3. (integer)
- `--hours` (`-r`): Sets the number of hours to report on for the hourly report. Defaults to 12. Max is 48. (integer)
- `--label` (`-b`): The name of the location for which weather data is being fetched. If present, the report will include - the label in the output. If not provided but a zip code is provided, the label will be set to the name of the location associated with the zip code.. (string)
- `--latitude` (`-t`): The latitude of the location for which to fetch weather data. (float)
- `--longitude` (`-n`): The longitude of the location for which to fetch weather data. (float)
- `--api-key` (`-a`): The OpenWeatherMap API key. (string)
- `--units` (`-u`): The units in which to return the weather data. Options: "metric" (celsius), "celsius", "imperial" (fahrenheit), "fahrenheit", "standard" (kelvin), "kelvin". (string)
- `--test` (`-s`): Fake weather data for testing purposes. Options: "clear", "rain", "storm". (string)
- `--twelve` (`-w`): Enables 12-hour time format for the hourly report. Defaults to true. When false, 24-hour time format is used. (boolean)
- `--zip` (`-z`): A zip code string to fetch weather data for. This can be used in place of latitude and longitude. (string)

## Examples

All examples below assume the api key, latitude, and longitude environment variables have been set (see [(Optional) Set environment variables for your API Key, Latitude, and Longitude
](#set-env-vars))

### Fetch weather using a zip code (no latitude or longitude needed)

```bash
$ weather --zip 60618

Chicago

🌞 6:07AM | 🌚 7:39PM

79°  ⬆   81°  ⮕   81°  ⬇   74°  ⬇   69°
12PM     3PM      6PM      9PM      12AM

79° | broken clouds | 44% humidity

```

### Fetch weather with results in Celcius and using 24-hour time.

```bash
$ weather --units celsius --no-twelve

🌞 06:07 | 🌚 19:39

26°  ⬆   27°  ⮕   27°  ⬇   23°  ⬇   21°
12       15       18       21       00

26° | broken clouds | 44% humidity

```

### Fetch weather for every hour for the next 5 hours

```bash
$ weather --every 1 --hours 5

🌞 6:07AM | 🌚 7:39PM

79°  ⮕   79°  ⬆   80°  ⬆   81°  ⬆   82°  ⮕   82°
12PM     1PM      2PM      3PM      4PM      5PM

79° | broken clouds | 44% humidity

```

### Use fake storm data, showing only titles (hiding descriptions) for alerts

```bash
$ weather --test storm --alert-titles-only

                   << 🌧️ 8:28PM - 9:27PM >>

[                                                            ]
[.........       ...............     ........................]
[............................................................]
[............................................................]
[............................................................]
[............................................................]
                +              +              +

🌧️ 9PM - 2AM

🌞 5:44AM | 🌚 8:42PM

77°  ⬇   73°  ⬇   70°  ⬇   68°  ⬆   72°
8PM      11PM     2AM      5AM      8AM

77° | very heavy rain | 76% humidity

FLOOD WATCH (Tue 5:00PM - Wed 7:00AM)

TORNADO WATCH (Tue 7:48PM - Tue 9:00PM)

SEVERE THUNDERSTORM WARNING (Tue 8:12PM - Tue 9:30PM)

SEVERE THUNDERSTORM WARNING (Tue 7:42PM - Tue 8:45PM)

SEVERE THUNDERSTORM WARNING (Tue 8:17PM - Tue 8:45PM)

```

### Fetch weather, adding a label and removing ANSI colors from the output

```bash
$ weather --label "Home Sweet Home" --no-colors

Home Sweet Home

🌞 6:07AM | 🌚 7:39PM

80°  ⬆   81°  ⮕   81°  ⬇   74°  ⬇   69°
12PM     3PM      6PM      9PM      12AM

80° | broken clouds | 43% humidity

```

## License

The MIT License (MIT)

Copyright (c) 2024 Spencer Olson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[`Weather.Opts.new/1`]: https://hexdocs.pm/weather/Weather.Opts.html#new/1
