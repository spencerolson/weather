defmodule Weather.Opts do
  alias Weather.ENV

  defstruct latitude: ENV.get(:lat),
            longitude: ENV.get(:lon),
            appid: ENV.get(:api_key),
            units: "imperial"
end
