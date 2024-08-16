defmodule Weather.Report do
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
  def generate(resp, %Weather.Opts{} = opts \\ Weather.Opts.new()) do
    {[], resp.body, opts}
    |> Alerts.generate()
    |> Current.generate()
    |> Hourly.generate()
    |> SunriseSunset.generate()
    |> RainHourly.generate()
    |> RainMinutely.generate()
    |> add_location_name()
    |> aggregate_report()
    |> add_padding()
  end

  defp add_location_name({report, body, %Weather.Opts{location_name: nil} = opts}),
    do: {report, body, opts}

  defp add_location_name({report, body, opts}) do
    {
      ["#{opts.location_name}" | report],
      body,
      opts
    }
  end

  defp aggregate_report({report, _body, _opts}), do: Enum.join(report, @separator)
  defp add_padding(report), do: @padding <> report <> @padding
end
