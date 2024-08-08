defmodule Weather.Report.TwelveHour do
  @moduledoc """
  Generates a report for the next twelve hours, reporting every N hours (starting now, N defaulting to 3).
  """

  @hours 12

  @doc """
  Generate a twelve-hour report.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, opts}) do
    report
    |> add_twelve_hour_weather(body, opts)
    |> then(&{&1, body, opts})
  end

  defp add_twelve_hour_weather(report, body, opts) do
    {times, temps} =
      body
      |> parse_data(opts)
      |> Enum.reduce({"", ""}, &add_to_time_and_temp_reports/2)

    [temps, times, "" | report]
  end

  defp add_to_time_and_temp_reports(data, {times, temps}) do
    temp = " #{data[:temp]}  #{data[:arrow]}  "
    time = " #{data[:time]}"
    padding_length = max(0, String.length(temp) - String.length(time))
    padding = String.duplicate(" ", padding_length)

    {
      times <> time <> padding,
      temps <> temp
    }
  end

  defp parse_data(body, opts) do
    for index <- 0..@hours, rem(index, opts.every_n_hours) == 0 do
      current = Enum.at(body["hourly"], index)
      next = next_element(index, body, opts)
      parse_hourly(current, next, body["timezone"])
    end
  end

  defp next_element(index, _, %Weather.Opts{every_n_hours: n}) when index + n > @hours do
    :empty
  end

  defp next_element(index, body, opts) do
    Enum.at(body["hourly"], index + opts.every_n_hours)
  end

  defp parse_hourly(current_data, next_data, timezone) do
    %{
      time: time(current_data, timezone),
      temp: "#{temp(current_data)}°",
      arrow: arrow(current_data, next_data)
    }
  end

  defp temp(data), do: round(data["temp"])

  defp arrow(_, :empty), do: ""

  defp arrow(current_data, next_data) do
    case temp(next_data) - temp(current_data) do
      diff when diff > 0 -> "⬆"
      diff when diff < 0 -> "⬇"
      _ -> "⮕"
    end
  end

  defp time(data, timezone) do
    data
    |> datetime(timezone)
    |> Calendar.strftime("%-I%p")
  end

  defp datetime(data, timezone) do
    without_zone = DateTime.from_unix!(data["dt"])

    case DateTime.shift_zone(without_zone, timezone) do
      {:ok, with_zone} -> with_zone
      {:error, _} -> without_zone
    end
  end
end
