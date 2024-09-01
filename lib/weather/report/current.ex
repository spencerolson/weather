defmodule Weather.Report.Current do
  @moduledoc """
  Generates a report for the current weather.
  """

  use Weather.Report

  @doc """
  Generate a report for the current weather.
  """
  @impl Weather.Report
  def generate({report, body, opts}) do
    report
    |> add_current_weather(body, opts)
    |> then(&{&1, body, opts})
  end

  defp add_current_weather(report, body, opts) do
    []
    |> add_temp(body, opts)
    |> add_description(body)
    |> add_humidity(body)
    |> Enum.reverse()
    |> Enum.join(" | ")
    |> then(&[&1 | report])
  end

  defp add_temp(report, body, opts) do
    temp = temp(body, opts)
    ["#{round(temp)}°" | report]
  end

  defp temp(body, %Weather.Opts{feels_like: true}), do: get_in(body, ["current", "feels_like"])
  defp temp(body, _), do: get_in(body, ["current", "temp"])

  defp add_description(report, body) do
    %{"current" => %{"weather" => [%{"description" => description} | _]}} = body
    [description | report]
  end

  defp add_humidity(report, body) do
    %{"current" => %{"humidity" => humidity}} = body
    ["#{humidity}% humidity" | report]
  end
end
