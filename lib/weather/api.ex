defmodule Weather.API do
  @moduledoc """
  Fetches weather data from the OpenWeatherMap API.
  """

  alias Weather.Fixtures.TestResponse.Clear
  alias Weather.Fixtures.TestResponse.Storm

  @url "https://api.openweathermap.org/data/3.0/onecall"

  @doc """
  Fetches weather data from the OpenWeatherMap API.
  """
  @spec fetch_weather(Weather.Opts.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def fetch_weather(%Weather.Opts{test: nil} = opts) do
    :weather
    |> Application.get_env(:finch_config)
    |> Req.default_options()

    opts
    |> req_opts()
    |> Req.request()
  end

  def fetch_weather(%Weather.Opts{test: test}),
    do: {:ok, Req.Response.new(status: 200, body: fake_body(test))}

  defp fake_body("clear"), do: Clear.response()
  defp fake_body("storm"), do: Storm.response()

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
