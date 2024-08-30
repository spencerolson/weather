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
    |> Enum.with_index()
    |> Enum.reduce([], fn hourly, acc -> process_hourly(hourly, body, acc) end)
    |> Enum.reverse()
    |> Enum.filter(fn streak -> streak.raining and Map.has_key?(streak, :end) end)
  end

  defp process_hourly({data, idx}, body, []),
    do: [%{start: data["dt"], raining: raining?(data, body, idx)}]

  defp process_hourly({data, idx}, body, acc) do
    data
    |> raining?(body, idx)
    |> process_streaks(data, acc)
  end

  defp raining?(data, body, 0), do: raining?(data, body, 1) and rain_before_next_hour?(body)

  defp raining?(data, _, _), do: Map.has_key?(data, "rain")

  defp rain_before_next_hour?(%{"current" => current, "minutely" => minutely}) do
    current_dt = current["dt"]
    current_hour = DateTime.from_unix!(current_dt).hour

    Enum.any?(minutely, fn data ->
      data["precipitation"] > 0 and
        data["dt"] >= current_dt and
        DateTime.from_unix!(data["dt"]).hour == current_hour
    end)
  end

  # minutely data isn't available. let's just assume it's raining since hourly weather
  # indicates it's going to be raining during this hour.
  defp rain_before_next_hour?(_), do: true

  defp process_streaks(raining, _, [%{raining: raining} | _] = acc), do: acc

  defp process_streaks(raining, data, acc) do
    [streak | rest] = acc
    %{"dt" => dt} = data
    completed_streak = Map.put(streak, :end, dt)
    new_streak = %{start: dt, raining: raining}

    [new_streak, completed_streak | rest]
  end
end
