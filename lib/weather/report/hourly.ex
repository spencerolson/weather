defmodule Weather.Report.Hourly do
  @moduledoc """
  Generates an hourly report up to 48 hours, reporting every N hours (starting now, N defaulting to 3).
  """

  alias Weather.Colors

  @doc """
  Generate an hourly report.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, opts}) do
    report
    |> add_hourly_weather(body, opts)
    |> then(&{&1, body, opts})
  end

  defp add_hourly_weather(report, body, opts) do
    {times, temps} =
      body
      |> parse_data(opts)
      |> Enum.reduce({"", ""}, fn data, acc -> add_to_time_and_temp_reports(data, acc, opts) end)

    [temps, times, "" | report]
  end

  defp add_to_time_and_temp_reports(data, {times, temps}, opts) do
    temp = display_temp(data, opts)
    time = " #{data[:time]}"

    {
      times <> time <> padding(temp, time),
      temps <> temp
    }
  end

  defp display_temp(data, %Weather.Opts{colors: true} = opts) do
    " #{Colors.colorize(data[:temp], opts)}  #{data[:arrow]}  "
  end

  defp display_temp(data, _), do: " #{data[:temp]}°  #{data[:arrow]}  "

  defp parse_data(body, opts) do
    body["hourly"]
    |> Enum.take_every(opts.every_n_hours)
    |> Enum.take(1 + div(opts.hours, opts.every_n_hours))
    |> Enum.chunk_every(2, 1, [:empty])
    |> Enum.map(&parse_hourly(&1, body["timezone"], opts))
  end

  defp parse_hourly([current_data, next_data], timezone, opts) do
    %{
      time: time(current_data, timezone, opts),
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

  defp time(data, timezone, opts) do
    format = if opts.twelve, do: "%-I%p", else: "%0H"

    data
    |> datetime(timezone)
    |> Calendar.strftime(format)
  end

  defp datetime(data, timezone) do
    without_zone = DateTime.from_unix!(data["dt"])

    case DateTime.shift_zone(without_zone, timezone) do
      {:ok, with_zone} -> with_zone
      {:error, _} -> without_zone
    end
  end
end
