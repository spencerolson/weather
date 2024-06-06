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
    opts = weather_options(args)

    case Weather.API.fetch_weather(opts) do
      {:ok, %Req.Response{status: 200} = resp} -> handle_success(resp, opts)
      {:ok, %Req.Response{} = resp} -> handle_unexpected(resp)
      {:error, error} -> handle_error(error)
    end
  end

  defp weather_options(args) do
    {opts, _, _} = OptionParser.parse(args, strict: @switches, aliases: @aliases)
    Weather.Opts.new(opts)
  end

  defp handle_success(%Req.Response{body: body}, %Weather.Opts{} = _opts) do
    {:ok, :success, body: body}
  end

  defp handle_unexpected(%Req.Response{status: status, body: body}) do
    IO.puts("Unexpected Response :(\nStatus: #{status}\nMessage: #{inspect(body)}")
    {:error, :unexpected_response}
  end

  defp handle_error(error) do
    IO.puts("Error :(\n#{inspect(error)}")
    {:error, :error}
  end
end
