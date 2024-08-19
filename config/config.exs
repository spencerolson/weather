import Config

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

if config_env() == :test do
  config :weather,
    req_options: [
      plug: {Req.Test, Weather.API}
    ]
end
