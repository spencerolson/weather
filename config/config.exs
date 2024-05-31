import Config

lat = System.get_env("MY_HOME_LAT")
lon = System.get_env("MY_HOME_LONG")

config :weather,
  api_key: System.get_env("OPENWEATHER_API_KEY"),
  lat: lat && String.to_float(lat),
  lon: lon && String.to_float(lon),
  finch_config: [connect_options: [transport_opts: [cacertfile: "priv/cacerts.pem"]]]
