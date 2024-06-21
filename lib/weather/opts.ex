defmodule Weather.Opts do
  @moduledoc """
  The `Weather.Opts` struct.

  Fields:

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:latitude` - a float representing the latitude of your location.

    * `:longitude` - a float representing the longitude of your location.

    * `:period` - a string representing the period of time to fetch weather
      data for. Default is "1H" (1 hour). Can specify up to 1-60 minutes (M),
      1-24 hours (H), or 1-7 days (D).

    * `:units` - a string representing the units of measurement. Default is
      "imperial" (Fahrenheit). Other options are "metric" (Celsius) and
      "standard" (Kelvin).
  """

  @type t() :: %Weather.Opts{
          appid: String.t(),
          latitude: float(),
          longitude: float(),
          period: String.t(),
          units: String.t()
        }

  @type parsed_args() :: [
          api_key: String.t(),
          latitude: float(),
          longitude: float(),
          period: String.t(),
          units: String.t()
        ]

  @keys [:latitude, :longitude, :appid, :units, :period]
  @enforce_keys @keys
  defstruct @keys

  @doc """
  Create a new `Weather.Opts` struct, applying defaults where necessary.
  """
  @spec new(parsed_args()) :: Weather.Opts.t()
  def new(parsed_args) do
    %Weather.Opts{
      latitude: parsed_args[:latitude] || Application.get_env(:weather, :lat),
      longitude: parsed_args[:longitude] || Application.get_env(:weather, :lon),
      appid: parsed_args[:api_key] || Application.get_env(:weather, :api_key),
      units: parsed_args[:units] || "imperial",
      period: parsed_args[:period] || "1H"
    }
  end
end
