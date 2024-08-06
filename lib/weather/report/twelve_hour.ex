defmodule Weather.Report.TwelveHour do
  @moduledoc """
  Generates a report for the next twelve hours, reporting every 3 hours (starting now).
  """

  @every_n_hours 3
  @num_datapoints 1 + div(12, @every_n_hours)

  @doc """
  Generate a twelve-hour report.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, opts}) do
    report
    |> add_twelve_hour_weather(body)
    |> then(&{&1, body, opts})
  end

  defp add_twelve_hour_weather(report, body) do
    {times, temps} =
      body
      |> parse_data()
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

  defp parse_data(body) do
    body["hourly"]
    |> Enum.take_every(@every_n_hours)
    |> Enum.take(@num_datapoints)
    |> Enum.chunk_every(2, 1, [:empty])
    |> Enum.map(&parse_hourly(&1, body["timezone"]))
  end

  defp parse_hourly([current_data, next_data], timezone) do
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
