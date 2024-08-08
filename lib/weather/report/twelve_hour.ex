defmodule Weather.Report.TwelveHour do
  @moduledoc """
  Generates a report for the next twelve hours, reporting every N hours (starting now, N defaulting to 3).
  """

  alias Weather.Colors

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
      |> Enum.reduce({"", ""}, fn data, acc -> add_to_time_and_temp_reports(data, acc, opts) end)

    [temps, times, "" | report]
  end

  defp add_to_time_and_temp_reports(data, {times, temps}, opts) do
    temp = " #{Colors.colorize(data[:temp], opts)}  #{data[:arrow]}  "
    time = " #{data[:time]}"

    {
      times <> time <> padding(temp, time),
      temps <> temp
    }
  end

  defp parse_data(body, opts) do
    body["hourly"]
    |> Enum.take_every(opts.every_n_hours)
    |> Enum.take(1 + div(12, opts.every_n_hours))
    |> Enum.chunk_every(2, 1, [:empty])
    |> Enum.map(&parse_hourly(&1, body["timezone"]))
  end

  defp parse_hourly([current_data, next_data], timezone) do
    %{
      time: time(current_data, timezone),
      temp: temp(current_data),
      arrow: arrow(current_data, next_data)
    }
  end

  defp padding(temp_str, time_str) do
    temp_length =
      temp_str
      |> Colors.remove_ansi()
      |> String.length()

    length = max(0, temp_length - String.length(time_str))
    String.duplicate(" ", length)
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
