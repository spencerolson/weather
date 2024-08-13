defmodule Weather do
  @moduledoc """
  Gets and displays weather information.
  > ### API Key Needed {: .info}
  >
  > In order to use `Weather`, you'll need to create an account at [OpenWeatherMap](https://openweathermap.org/) and get an API key for the [One Call API 3.0](https://openweathermap.org/api/one-call-3) service.
  >
  > The service allows for 1,000 free API calls per day.
  """

  @doc """
  Fetches weather from the OpenWeatherMap API.
  """
  @spec get(Weather.Opts.t()) ::
          {:ok, String.t()} | {:error, String.t()}
  def get(opts) do
    opts
    |> Weather.API.fetch_weather()
    |> handle_response(opts)
  end

  defp handle_response({:ok, %Req.Response{status: 200} = resp}, opts) do
    {:ok, Weather.Report.generate(resp, opts)}
  end

  defp handle_response({:ok, %Req.Response{status: 401} = resp}, _opts) do
    {:error,
     "Unauthorized (status 401)\n\nAre you sure you provided the correct API key?\n\n#{resp.body["message"]}"}
  end

  defp handle_response({:ok, %Req.Response{} = resp}, _opts) do
    {:error, "Unexpected response (status #{resp.status})\n\n#{resp.body["message"]}"}
  end

  defp handle_response({:error, error}, _opts) do
    {:error, "Error\n\n#{inspect(error)}"}
  end
end
