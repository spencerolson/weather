defmodule Weather.Report.Alerts do
  @moduledoc """
  Generates a report for any active alerts.
  """

  use Weather.Report

  alias Weather.Colors
  alias Weather.DateUtils

  @alerts_separator "\n\n"
  @title_separator "\n"
  @red_ansi_code 9

  @doc """
  Generate a report for any active alerts.
  """
  @impl Weather.Report
  def generate({report, body, opts}), do: add_alerts({report, body, opts})

  defp add_alerts(
         {report, %{"alerts" => alerts} = body, %Weather.Opts{hide_alerts: false} = opts}
       ) do
    alerts
    |> Enum.map_join(@alerts_separator, &alert_summary(&1, body, opts))
    |> then(&{[&1 | report], body, opts})
  end

  defp add_alerts(weather), do: weather

  defp alert_title(alert, body, opts) do
    title = String.upcase(alert["event"])
    starting = DateUtils.time_by_minute_with_day(alert["start"], body["timezone"], opts)
    ending = DateUtils.time_by_minute_with_day(alert["end"], body["timezone"], opts)
    decorate_title("#{title} (#{starting} - #{ending})", opts)
  end

  defp decorate_title(title, %Weather.Opts{colors: true}),
    do: Colors.colorize(title, @red_ansi_code)

  defp decorate_title(title, _), do: title

  defp alert_summary(alert, body, %Weather.Opts{alert_titles_only: true} = opts) do
    alert_title(alert, body, opts)
  end

  defp alert_summary(alert, body, opts) do
    alert_title(alert, body, opts) <> @title_separator <> alert["description"]
  end
end
