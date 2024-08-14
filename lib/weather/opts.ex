defmodule Weather.Opts do
  @moduledoc """
  The `Weather.Opts` struct.

  Fields:

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:colors` - a boolean representing whether or not to colorize the output
      of the hourly report. Defaults to true.

    * `:every_n_hours` - an integer representing the hour interval at which data is
      reported for the hourly report. Defaults to 3.

    * `:hours` - an integer representing the number of hours to report on for the
      hourly report. Defaults to 12. Max is 48.

    * `:latitude` - a float representing the latitude of your location.

    * `:longitude` - a float representing the longitude of your location.

    * `:test` - a string representing the type of fake weather data to return for
      testing purposes. Options are "clear" and "storm".

    * `:twelve` - a boolean representing whether to use 12-hour time format for
      the hourly report. Defaults to true. When false, 24-hour time format is used.

    * `:units` - a string representing the units of measurement. Default is
      "imperial" (Fahrenheit). Other options are "metric" (Celsius) and
      "standard" (Kelvin).
  """

  @type t() :: %Weather.Opts{
          appid: String.t(),
          colors: boolean(),
          every_n_hours: integer(),
          hours: integer(),
          latitude: float(),
          longitude: float(),
          test: String.t(),
          twelve: boolean(),
          units: String.t()
        }

  @type parsed_args() :: [
          api_key: String.t(),
          colors: boolean(),
          every: integer(),
          hours: integer(),
          latitude: float(),
          longitude: float(),
          test: String.t(),
          twelve: boolean(),
          units: String.t()
        ]

  @keys [:latitude, :longitude, :appid, :colors, :every_n_hours, :hours, :test, :twelve, :units]
  @enforce_keys @keys
  defstruct @keys

  @fake_api_key "z9c141l98zx9b2z29fn98bi16m1g9f21"
  @fake_latitude 42.3871
  @fake_longitude -87.9562

  @doc """
  Create a new `Weather.Opts` struct, applying defaults where necessary.
  """
  @spec new(parsed_args()) :: Weather.Opts.t()
  def new(parsed_args \\ []) do
    with {:ok, test} <- test(parsed_args),
         {:ok, api_key} <- api_key(parsed_args, test),
         {:ok, latitude} <- latitude(parsed_args, test),
         {:ok, longitude} <- longitude(parsed_args, test),
         {:ok, hours} <- hours(parsed_args),
         {:ok, every_n_hours} <- every_n_hours(hours, parsed_args),
         {:ok, colors} <- colors(parsed_args),
         {:ok, twelve} <- twelve(parsed_args),
         {:ok, units} <- units(parsed_args) do
      %Weather.Opts{
        appid: api_key,
        colors: colors,
        every_n_hours: every_n_hours,
        hours: hours,
        latitude: latitude,
        longitude: longitude,
        test: test,
        twelve: twelve,
        units: units
      }
    else
      {:error, reason} ->
        raise(ArgumentError, reason)
    end
  end

  defp api_key(_, test) when test != nil, do: {:ok, @fake_api_key}

  defp api_key(parsed_args, _) do
    api_key = parsed_args[:api_key] || System.get_env("OPENWEATHER_API_KEY")

    if api_key do
      {:ok, api_key}
    else
      {:error,
       "Missing API key. Please set the OPENWEATHER_API_KEY environment variable or provide a value via the --api-key flag."}
    end
  end

  defp colors(parsed_args) do
    case parsed_args[:colors] do
      colors when is_boolean(colors) -> {:ok, colors}
      nil -> {:ok, true}
      colors -> {:error, "Invalid --colors. Expected a boolean. Received: #{inspect(colors)}"}
    end
  end

  defp test(parsed_args) do
    case parsed_args[:test] do
      val when val in [nil, "clear", "storm"] -> {:ok, val}
      val -> {:error, "Invalid --test. Expected \"clear\" or \"storm\". Received: #{inspect(val)}"}
    end
  end

  defp twelve(parsed_args) do
    case parsed_args[:twelve] do
      twelve when is_boolean(twelve) -> {:ok, twelve}
      nil -> {:ok, true}
      twelve -> {:error, "Invalid --twelve. Expected a boolean. Received: #{inspect(twelve)}"}
    end
  end

  defp units(parsed_args) do
    case parsed_args[:units] do
      "celsius" ->
        {:ok, "metric"}

      "fahrenheit" ->
        {:ok, "imperial"}

      "kelvin" ->
        {:ok, "standard"}

      units when units in ["imperial", "metric", "standard"] ->
        {:ok, units}

      nil ->
        {:ok, "imperial"}

      units ->
        {:error,
         "Invalid --units. Expected \"imperial\", \"fahrenheit\", \"metric\", \"celsius\", \"standard\", or \"kelvin\". Received: #{inspect(units)}"}
    end
  end

  defp every_n_hours(hours, parsed_args) do
    case parsed_args[:every] do
      every when every >= 0 and every <= hours ->
        {:ok, every}

      nil ->
        {:ok, 3}

      every ->
        {:error,
         "Invalid --every. Expected an integer >= 0 and <= #{hours}. Received: #{inspect(every)}"}
    end
  end

  defp hours(parsed_args) do
    case parsed_args[:hours] do
      hours when hours >= 0 and hours <= 48 ->
        {:ok, hours}

      nil ->
        {:ok, 12}

      hours ->
        {:error,
         "Invalid --hours. Expected an integer >= 0 and <= 48. Received: #{inspect(hours)}"}
    end
  end

  defp latitude(_, test) when test != nil, do: {:ok, @fake_latitude}

  defp latitude(parsed_args, _) do
    parse_latitude(parsed_args[:latitude] || System.get_env("MY_HOME_LAT"))
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

  defp longitude(_, test) when test != nil, do: {:ok, @fake_longitude}

  defp longitude(parsed_args, _) do
    parse_longitude(parsed_args[:longitude] || System.get_env("MY_HOME_LONG"))
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
