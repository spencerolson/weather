import Config

config :weather,
  finch_config: [
    connect_options: [transport_opts: [cacertfile: "#{__DIR__}/../priv/cacerts.pem"]]
  ]

config :elixir, :time_zone_database, Tz.TimeZoneDatabase
