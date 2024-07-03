defmodule Weather.Report.Alerts do
  @moduledoc """
  Generates a report for any active alerts.
  """

  @separator "\n"

  @doc """
  Generate a report for any active alerts.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate(weather), do: add_alerts(weather)

  defp add_alerts({report, %{"alerts" => alerts} = body, opts}) do
    report = ["" | report]
    alerts_summary = Enum.map_join(alerts, @separator, &alert_summary/1)

    {
      [alerts_summary | report],
      body,
      opts
    }
  end

  defp add_alerts(weather), do: weather

  defp alert_title(alert) do
    alert["end"]
    |> DateTime.from_unix!()
    |> DateTime.diff(DateTime.utc_now(), :minute)
    |> then(&"#{String.upcase(alert["event"])} (#{time_remaining(&1)} remaining)")
  end

  defp alert_summary(alert) do
    alert_title(alert) <> @separator <> alert["description"]
  end

  defp time_remaining(minutes) do
    minutes
    |> calc_time_remaining([])
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  defp calc_time_remaining(0, []), do: ["0m"]

  defp calc_time_remaining(0, result), do: result

  defp calc_time_remaining(minutes, result) when minutes < 60, do: ["#{minutes}m" | result]

  defp calc_time_remaining(minutes, result) when minutes >= 60 and minutes < 1440 do
    hours = div(minutes, 60)

    calc_time_remaining(
      rem(minutes, 60),
      ["#{hours}h" | result]
    )
  end

  defp calc_time_remaining(minutes, result) when minutes >= 1440 do
    days = div(minutes, 1440)

    calc_time_remaining(
      rem(minutes, 1440),
      ["#{days}d" | result]
    )
  end
end
