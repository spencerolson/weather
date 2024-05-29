import Config

config :weather,
  api_key: System.get_env("OPENWEATHER_API_KEY"),
  lat: System.get_env("MY_HOME_LAT"),
  lon: System.get_env("MY_HOME_LONG"),
  finch_config: [connect_options: [transport_opts: [cacertfile: "priv/cacerts.pem"]]]
