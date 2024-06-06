defmodule Weather.Opts do
  @moduledoc """
  The weather opts struct.

  Fields:

    * `:latitude` - a float representing the latitude of your location.

    * `:longitude` - a float representing the longitude of your location.

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:units` - a string representing the units of measurement. Default is
      "imperial" (Fahrenheit). Other options are "metric" (Celsius) and
      "standard" (Kelvin).

    * `:period` - a string representing the period of time to fetch weather
      data for. Default is "1H" (1 hour). Can specify up to 1-60 minutes (M),
      1-24 hours (H), or 1-7 days (D).
  """
  @keys [:latitude, :longitude, :appid, :units, :period]
  @enforce_keys @keys
  defstruct @keys

  def new(opts) do
    %Weather.Opts{
      latitude: opts[:latitude] || Application.get_env(:weather, :lat),
      longitude: opts[:longitude] || Application.get_env(:weather, :lon),
      appid: opts[:api_key] || Application.get_env(:weather, :api_key),
      units: opts[:units] || "imperial",
      period: opts[:period] || "1H"
    }
  end
end
