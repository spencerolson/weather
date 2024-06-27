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
    |> DateTime.diff(date_impl().utc_now(), :minute)
    |> then(&"#{String.upcase(alert["event"])} (#{&1} minutes remaining)")
  end

  defp alert_summary(alert) do
    alert_title(alert) <> @separator <> alert["description"]
  end

  defp date_impl, do: Application.get_env(:weather, :date_impl, DateTime)
end
