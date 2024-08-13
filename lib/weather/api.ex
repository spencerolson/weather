defmodule Weather.API do
  @moduledoc """
  Fetches weather data from the OpenWeatherMap API.
  """

  @url "https://api.openweathermap.org/data/3.0/onecall"

  @doc """
  Fetches weather data from the OpenWeatherMap API.
  """
  @spec fetch_weather(Weather.Opts.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def fetch_weather(%Weather.Opts{} = opts) do
    :weather
    |> Application.get_env(:finch_config)
    |> Req.default_options()

    opts
    |> req_opts()
    |> Req.request()
  end

  defp req_opts(opts) do
    Keyword.merge(
      [base_url: @url, params: params(opts)],
      Application.get_env(:weather, :req_options, [])
    )
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
