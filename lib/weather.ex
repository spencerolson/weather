defmodule Weather do
  @moduledoc """
  Documentation for `Weather`.
  """

  def get(%Weather.Opts{} = opts) do
    opts
    |> Weather.API.fetch_weather()
    |> handle_response()
  end

  defp handle_response({:ok, %Req.Response{status: 200} = resp}) do
    {:ok, :success, body: resp.body}
  end

  defp handle_response({:ok, %Req.Response{} = resp}) do
    IO.puts("Unexpected Response :(\n\nStatus: #{resp.status}\nMessage: #{inspect(resp.body)}")
    {:error, :unexpected_response}
  end

  defp handle_response({:error, error}) do
    IO.puts("Error :(\n\n#{inspect(error)}")
    {:error, :error}
  end
end
