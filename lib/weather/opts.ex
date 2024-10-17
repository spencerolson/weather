defmodule Weather.Opts do
  @moduledoc """
  The `Weather.Opts` struct.

  Fields:

    * `:appid` - a string representing the OpenWeatherMap API key.

    * `:colors` - a boolean representing whether or not to colorize the output
      of the hourly report. Defaults to true.

    * `:color_codes` - a map representing temperature color codes. Defaults
      to `Weather.Colors.default_color_codes/0`.

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

  @type t() :: %__MODULE__{
          appid: String.t(),
          colors: boolean(),
          color_codes: Weather.Colors.codes(),
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

  @type parsed_arg() ::
          {:api_key, String.t()}
          | {:colors, boolean()}
          | {:color_codes, String.t() | Weather.Colors.codes()}
          | {:every, integer()}
          | {:hide_alerts, boolean()}
          | {:feels_like, boolean()}
          | {:alert_titles_only, boolean()}
          | {:hours, integer()}
          | {:latitude, float()}
          | {:longitude, float()}
          | {:test, String.t()}
          | {:twelve, boolean()}
          | {:units, String.t()}
          | {:zip, String.t()}

  @type parsed_args() :: [parsed_arg()]

  @default_color_codes %{
    arctic: 245,
    freezing: 15,
    cold: 51,
    chilly: 39,
    cool: 148,
    mild: 226,
    warm: 214,
    hot: 202,
    very_hot: 9,
    scorching: 88
  }

  @keys test: nil,
        appid: nil,
        latitude: nil,
        longitude: nil,
        label: nil,
        hide_alerts: false,
        feels_like: false,
        alert_titles_only: false,
        hours: 12,
        every_n_hours: 3,
        colors: true,
        color_codes: @default_color_codes,
        twelve: true,
        units: "imperial"

  @enforce_keys [:appid, :latitude, :longitude]
  defstruct @keys

  @fake_api_key "MyFakeApiKeyz9c141l98bi16m1g9f21"
  @fake_latitude 42.3871
  @fake_longitude -87.9562

  @doc """
  Create a new `Weather.Opts` struct, applying defaults where necessary.
  """
  @spec new(parsed_args()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def new(parsed_args \\ []) when is_list(parsed_args) do
    args = Enum.into(parsed_args, %{})

    Enum.reduce_while(
      @keys,
      {:ok, %__MODULE__{appid: nil, latitude: nil, longitude: nil}},
      fn {key, _}, {:ok, opts} ->
        case add(key, args, opts) do
          {:ok, new_opts} -> {:cont, {:ok, new_opts}}
          {:error, reason} -> {:halt, {:error, reason}}
        end
      end
    )
  end

  @doc """
  Create a new `Weather.Opts` struct, applying defaults where necessary.

  Raises an `ArgumentError` if invalid input is given.
  """
  @spec new!(parsed_args()) :: __MODULE__.t()
  def new!(parsed_args \\ []) do
    case new(parsed_args) do
      {:ok, opts} -> opts
      {:error, reason} -> raise(ArgumentError, reason)
    end
  end

  defp add(:test, %{test: test}, opts) do
    case test do
      val when val in ["clear", "rain", "storm"] ->
        {:ok, %__MODULE__{opts | test: val}}

      val ->
        {:error,
         "Invalid --test. Expected \"clear\", \"rain\", or \"storm\". Received: #{inspect(val)}"}
    end
  end

  defp add(:appid, _, %{test: test} = opts) when test != nil,
    do: {:ok, %__MODULE__{opts | appid: @fake_api_key}}

  defp add(:appid, args, opts) do
    case Map.get(args, :api_key, System.get_env("OPENWEATHER_API_KEY")) do
      nil ->
        {:error,
         "Missing API key. Please set the OPENWEATHER_API_KEY environment variable or provide a value via the --api-key flag."}

      api_key ->
        {:ok, %__MODULE__{opts | appid: api_key}}
    end
  end

  defp add(:latitude, _, %{test: test} = opts) when test != nil do
    {
      :ok,
      %__MODULE__{opts | latitude: @fake_latitude, longitude: @fake_longitude, label: nil}
    }
  end

  defp add(:latitude, args, opts) do
    case Map.get(args, :zip) do
      nil -> parse_lat_long(args, opts)
      zip -> lookup_by_zip(zip, opts)
    end
  end

  defp add(:longitude, %{longitude: _}, opts), do: {:ok, opts}

  defp add(:label, %{label: label}, opts) when is_binary(label) do
    {:ok, %__MODULE__{opts | label: label}}
  end

  defp add(:hide_alerts, %{hide_alerts: hide_alerts}, opts) do
    add_bool(:hide_alerts, hide_alerts, opts)
  end

  defp add(:feels_like, %{feels_like: feels_like}, opts) do
    add_bool(:feels_like, feels_like, opts)
  end

  defp add(:alert_titles_only, %{alert_titles_only: alert_titles_only}, opts) do
    add_bool(:alert_titles_only, alert_titles_only, opts)
  end

  defp add(:hours, %{hours: hours}, opts) do
    case hours do
      val when val in 0..48 ->
        {:ok, %__MODULE__{opts | hours: val}}

      val ->
        {:error,
         "Invalid --hours. Expected a value between 0 and 48, inclusive. Received: #{inspect(val)}"}
    end
  end

  defp add(:every_n_hours, %{every: every}, opts) do
    case every do
      val when val in 0..opts.hours//1 ->
        {:ok, %__MODULE__{opts | every_n_hours: val}}

      val ->
        {:error,
         "Invalid --every. Expected a value between 0 and #{opts.hours}, inclusive. Received: #{inspect(val)}"}
    end
  end

  defp add(:colors, %{colors: colors}, opts), do: add_bool(:colors, colors, opts)

  defp add(:color_codes, %{color_codes: codes_str}, opts) when is_binary(codes_str) do
    custom_codes = String.split(codes_str, ",", trim: true)

    color_codes =
      @default_color_codes
      |> Enum.with_index()
      |> Map.new(fn {{category, default_code}, index} ->
        case Enum.at(custom_codes, index) do
          nil -> {category, default_code}
          custom_code -> {category, parse_custom_code(custom_code, default_code)}
        end
      end)

    {:ok, %__MODULE__{opts | color_codes: color_codes}}
  end

  defp add(:color_codes, %{color_codes: codes}, opts) when is_map(codes) do
    color_codes = Map.merge(@default_color_codes, codes)
    {:ok, %__MODULE__{opts | color_codes: color_codes}}
  end

  defp add(:color_codes, %{color_codes: codes}, _) do
    {:error, "Invalid --color-codes. Expected a string or map. Received: #{inspect(codes)}"}
  end

  defp add(:twelve, %{twelve: twelve}, opts), do: add_bool(:twelve, twelve, opts)

  defp add(:units, %{units: "celsius"}, opts), do: add(:units, %{units: "metric"}, opts)
  defp add(:units, %{units: "fahrenheit"}, opts), do: add(:units, %{units: "imperial"}, opts)
  defp add(:units, %{units: "kelvin"}, opts), do: add(:units, %{units: "standard"}, opts)

  defp add(:units, %{units: units}, opts) do
    case units do
      units when units in ["imperial", "metric", "standard"] ->
        {:ok, %__MODULE__{opts | units: units}}

      units ->
        {:error,
         "Invalid --units. Expected \"imperial\", \"fahrenheit\", \"metric\", \"celsius\", \"standard\", or \"kelvin\". Received: #{inspect(units)}"}
    end
  end

  # Key was not provided. Use default struct values.
  defp add(key, args, opts) when not is_map_key(args, key), do: {:ok, opts}

  defp add_bool(key, value, opts) do
    case value do
      val when is_boolean(val) ->
        {:ok, Map.put(opts, key, val)}

      val ->
        {:error, "Invalid --#{key_to_arg(key)}. Expected a boolean. Received: #{inspect(val)}"}
    end
  end

  defp key_to_arg(key) do
    key
    |> Atom.to_string()
    |> String.replace("_", "-")
  end

  defp parse_lat_long(args, opts) do
    with {:ok, latitude} <- parse_coord(:latitude, args, System.get_env("WEATHER_LATITUDE")),
         {:ok, longitude} <- parse_coord(:longitude, args, System.get_env("WEATHER_LONGITUDE")) do
      {
        :ok,
        %__MODULE__{opts | latitude: latitude, longitude: longitude, label: nil}
      }
    else
      {:error, msg} -> {:error, msg}
    end
  end

  defp parse_coord(type, args, default) do
    args
    |> Map.get(type, default)
    |> do_parse_coord(type)
  end

  defp do_parse_coord(nil, type) do
    {:error, "Invalid --#{type}. Value provided must represent a float. Received: nil"}
  end

  defp do_parse_coord(value, type) when is_binary(value) do
    case Float.parse(value) do
      {coord, ""} ->
        {:ok, coord}

      _ ->
        {:error,
         "Invalid --#{type}. Value provided must represent a float. Received: #{inspect(value)}"}
    end
  end

  defp do_parse_coord(value, _) when is_float(value), do: {:ok, value}

  defp parse_custom_code(code, default) do
    case Integer.parse(code) do
      {int, ""} when int in 0..255 -> int
      _ -> default
    end
  end

  defp lookup_by_zip(zip, opts) do
    case Weather.API.fetch_location(%{zip: zip}, opts.appid) do
      {:ok, %Req.Response{status: 200} = resp} ->
        %{body: %{"lat" => latitude, "lon" => longitude, "name" => label_from_zip}} = resp

        {
          :ok,
          %__MODULE__{opts | latitude: latitude, longitude: longitude, label: label_from_zip}
        }

      {:ok, resp} ->
        {
          :error,
          """
          Unable to fetch location data for zip '#{zip}' (status: #{resp.status})

          Response from OpenWeatherMap:

          #{resp.body["message"]}
          """
        }

      {:error, exception} ->
        {:error,
         "Exception encountered when making a request to the OpenWeatherMap API\n\n#{inspect(exception)}"}
    end
  end
end

defimpl Inspect, for: Weather.Opts do
  @spec inspect(Weather.Opts.t(), Inspect.Opts.t()) :: Inspect.Algebra.t()
  def inspect(weather_opts, opts) do
    weather_opts
    |> redact_appid()
    |> Inspect.Any.inspect(opts)
  end

  defp redact_appid(%Weather.Opts{appid: nil} = weather_opts), do: weather_opts
  defp redact_appid(weather_opts), do: %Weather.Opts{weather_opts | appid: "<<REDACTED>>"}
end
