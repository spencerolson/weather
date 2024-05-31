defmodule Weather.CLI do
  @switches [latitude: :float, longitude: :float, appid: :string, units: :string]
  @aliases [t: :latitude, n: :longitude, i: :appid, u: :units]

  @moduledoc """
  Documentation for `Weather.CLI`.
  """

  @doc """
  Hello world.
  """
  def main(args) do
    case weather_options(args) |> Weather.API.fetch_weather() do
      {:ok, %Req.Response{status: 200} = resp} -> handle_success(resp)
      {:ok, %Req.Response{} = resp} -> handle_unexpected(resp)
      {:error, error} -> handle_error(error)
    end
  end

  defp weather_options(args) do
    {opts, _, _} = OptionParser.parse(args, strict: @switches, aliases: @aliases)
    struct(Weather.Opts, opts)
  end

  defp handle_success(%Req.Response{body: body}) do
    IO.puts("Weather: #{inspect(body)}")
  end

  defp handle_unexpected(%Req.Response{status: status, body: body}) do
    IO.puts("Unexpected Response :(\nStatus: #{status}\nMessage: #{body["message"]}")
  end

  defp handle_error(error) do
    IO.puts("Error :(\n#{inspect(error)}")
  end
end
