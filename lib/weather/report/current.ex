defmodule Weather.Report.Current do
  @moduledoc """
  Generates a report for the current weather.
  """

  @doc """
  Generate a report for the current weather.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, opts}) do
    report
    |> add_current_temp(body)
    |> add_description(body)
    |> then(&{&1, body, opts})
  end

  defp add_current_temp(report, body) do
    %{"current" => %{"feels_like" => feels_like}} = body
    ["#{feels_like}°" | report]
  end

  defp add_description(report, body) do
    %{"current" => %{"weather" => [%{"description" => description}]}} = body
    [description | report]
  end
end
