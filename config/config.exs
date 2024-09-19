import Config

if config_env() == :test do
  config :weather,
    req_options: [
      plug: {Req.Test, Weather.API}
    ]
end

# config :weather, custom_reports: [
#   Weather.Report.Custom.FullMoon
# ]
