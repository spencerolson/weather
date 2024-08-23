defmodule Weather.Report.RainHourly do
  @moduledoc """
  Generates a report showing which hours rain is forecasted (up to 24 hours).
  """

  use Weather.Report

  alias Weather.DateUtils

  @max_hours 24

  @doc """
  Generates a report showing which hours rain is forecasted (up to 24 hours).
  """
  @impl Weather.Report
  def generate({report, body, opts}) do
    body
    |> raining_streaks(opts)
    |> Enum.map(fn streak ->
      starting = DateUtils.time_by_hour(streak[:start], body["timezone"], opts)
      ending = DateUtils.time_by_hour(streak[:end], body["timezone"], opts)
      "#{starting} - #{ending}"
    end)
    |> add_to_report(report, body, opts)
  end

  defp add_to_report([], report, body, opts), do: {report, body, opts}

  defp add_to_report(rain_streaks, report, body, opts) do
    rain_report = "🌧️  " <> Enum.join(rain_streaks, ", ")
    {[rain_report | report], body, opts}
  end

  defp raining_streaks(body, opts) do
    body["hourly"]
    |> Enum.take(1 + min(opts.hours, @max_hours))
    |> Enum.reduce([], &process_hourly/2)
    |> Enum.reverse()
    |> Enum.filter(fn streak -> streak.raining and Map.has_key?(streak, :end) end)
  end

  defp process_hourly(data, []), do: [%{start: data["dt"], raining: Map.has_key?(data, "rain")}]

  defp process_hourly(data, acc) do
    data
    |> Map.has_key?("rain")
    |> process_streaks(data, acc)
  end

  defp process_streaks(raining, _, [%{raining: raining} | _] = acc), do: acc

  defp process_streaks(raining, data, acc) do
    [streak | rest] = acc
    %{"dt" => dt} = data
    completed_streak = Map.put(streak, :end, dt)
    new_streak = %{start: dt, raining: raining}

    [new_streak, completed_streak | rest]
  end
end
