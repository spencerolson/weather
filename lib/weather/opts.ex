defmodule Weather.Opts do
  @moduledoc """
  The `Weather.Opts` struct.

  Fields:

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:every` - an integer representing the hour interval at which data is
      reported for the 12-hour report. Defaults to 3.

    * `:latitude` - a float representing the latitude of your location.

    * `:longitude` - a float representing the longitude of your location.

    * `:units` - a string representing the units of measurement. Default is
      "imperial" (Fahrenheit). Other options are "metric" (Celsius) and
      "standard" (Kelvin).
  """

  @type t() :: %Weather.Opts{
          appid: String.t(),
          every_n_hours: integer(),
          latitude: float(),
          longitude: float(),
          units: String.t()
        }

  @type parsed_args() :: [
          api_key: String.t(),
          every: integer(),
          latitude: float(),
          longitude: float(),
          units: String.t()
        ]

  @keys [:latitude, :longitude, :appid, :every_n_hours, :units]
  @enforce_keys @keys
  defstruct @keys

  @doc """
  Create a new `Weather.Opts` struct, applying defaults where necessary.
  """
  @spec new(parsed_args()) :: Weather.Opts.t()
  def new(parsed_args) do
    with {:ok, api_key} <- api_key(parsed_args),
         {:ok, latitude} <- latitude(parsed_args),
         {:ok, longitude} <- longitude(parsed_args),
         {:ok, every_n_hours} <- every_n_hours(parsed_args) do
      %Weather.Opts{
        appid: api_key,
        every_n_hours: every_n_hours,
        latitude: latitude,
        longitude: longitude,
        units: parsed_args[:units] || "imperial"
      }
    else
      {:error, reason} ->
        raise(ArgumentError, reason)
    end
  end

  defp api_key(parsed_args) do
    api_key = parsed_args[:api_key] || Application.get_env(:weather, :api_key)

    if api_key do
      {:ok, api_key}
    else
      {:error,
       "Missing API key. Please set the OPENWEATHER_API_KEY environment variable or provide a value via the --api-key flag."}
    end
  end

  defp every_n_hours(parsed_args) do
    case parsed_args[:every] do
      every when every >= 0 and every <= 12 -> {:ok, every}
      nil -> {:ok, 3}
      every -> {:error, "Invalid --every. Expected an integer >= 0 and <= 12. Received: #{every}"}
    end
  end

  defp latitude(parsed_args) do
    parse_latitude(parsed_args[:latitude] || Application.get_env(:weather, :lat))
  end

  defp parse_latitude(nil) do
    {:error,
     "Missing latitude. Please set the MY_HOME_LAT environment variable or provide a value via the --latitude flag."}
  end

  defp parse_latitude(latitude) when is_binary(latitude) do
    case Float.parse(latitude) do
      {parsed_latitude, ""} ->
        {:ok, parsed_latitude}

      _ ->
        {:error, "Invalid latitude. Value provided must represent a float. Received: #{latitude}"}
    end
  end

  defp parse_latitude(latitude) when is_float(latitude) do
    {:ok, latitude}
  end

  defp longitude(parsed_args) do
    parse_longitude(parsed_args[:longitude] || Application.get_env(:weather, :lon))
  end

  defp parse_longitude(nil) do
    {:error,
     "Missing longitude. Please set the MY_HOME_LONG environment variable or provide a value via the --longitude flag."}
  end

  defp parse_longitude(longitude) when is_binary(longitude) do
    case Float.parse(longitude) do
      {parsed_longitude, ""} ->
        {:ok, parsed_longitude}

      _ ->
        {:error,
         "Invalid longitude. Value provided must represent a float. Received: #{longitude}"}
    end
  end

  defp parse_longitude(longitude) when is_float(longitude) do
    {:ok, longitude}
  end
end
