defmodule Weather.CLI do
  @moduledoc """
  A command-line interface for fetching weather data via the
  OpenWeatherMap API. This module is intended to be invoked as an escript.
  """

  @type args() :: [String.t()]

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

  @spec main(args()) :: term()
  def main(args) do
    args
    |> weather_options()
    |> Weather.get()
    |> elem(1)
    |> IO.puts()

    :ok
  end

  defp weather_options(args) do
    args
    |> OptionParser.parse(strict: @switches, aliases: @aliases)
    |> elem(0)
    |> Weather.Opts.new()
  end
end
