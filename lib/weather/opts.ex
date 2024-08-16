defmodule Weather.Opts do
  @moduledoc """
  The `Weather.Opts` struct.

  Fields:

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:colors` - a boolean representing whether or not to colorize the output
      of the hourly report. Defaults to true.

    * `:every_n_hours` - an integer representing the hour interval at which data is
      reported for the hourly report. Defaults to 3.

    * `:hide_alerts` - a boolean representing whether to hide weather alerts, even
      when alerts are available. Defaults to false, which shows alerts if there
      are any available.

    * `:alert_titles_only` - a boolean representing whether to show only the titles
      of weather alerts. Defaults to false, which shows titles along with full
      alert descriptions.

    * `:hours` - an integer representing the number of hours to report on for the
      hourly report. Defaults to 12. Max is 48.

    * `:latitude` - a float representing the latitude of your location.

    * `:longitude` - a float representing the longitude of your location.

    * `:test` - a string representing the type of fake weather data to return for
      testing purposes. Options are "clear", "rain", "storm".

    * `:twelve` - a boolean representing whether to use 12-hour time format for
      the hourly report. Defaults to true. When false, 24-hour time format is used.

    * `:units` - a string representing the units of measurement. Default is
      "imperial" (Fahrenheit). Other options are "metric" (Celsius) and
      "standard" (Kelvin).

    * `:location_name` - An optional string representing the name of the location
      for which weather data is being fetched. If present, the report will include
      the location name in the output.
  """

  @type t() :: %Weather.Opts{
          appid: String.t(),
          colors: boolean(),
          every_n_hours: integer(),
          hide_alerts: boolean(),
          alert_titles_only: boolean(),
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
          hide_alerts: boolean(),
          alert_titles_only: boolean(),
          hours: integer(),
          latitude: float(),
          longitude: float(),
          test: String.t(),
          twelve: boolean(),
          units: String.t(),
          zip: String.t()
        ]

  @keys [
    :latitude,
    :longitude,
    :appid,
    :colors,
    :every_n_hours,
    :hide_alerts,
    :alert_titles_only,
    :hours,
    :test,
    :twelve,
    :units,
    :location_name
  ]
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
         {:ok, latitude, longitude, location_name} <- coords(parsed_args, api_key, test),
         {:ok, hide_alerts} <- hide_alerts(parsed_args),
         {:ok, alert_titles_only} <- alert_titles_only(parsed_args),
         {:ok, hours} <- hours(parsed_args),
         {:ok, every_n_hours} <- every_n_hours(hours, parsed_args),
         {:ok, colors} <- colors(parsed_args),
         {:ok, twelve} <- twelve(parsed_args),
         {:ok, units} <- units(parsed_args) do
      %Weather.Opts{
        appid: api_key,
        colors: colors,
        every_n_hours: every_n_hours,
        hide_alerts: hide_alerts,
        alert_titles_only: alert_titles_only,
        hours: hours,
        latitude: latitude,
        longitude: longitude,
        test: test,
        twelve: twelve,
        units: units,
        location_name: location_name
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
      val when val in [nil, "clear", "rain", "storm"] ->
        {:ok, val}

      val ->
        {:error,
         "Invalid --test. Expected \"clear\", \"rain\", or \"storm\". Received: #{inspect(val)}"}
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

  defp hide_alerts(parsed_args) do
    case parsed_args[:hide_alerts] do
      hide_alerts when is_boolean(hide_alerts) ->
        {:ok, hide_alerts}

      nil ->
        {:ok, false}

      hide_alerts ->
        {:error, "Invalid --hide-alerts. Expected a boolean. Received: #{inspect(hide_alerts)}"}
    end
  end

  defp alert_titles_only(parsed_args) do
    case parsed_args[:alert_titles_only] do
      alert_titles_only when is_boolean(alert_titles_only) ->
        {:ok, alert_titles_only}

      nil ->
        {:ok, false}

      alert_titles_only ->
        {:error,
         "Invalid --alert-titles-only. Expected a boolean. Received: #{inspect(alert_titles_only)}"}
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

  defp coords(_, _, test) when test != nil, do: {:ok, @fake_latitude, @fake_longitude, nil}

  defp coords(parsed_args, api_key, _) do
    case parsed_args[:zip] do
      nil -> parse_lat_long(parsed_args)
      _ -> lookup_by_zip(parsed_args[:zip], api_key)
    end
  end

  defp parse_lat_long(parsed_args) do
    with {:ok, latitude} <-
           parse_coord(:latitude, parsed_args[:latitude] || System.get_env("MY_HOME_LAT")),
         {:ok, longitude} <-
           parse_coord(:longitude, parsed_args[:longitude] || System.get_env("MY_HOME_LONG")) do
      {:ok, latitude, longitude, nil}
    else
      {:error, msg} -> {:error, msg}
    end
  end

  defp parse_coord(type, nil) do
    {:error, "Invalid --#{type}. Value provided must represent a float. Received: nil"}
  end

  defp parse_coord(type, value) when is_binary(value) do
    case Float.parse(value) do
      {coord, ""} ->
        {:ok, coord}

      _ ->
        {:error,
         "Invalid --#{type}. Value provided must represent a float. Received: #{inspect(value)}"}
    end
  end

  defp parse_coord(_, value) when is_float(value), do: {:ok, value}

  defp lookup_by_zip(zip, api_key) do
    case Weather.API.fetch_location(%{zip: zip}, api_key) do
      {:ok, %Req.Response{status: 200} = resp} ->
        %{body: %{"lat" => latitude, "lon" => longitude, "name" => name}} = resp
        {:ok, latitude, longitude, name}

      {:ok, _} ->
        {:error,
         "Invalid --zip. Value provided must be a valid zip code. Received: #{inspect(zip)}"}

      {:error, exception} ->
        {:error,
         "Exception encountered when making a request to the OpenWeatherMap API\n\n#{inspect(exception)}"}
    end
  end
end
