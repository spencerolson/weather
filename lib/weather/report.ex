defmodule Weather.Report do
  @moduledoc """
  """

  @separator "\n"

  @doc """
  Create a new `Weather.Report` struct, applying defaults where necessary.
  """
  def generate(resp, opts) do
    {[], resp.body, opts}
    |> Weather.Report.Current.generate()
    |> add_alerts()
    |> aggregate_report()
  end

  defp add_alerts({report, %{"alerts" => alerts} = body, opts}) do
    report = ["" | report]

    alerts_summary =
      alerts
      |> Enum.map(fn alert ->
        String.upcase(alert["event"]) <>
          " (#{alert["start"]} - #{alert["end"]})" <>
          @separator <>
          alert["description"]
      end)
      |> Enum.join(@separator)

    {
      [alerts_summary | report],
      body,
      opts
    }
  end

  defp add_alerts(weather), do: weather

  defp aggregate_report({report, _body, _opts}) do
    report
    |> Enum.reverse()
    |> Enum.join(@separator)
  end
end
