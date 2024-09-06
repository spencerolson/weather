defmodule Weather.Opts do
  @moduledoc """
  The `Weather.Opts` struct.

  Fields:

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:colors` - a boolean representing whether or not to colorize the output
      of the hourly report. Defaults to true.

    * `:every_n_hours` - an integer representing the hour interval at which data is
      reported for the hourly report. Defaults to 3.

    * `:feels_like` - a boolean representing whether to show the "feels like" temperature
      instead of the actual temperature. Defaults to false.

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

    * `:label` - An optional string representing the name of the location
      for which weather data is being fetched. If present, the report will include
      the label in the output. If not provided but a zip code is provided, the
      label will be set to the name of the location associated with the zip code.
  """

  @type t() :: %Weather.Opts{
          appid: String.t(),
          colors: boolean(),
          every_n_hours: integer(),
          hide_alerts: boolean(),
          feels_like: boolean(),
          alert_titles_only: boolean(),
          hours: integer(),
          latitude: float(),
          longitude: float(),
          test: String.t(),
          twelve: boolean(),
          units: String.t(),
          label: String.t()
        }

  @type parsed_args() :: %{
          api_key: String.t(),
          colors: boolean(),
          every: integer(),
          hide_alerts: boolean(),
          feels_like: boolean(),
          alert_titles_only: boolean(),
          hours: integer(),
          latitude: float(),
          longitude: float(),
          test: String.t(),
          twelve: boolean(),
          units: String.t(),
          zip: String.t()
        }

  @keys [
    :test,
    :appid,
    :latitude,
    :longitude,
    :label,
    :hide_alerts,
    :feels_like,
    :alert_titles_only,
    :hours,
    :every_n_hours,
    :colors,
    :twelve,
    :units
  ]
  @enforce_keys @keys
  defstruct @keys

  @fake_api_key "MyFakeApiKeyz9c141l98bi16m1g9f21"
  @fake_latitude 42.3871
  @fake_longitude -87.9562

  @doc """
  Create a new `Weather.Opts` struct, applying defaults where necessary.
  """
  @spec new(parsed_args()) :: Weather.Opts.t()
  def new(parsed_args \\ %{}) do
    opts =
      Enum.reduce(@keys, %{}, fn key, opts ->
        case add(key, parsed_args, opts) do
          {:ok, new_opts} -> new_opts
          {:error, reason} -> raise(ArgumentError, reason)
        end
      end)

    struct!(__MODULE__, opts)
  end

  defp add(:test, parsed_args, opts) do
    case parsed_args[:test] do
      val when val in [nil, "clear", "rain", "storm"] ->
        {:ok, Map.put(opts, :test, val)}

      val ->
        {:error,
         "Invalid --test. Expected \"clear\", \"rain\", or \"storm\". Received: #{inspect(val)}"}
    end
  end

  defp add(:appid, _, %{test: test} = opts) when test != nil,
    do: {:ok, Map.put(opts, :appid, @fake_api_key)}

  defp add(:appid, parsed_args, opts) do
    api_key = parsed_args[:api_key] || System.get_env("OPENWEATHER_API_KEY")

    if api_key do
      {:ok, Map.put(opts, :appid, api_key)}
    else
      {:error,
       "Missing API key. Please set the OPENWEATHER_API_KEY environment variable or provide a value via the --api-key flag."}
    end
  end

  defp add(:latitude, _, %{test: test} = opts) when test != nil do
    {
      :ok,
      Map.merge(opts, %{latitude: @fake_latitude, longitude: @fake_longitude, label: nil})
    }
  end

  defp add(:latitude, parsed_args, opts) do
    case parsed_args[:zip] do
      nil -> parse_lat_long(parsed_args, opts)
      zip -> lookup_by_zip(zip, opts)
    end
  end

  defp add(:longitude, _, opts), do: {:ok, opts}

  defp add(:label, %{label: label}, opts) when label != nil do
    {:ok, Map.put(opts, :label, label)}
  end

  defp add(:label, _, opts), do: {:ok, opts}

  defp add(:hide_alerts, parsed_args, opts), do: add_bool(:hide_alerts, parsed_args, opts, false)

  defp add(:feels_like, parsed_args, opts), do: add_bool(:feels_like, parsed_args, opts, false)

  defp add(:alert_titles_only, parsed_args, opts),
    do: add_bool(:alert_titles_only, parsed_args, opts, false)

  defp add(:hours, parsed_args, opts) do
    case parsed_args[:hours] do
      val when val in 0..48 ->
        {:ok, Map.put(opts, :hours, val)}

      val when is_nil(val) ->
        {:ok, Map.put(opts, :hours, 12)}

      val ->
        {:error,
         "Invalid --hours. Expected a value between 0 and 48, inclusive. Received: #{inspect(val)}"}
    end
  end

  defp add(:every_n_hours, parsed_args, opts) do
    case parsed_args[:every] do
      val when val in 0..opts.hours//1 ->
        {:ok, Map.put(opts, :every_n_hours, val)}

      val when is_nil(val) ->
        {:ok, Map.put(opts, :every_n_hours, 3)}

      val ->
        {:error,
         "Invalid --every. Expected a value between 0 and #{opts.hours}, inclusive. Received: #{inspect(val)}"}
    end
  end

  defp add(:colors, parsed_args, opts), do: add_bool(:colors, parsed_args, opts, true)

  defp add(:twelve, parsed_args, opts), do: add_bool(:twelve, parsed_args, opts, true)

  defp add(:units, parsed_args, opts) do
    case parsed_args[:units] do
      "celsius" ->
        {:ok, Map.put(opts, :units, "metric")}

      "fahrenheit" ->
        {:ok, Map.put(opts, :units, "imperial")}

      "kelvin" ->
        {:ok, Map.put(opts, :units, "standard")}

      units when units in ["imperial", "metric", "standard"] ->
        {:ok, Map.put(opts, :units, units)}

      nil ->
        {:ok, Map.put(opts, :units, "imperial")}

      units ->
        {:error,
         "Invalid --units. Expected \"imperial\", \"fahrenheit\", \"metric\", \"celsius\", \"standard\", or \"kelvin\". Received: #{inspect(units)}"}
    end
  end

  defp add_bool(key, parsed_args, opts, default) do
    case parsed_args[key] do
      val when is_boolean(val) ->
        {:ok, Map.put(opts, key, val)}

      nil ->
        {:ok, Map.put(opts, key, default)}

      val ->
        {:error, "Invalid --#{key_to_arg(key)}. Expected a boolean. Received: #{inspect(val)}"}
    end
  end

  defp key_to_arg(key), do: String.replace(key, "_", "-")

  defp parse_lat_long(parsed_args, opts) do
    with {:ok, latitude} <-
           parse_coord(:latitude, parsed_args[:latitude] || System.get_env("WEATHER_LATITUDE")),
         {:ok, longitude} <-
           parse_coord(:longitude, parsed_args[:longitude] || System.get_env("WEATHER_LONGITUDE")) do
      {
        :ok,
        Map.merge(opts, %{latitude: latitude, longitude: longitude, label: nil})
      }
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

  defp lookup_by_zip(zip, opts) do
    case Weather.API.fetch_location(%{zip: zip}, opts.appid) do
      {:ok, %Req.Response{status: 200} = resp} ->
        %{body: %{"lat" => latitude, "lon" => longitude, "name" => label_from_zip}} = resp

        {
          :ok,
          Map.merge(opts, %{latitude: latitude, longitude: longitude, label: label_from_zip})
        }

      {:ok, _} ->
        {:error,
         "Invalid --zip. Value provided must be a valid zip code. Received: #{inspect(zip)}"}

      {:error, exception} ->
        {:error,
         "Exception encountered when making a request to the OpenWeatherMap API\n\n#{inspect(exception)}"}
    end
  end
end

defimpl Inspect, for: Weather.Opts do
  @spec inspect(Weather.Opts.t(), Inspect.Opts.t()) :: binary()
  def inspect(weather_opts, opts) do
    weather_opts
    |> redact_appid()
    |> Inspect.Any.inspect(opts)
  end

  defp redact_appid(%Weather.Opts{appid: nil} = weather_opts), do: weather_opts
  defp redact_appid(weather_opts), do: Map.put(weather_opts, :appid, "<<REDACTED>>")
end
