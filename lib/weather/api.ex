defmodule Weather.API do
  @moduledoc """
  Fetches weather data from the OpenWeatherMap API.
  """

  alias Weather.TestResponse.Clear
  alias Weather.TestResponse.Rain
  alias Weather.TestResponse.Storm

  @url "https://api.openweathermap.org/data/3.0/onecall"
  @zip_url "http://api.openweathermap.org/geo/1.0/zip"

  @doc """
  Fetches weather data from the OpenWeatherMap API.
  """
  @spec fetch_weather(Weather.Opts.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def fetch_weather(%Weather.Opts{test: nil} = opts) do
    set_req_default_options()

    [
      appid: opts.appid,
      lat: opts.latitude,
      lon: opts.longitude,
      units: opts.units
    ]
    |> req_opts(@url)
    |> Req.request()
  end

  def fetch_weather(%Weather.Opts{test: test}),
    do: {:ok, Req.Response.new(status: 200, body: fake_body(test))}

  @spec fetch_location(%{zip: String.t()}, String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def fetch_location(%{zip: zip}, appid) do
    set_req_default_options()

    [zip: zip, appid: appid]
    |> req_opts(@zip_url)
    |> Req.request()
  end

  defp set_req_default_options do
    :weather
    |> Application.get_env(:finch_config)
    |> Req.default_options()
  end

  defp fake_body("clear"), do: Clear.response()
  defp fake_body("rain"), do: Rain.response()
  defp fake_body("storm"), do: Storm.response()

  defp req_opts(params, url) do
    Keyword.merge(
      [base_url: url, params: params],
      Application.get_env(:weather, :req_options, [])
    )
  end
end
