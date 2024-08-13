defmodule Weather.Report do
  @moduledoc """
  Generates a comprehensive weather report composed of subreports.
  """

  alias Weather.Report.Alerts
  alias Weather.Report.Current
  alias Weather.Report.Hourly
  alias Weather.Report.Rain

  @separator "\n"

  @doc """
  Create a comprehensive weather report composed of subreports.
  """
  @spec generate(Req.Response.t(), Weather.Opts.t()) :: String.t()
  def generate(resp, opts) do
    {[], resp.body, opts}
    |> add_line()
    |> Alerts.generate()
    |> Current.generate()
    |> Hourly.generate()
    |> Rain.generate()
    |> add_line()
    |> aggregate_report()
  end

  defp add_line({report, body, opts}), do: {["" | report], body, opts}

  defp aggregate_report({report, _body, _opts}), do: Enum.join(report, @separator)
end
