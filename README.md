# ![Logo](https://raw.githubusercontent.com/spencerolson/weather/main/priv/static/images/logo.png "Weather") Weather

[![Build
Status](https://github.com/spencerolson/weather/actions/workflows/elixir.yml/badge.svg)](https://github.com/spencerolson/weather/actions/workflows/elixir.yml) [![License](https://img.shields.io/hexpm/l/weather.svg)](https://github.com/spencerolson/weather/blob/main/LICENSE.md) [![Hex.pm](https://img.shields.io/hexpm/v/weather.svg)](https://hex.pm/packages/weather) [![Documentation](https://img.shields.io/badge/documentation-purple)](https://hexdocs.pm/weather)

[![Run in Livebook](https://livebook.dev/badge/v1/black.svg)](https://livebook.dev/run?url=https%3A%2F%2Fgithub.com%2Fspencerolson%2Fweather%2Fblob%2Fmain%2FLIVEBOOK.livemd)

An Elixir library for fetching data from the [OpenWeatherMap One Call API 3.0](https://openweathermap.org/api/one-call-3) service.

Use it as a dependency in your project:

```elixir
Mix.install(
  [{:weather, "~> 0.4.0"}]
)

opts = Weather.Opts.new!(test: "rain")
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

                   << 🌧️  7:28AM - 8:27AM >>

[                                                    ....    ]
[                                              ............  ]
[                                    ........................]
[                                   .........................]
[                                 ...........................]
[                                ............................]
                +              +              +

🌧️  8AM - 9AM, 10AM - 12PM

🌞 6:01AM | 🌚 7:52PM

66°  ⬇   65°  ⬆   67°  ⬆   73°  ⬇   71°
7AM      10AM     1PM      4PM      7PM

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

## Features
- Access to raw API responses
- Access to formatted rain reports
- Customizable ANSI-colorized output
- Detailed rain intensity forecast for the next hour
- Weather alerts
- Customizable length and interval for hourly weather
- Customizable time (12 or 24 hour) and temp display (celsius, fahrenheit, kelvin)
- Usable as a dependency or standalone CLI
- Weather lookup by ZIP code and country code
- Mock weather responses to test responses for varying conditions

## Getting Started

In order to fetch real weather data, you'll want to first create an API Key for OpenWeatherMap's ["One Call API 3.0"](https://openweathermap.org/api/one-call-3) service. However, if you're not ready to do that yet, you can always play around with `Weather` by passing the `test` option (for more information, see the [Options](#options) section below).

### Creating an API Key

Follow the directions on OpenWeatherMap's ["One Call API 3.0"](https://openweathermap.org/api/one-call-3) page for creating an API Key. Up to 1,000 calls per day are provided for free.

After creating your API Key, make sure to set your "Calls per day (no more than)" to 1,000 at your [subscriptions](https://home.openweathermap.org/subscriptions) page. This ensures you'll never go over the limit of the 1,000 free API calls per day (I believe the default is 2,000 which is a bit irritating).

It can take some time for your API key to become ready for use. I think it took a few hours for my key to become activated.

### (Optional) Set environment variables for your API Key, Latitude, and Longitude

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

Add `weather` to your list of dependencies in `mix.exs`

```elixir
def deps do
  [{:weather, "~> 0.4.0"}]
end
```

and you're ready to go!

```elixir
# If you haven't created an OpenWeatherMap API Key yet, this can be:
# opts = Weather.Opts.new!(test: "rain")
#
# If you've set the environment variables for your API key, latitude, and longitude,
# this can be:
# opts = Weather.Opts.new!()
opts = Weather.Opts.new!(
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

### Using `Weather` as a Command Line Interface

1. Install the escript
   ```bash
   $ mix escript.install hex weather
   ```
2. Add the escript to your `$PATH` (more info [here](https://hexdocs.pm/mix/main/Mix.Tasks.Escript.Install.html))
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

## "Minutely" Rain Chart

When any rain is expected within the next hour, a rain chart will be output by [`Weather.Report.RainMinutely.generate/1`]. It looks something like:

```bash
                    << 🌧️ 12:28PM - 1:27PM >>

 [                                                            ]
 [                                                            ]
 [                    ........................................]
 [............................................................]
 [............................................................]
 [............................................................]
                 +              +              +
```

For each column, the number of dots corresponds with the rain intensity for that minute:
- 0 dots = "No Rain"
- 1 dot  = "Very Light" (< 0.25 mm/hr)
- 2 dots = "Light" (>= 0.25 and < 1 mm/hr)
- 3 dots = "Moderate" (>= 1 and < 4 mm/hr)
- 4 dots = "Heavy" (>= 4 and < 16 mm/hr)
- 5 dots = "Very Heavy" (>= 16 and < 50 mm/hr)
- 6 dots = "Violent" (>= 50 mm/hr)

The `+` characters are 15-minute markers. So the first `+` is 15 minutes from now, the second `+` is 30 minutes from now, and the third `+` is 45 minutes from now.

## Options
Option names listed below are for the command line interface. All options can also be passed as a [Keyword list](https://hexdocs.pm/elixir/keywords-and-maps.html#keyword-lists) to [`Weather.Opts.new/1`]. Hyphens must be converted to underscores for the option names passed to [`Weather.Opts.new/1`]. For example, `Weather.Opts.new(hide_alerts: true)`

*Boolean switches take no values. --someval sets the value to `true` and --no-someval sets the value to `false`.*

- `--help` (`-h`): Prints the help message. (boolean)
- `--hide-alerts` (`-l`): Hides weather alerts, even when alerts are available. Default is false, which shows alerts if there are any available. (boolean)
- `--feels-like` (`-f`): Shows the 'feels like' temperature instead of the actual temperature. Defaults to false. (boolean)
- `--alert-titles-only` (`-o`): Shows only the titles of weather alerts. Default is false, which shows titles along with full alert descriptions. (boolean)
- `--colors` (`-c`): Enables colorized output for the hourly report. Defaults to true. (boolean)
- `--color-codes` (`-d`): A comma-separated list of up to 10 color codes to use for colorized output. Values must be integers in the range of 0 to 255 inclusive, or '_' to use the default. Defaults to 202,214,226,148,39,51,15,245,88,9. Values correspond with the following categories: arctic, freezing, cold, chilly, cool, mild, warm, hot, very_hot, scorching. (string)
- `--every` (`-e`): Sets the hour interval at which data is reported for the hourly report. Defaults to 3. (integer)
- `--hours` (`-r`): Sets the number of hours to report on for the hourly report. Defaults to 12. Max is 48. (integer)
- `--label` (`-b`): The name of the location for which weather data is being fetched. If present, the report will include - the label in the output. If not provided but a zip code is provided, the label will be set to the name of the location associated with the zip code. (string)
- `--latitude` (`-t`): The latitude of the location for which to fetch weather data. (float)
- `--longitude` (`-n`): The longitude of the location for which to fetch weather data. (float)
- `--api-key` (`-a`): The OpenWeatherMap API key. (string)
- `--units` (`-u`): The units in which to return the weather data. Options: "metric" (celsius), "celsius", "imperial" (fahrenheit), "fahrenheit", "standard" (kelvin), "kelvin". (string)
- `--test` (`-s`): Fake weather data for testing purposes. Options: "clear", "rain", "storm". (string)
- `--twelve` (`-w`): Enables 12-hour time format for the hourly report. Defaults to true. When false, 24-hour time format is used. (boolean)
- `--zip` (`-z`): A zip code string to fetch weather data for. This can be used in place of latitude and longitude. For most accurate results format should be zip/post code and ISO 3166 country code divided by comma. See https://openweathermap.org/api/geocoding-api#direct_zip for more information. (string)

## Customization

### Custom Colors

```elixir
Weather.Colors.list()
# => prints available colors and their associated codes

pink = 201
gray = 248
Weather.Opts.new!(color_codes: %{cool: pink, warm: gray})
```

or as a command line interface:

```bash
$ weather --color-codes "_,_,_,_,201,_,248,_,_,_"
```

### Adding a Custom Report

1. Define a module that implements the `Weather.Report` behaviour (defines `generate/1`).

   ```elixir
   defmodule Weather.Report.Custom.FullMoon do
     @moduledoc """
     A custom `Weather.Report` that prints when there's a full moon.
     """

     use Weather.Report

     @full_moon_phase 0.5

     @doc """
     Generates a full moon report.
     """
     @impl Weather.Report
     def generate({report, %{"daily" => [%{"moon_phase" => @full_moon_phase} | _]} = body, opts}) do
       {
         ["🌝🌚 OMG FULL MOON TONIGHT 🌚🌝" | report],
         body,
         opts
       }
     end

     def generate(weather), do: weather
   end
   ```

2. Add that module to the list of custom reports in your `config/config.exs`

   ```elixir
   config :weather, custom_reports: [Weather.Report.Custom.FullMoon]
   ```

3. Wait for a full moon...🌑🌒🌓🌔🌕

5. Enjoy your customized weather report

   ```elixir
   Weather.get!() |> IO.puts()

   🌝🌚 OMG FULL MOON TONIGHT 🌚🌝

   🌞 5:17AM | 🌚 8:25PM

   76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
   3PM      6PM      9PM      12AM     3AM

   77° | scattered clouds | 37% humidity

   :ok
   ```

6. If you're feeling generous, issue a [pull request](https://github.com/spencerolson/weather/pulls) to have your custom report added to the repo so others can use it! :D Please place the report in `lib/weather/report/custom/`. See `lib/weather/report/custom/full_moon.ex` for an example.

## Examples

All examples below assume the api key, latitude, and longitude environment variables have been set (see [(Optional) Set environment variables for your API Key, Latitude, and Longitude
](#optional-set-environment-variables-for-your-api-key-latitude-and-longitude))

### Fetch weather using a ZIP code (no latitude or longitude needed)

```bash
$ weather --zip E14,GB --no-twelve --units metric

London

🌞 06:22 | 🌚 19:33

19°  ⬆   21°  ⬇   20°  ⬇   17°  ⮕   17°
13       16       19       22       01

19° | clear sky | 76% humidity

YELLOW RAIN WARNING (Sat 21:00 - Sun 18:00)
Whilst there remains some uncertainty with exact details, areas of heavy and at times thundery rain are expected to spread north, then west, across England and Wales from this evening and overnight. These areas of heavy rain may become more persistent across western areas during Sunday daytime whilst slow-moving heavy showers and thunderstorms are likely to develop further east.

```

Fetching weather by ZIP code will result in _two_ API calls to OpenWeather; one to get the location data for that ZIP, and one to get the weather.

### Fetch weather with results in Celsius and using 24-hour time.

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

### Get the latitude, longitude, and name of a location by ZIP code (`iex` only)

```elixir
opts = Weather.Opts.new!(zip: "60618,US")
opts.latitude
# => 41.9464
opts.longitude
# => -87.7042
opts.label
# => "Chicago"
```

### View the temperature thresholds for colorized output (`iex` only)

When viewed in iex, you will see different colors for each temp in the output (you can't see them in this README because markdown doesn't support ANSI colors).

```elixir
Weather.Colors.list_current()

Current Color Configuration (temps in fahrenheit)

-10°
0°
33°
40°
50°
60°
70°
80°
90°
100°
# => :ok
```

## License

MIT License

Copyright (c) 2024 Spencer Olson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[`Weather.Opts.new/1`]: https://hexdocs.pm/weather/Weather.Opts.html#new/1
[`Weather.Report.RainMinutely.generate/1`]: https://hexdocs.pm/weather/Weather.Report.RainMinutely.html#generate/1
