defmodule Weather.API do
  alias Weather.ENV

  @url "https://api.openweathermap.org/data/3.0/onecall"

  def fetch_weather(%Weather.Opts{} = opts) do
    Req.default_options(ENV.get(:finch_config))
    Req.get(@url, params: params(opts))
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
