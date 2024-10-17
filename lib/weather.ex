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
  def get(%Weather.Opts{} = opts \\ Weather.Opts.new!()) do
    opts
    |> Weather.API.fetch_weather()
    |> handle_response(opts)
  end

  @doc """
  Fetches weather from the OpenWeatherMap API. Raises a `RuntimeError` if any problems are encountered.
  """
  @spec get!(Weather.Opts.t()) :: String.t()
  def get!(%Weather.Opts{} = opts \\ Weather.Opts.new!()) do
    case get(opts) do
      {:ok, report} -> report
      {:error, error} -> raise RuntimeError, error
    end
  end

  defp handle_response({:ok, %Req.Response{status: 200} = resp}, opts) do
    {:ok, Weather.ComprehensiveReport.generate(resp, opts)}
  end

  defp handle_response({:ok, %Req.Response{status: 401} = resp}, _opts) do
    {
      :error,
      """
      Unauthorized (status 401)

      Are you sure you provided the correct API key?

      #{resp.body["message"]}
      """
    }
  end

  defp handle_response({:ok, %Req.Response{} = resp}, _opts) do
    {
      :error,
      """
      Unexpected response (status #{resp.status})

      #{resp.body["message"]}
      """
    }
  end

  defp handle_response({:error, error}, _opts) do
    {
      :error,
      """
      Error

      #{inspect(error)}
      """
    }
  end
end
