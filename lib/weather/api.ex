defmodule Weather.API do
  @moduledoc """
  A module for fetching weather data from the OpenWeatherMap API.
  """

  @url "https://api.openweathermap.org/data/3.0/onecall"

  def fetch_weather(%Weather.Opts{} = opts) do
    Req.default_options(Application.get_env(:weather, :finch_config))
    req_opts(opts) |> Req.request()
  end

  defp req_opts(opts) do
    [base_url: @url, params: params(opts)]
    |> Keyword.merge(Application.get_env(:weather, :req_options, []))
  end

  defp params(opts) do
    [
      appid: opts.appid,
      lat: opts.latitude,
      lon: opts.longitude,
      units: opts.units
    ]
  end
end
