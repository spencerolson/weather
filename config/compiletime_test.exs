import Config

config :weather,
  req_options: [
    plug: {Req.Test, Weather.API}
  ]
