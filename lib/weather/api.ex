defmodule Weather.API do
  alias Weather.ENV

  @url "https://api.openweathermap.org/data/3.0/onecall"

  def fetch_weather do
    Req.get!(@url, params: [appid: ENV.get(:api_key), lat: ENV.get(:lat), lon: ENV.get(:lon)])
  end
end
