defmodule Weather.Report.Alerts do
  @moduledoc """
  Generates a report for any active alerts.
  """

  alias Weather.Colors
  alias Weather.DateUtils

  @alerts_separator "\n\n"
  @title_separator "\n"
  @red_ansi_code 9

  @doc """
  Generate a report for any active alerts.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, %Weather.Opts{} = opts}), do: add_alerts({report, body, opts})

  defp add_alerts({report, %{"alerts" => alerts} = body, opts}) do
    alerts
    |> Enum.map_join(@alerts_separator, &alert_summary(&1, body, opts))
    |> then(&{[&1 | report], body, opts})
  end

  defp add_alerts(weather), do: weather

  defp alert_title(alert, body, opts) do
    title = String.upcase(alert["event"])
    starting = DateUtils.time_by_minute(alert["start"], body["timezone"], opts)
    ending = DateUtils.time_by_minute(alert["end"], body["timezone"], opts)
    decorate_title("#{title} (#{starting} - #{ending})", opts)
  end

  defp decorate_title(title, %Weather.Opts{colors: true}), do: Colors.colorize(title, @red_ansi_code)
  defp decorate_title(title, _), do: title

  defp alert_summary(alert, body, opts) do
    alert_title(alert, body, opts) <> @title_separator <> alert["description"]
  end
end
