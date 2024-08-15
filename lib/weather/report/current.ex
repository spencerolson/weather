defmodule Weather.Report.Current do
  @moduledoc """
  Generates a report for the current weather.
  """

  @doc """
  Generate a report for the current weather.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, %Weather.Opts{} = opts}) do
    report
    |> add_current_weather(body)
    |> then(&{&1, body, opts})
  end

  defp add_current_weather(report, body) do
    []
    |> add_temp(body)
    |> add_description(body)
    |> add_humidity(body)
    |> Enum.reverse()
    |> Enum.join(" | ")
    |> then(&[&1 | report])
  end

  defp add_temp(report, body) do
    %{"current" => %{"temp" => temp}} = body

    ["#{round(temp)}°" | report]
  end

  defp add_description(report, body) do
    %{"current" => %{"weather" => [%{"description" => description} | _]}} = body
    [description | report]
  end

  defp add_humidity(report, body) do
    %{"current" => %{"humidity" => humidity}} = body
    ["#{humidity}% humidity" | report]
  end
end
