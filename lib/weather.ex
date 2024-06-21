defmodule Weather do
  @moduledoc """
  Get and display weather information.
  > ### API Key Needed {: .info}
  >
  > In order to use `Weather`, you'll need to create an account at [OpenWeatherMap](https://openweathermap.org/) and get an API key for the [One Call API 3.0](https://openweathermap.org/api/one-call-3) service.
  >
  > The service allows for 1,000 free API calls per day.
  """

  @doc """
  Fetch weather from the OpenWeatherMap API and handle the response.
  """
  @spec get(Weather.Opts.t()) ::
          {:ok, Req.Response.t()} | {:error, :unexpected_response} | {:error, :error}
  def get(opts) do
    opts
    |> Weather.API.fetch_weather()
    |> handle_response(opts)
  end

  defp handle_response({:ok, %Req.Response{status: 200} = resp}, opts) do
    Weather.Report.generate(resp, opts)
    |> IO.puts()

    {:ok, :success, body: resp.body}
  end

  defp handle_response({:ok, %Req.Response{} = resp}, _opts) do
    IO.puts("Unexpected Response :(\n\nStatus: #{resp.status}\nMessage: #{inspect(resp.body)}")
    {:error, :unexpected_response}
  end

  defp handle_response({:error, error}, _opts) do
    IO.puts("Error :(\n\n#{inspect(error)}")
    {:error, :error}
  end
end
