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
    data =
      body["hourly"]
      |> Enum.take_every(@every_n_hours)
      |> Enum.take(@num_datapoints)
      |> Enum.chunk_every(2, 1, [:empty])
      |> Enum.map(&parse_hourly/1)

    temps = Enum.map_join(data, &"#{&1[:temp]}#{&1[:arrow]}")

    ["", temps | report]
  end

  defp parse_hourly([current_data, next_data]) do
    %{
      time: DateTime.from_unix!(current_data["dt"]).hour,
      temp: "#{temp(current_data)}°",
      arrow: arrow(current_data, next_data)
    }
  end

  defp temp(data), do: round(data["temp"])

  defp arrow(_, :empty), do: ""

  defp arrow(current_data, next_data) do
    case temp(next_data) - temp(current_data) do
      diff when diff > 0 -> " ↑ "
      diff when diff < 0 -> " ↓ "
      _ -> " → "
    end
  end
end
