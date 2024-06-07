defmodule Weather.CLI do
  @moduledoc """
  A command-line interface for fetching weather data via the
  OpenWeatherMap API.
  """

  @switches [
    latitude: :float,
    longitude: :float,
    api_key: :string,
    units: :string,
    period: :string
  ]
  @aliases [t: :latitude, n: :longitude, a: :api_key, u: :units, p: :period]

  @doc """
  The main module function invoked by the escript.
  """
  def main(args) do
    weather_options(args)
    |> Weather.get()
  end

  defp weather_options(args) do
    OptionParser.parse(args, strict: @switches, aliases: @aliases)
    |> elem(0)
    |> Weather.Opts.new()
  end
end
