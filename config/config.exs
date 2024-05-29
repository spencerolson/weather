import Config

config :weather, api_key: System.get_env("OPENWEATHER_API_KEY")
