defmodule Weather.ComprehensiveReport do
  @moduledoc """
  Generates a comprehensive weather report composed of subreports.
  """

  alias Weather.Report.Alerts
  alias Weather.Report.Current
  alias Weather.Report.Hourly
  alias Weather.Report.RainHourly
  alias Weather.Report.RainMinutely
  alias Weather.Report.SunriseSunset

  @padding "\n"
  @separator "\n\n"

  @doc """
  Create a comprehensive weather report composed of subreports.
  """
  @spec generate(Req.Response.t(), Weather.Opts.t()) :: String.t()
  def generate(resp, %Weather.Opts{} = opts \\ Weather.Opts.new!()) do
    {[], resp.body, opts}
    |> Alerts.generate()
    |> Current.generate()
    |> Hourly.generate()
    |> SunriseSunset.generate()
    |> RainHourly.generate()
    |> RainMinutely.generate()
    |> add_label()
    |> generate_custom_reports()
    |> aggregate_report()
    |> add_padding()
  end

  defp add_label({report, body, %Weather.Opts{label: nil} = opts}),
    do: {report, body, opts}

  defp add_label({report, body, opts}) do
    {
      ["#{opts.label}" | report],
      body,
      opts
    }
  end

  defp aggregate_report({report, _body, _opts}), do: Enum.join(report, @separator)
  defp add_padding(report), do: @padding <> report <> @padding

  defp generate_custom_reports(weather) do
    :weather
    |> Application.get_env(:custom_reports, [])
    |> Enum.reduce(weather, fn report, acc -> report.generate(acc) end)
  end
end
