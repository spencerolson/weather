defmodule Weather.Report.Alerts do
  @moduledoc """
  Generates a report for any active alerts.
  """

  @separator "\n"

  @doc """
  Generate a report for any active alerts.
  """
  def generate({report, body, opts}) do
    {report, body, opts}
    |> add_alerts()
  end

  defp add_alerts({report, %{"alerts" => alerts} = body, opts}) do
    report = ["" | report]

    alerts_summary =
      alerts
      |> Enum.map(&alert_summary/1)
      |> Enum.join(@separator)

    {
      [alerts_summary | report],
      body,
      opts
    }
  end

  defp add_alerts(weather), do: weather

  defp alert_title(alert) do
    minutes =
      DateTime.from_unix!(alert["end"])
      |> DateTime.diff(date_impl().utc_now(), :minute)

    "#{String.upcase(alert["event"])} (#{minutes} minutes remaining)"
  end

  defp alert_summary(alert) do
    alert_title(alert) <> @separator <> alert["description"]
  end

  defp date_impl() do
    Application.get_env(:weather, :date_impl, DateTime)
  end
end
