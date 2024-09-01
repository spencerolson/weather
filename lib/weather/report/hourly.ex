defmodule Weather.Report.Hourly do
  @moduledoc """
  Generates an hourly report up to 48 hours, reporting every N hours (starting now, N defaulting to 3).
  """

  use Weather.Report

  alias Weather.Colors
  alias Weather.DateUtils

  @separator "\n"

  @doc """
  Generate an hourly temperature report.
  """
  @impl Weather.Report
  def generate({_, _, %Weather.Opts{hours: h, every_n_hours: e}} = weather)
      when 0 in [h, e] do
    weather
  end

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

    [temps <> @separator <> times | report]
  end

  defp add_to_time_and_temp_reports(data, {times, temps}, opts) do
    temp = display_temp(data, opts)
    time = "#{data[:time]}"

    {
      times <> time <> padding(temp, time),
      temps <> temp
    }
  end

  defp display_temp(%{arrow: ""} = data, %Weather.Opts{colors: true} = opts) do
    "#{Colors.colorize_temp(data[:temp], opts)}"
  end

  defp display_temp(%{arrow: ""} = data, _) do
    "#{data[:temp]}°"
  end

  defp display_temp(data, %Weather.Opts{colors: true} = opts) do
    "#{Colors.colorize_temp(data[:temp], opts)}  #{data[:arrow]}   "
  end

  defp display_temp(data, _), do: "#{data[:temp]}°  #{data[:arrow]}   "

  defp parse_data(body, opts) do
    body["hourly"]
    |> Enum.take_every(opts.every_n_hours)
    |> Enum.take(1 + div(opts.hours, opts.every_n_hours))
    |> Enum.chunk_every(2, 1, [:empty])
    |> Enum.map(&parse_hourly(&1, body["timezone"], opts))
  end

  defp parse_hourly([current_data, next_data], timezone, opts) do
    %{
      time: DateUtils.time_by_hour(current_data["dt"], timezone, opts),
      temp: temp(current_data, opts),
      arrow: arrow(current_data, next_data, opts)
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

  defp temp(data, opts) do
    opts
    |> temp_key()
    |> then(&Map.fetch!(data, &1))
    |> round()
  end

  defp temp_key(%Weather.Opts{feels_like: true}), do: "feels_like"
  defp temp_key(_), do: "temp"

  defp arrow(_, :empty, _), do: ""

  defp arrow(current_data, next_data, opts) do
    case temp(next_data, opts) - temp(current_data, opts) do
      diff when diff > 0 -> "⬆"
      diff when diff < 0 -> "⬇"
      _ -> "⮕"
    end
  end
end
