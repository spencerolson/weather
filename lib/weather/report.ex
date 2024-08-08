defmodule Weather.Report do
  @moduledoc """
  A module for generating weather reports.
  """

  alias Weather.Report.Alerts
  alias Weather.Report.Current
  alias Weather.Report.Hourly

  @separator "\n"

  @doc """
  Create a new `Weather.Report` struct, applying defaults where necessary.
  """
  @spec generate(Req.Response.t(), Weather.Opts.t()) :: String.t()
  def generate(resp, opts) do
    {[], resp.body, opts}
    |> Alerts.generate()
    |> Current.generate()
    |> Hourly.generate()
    |> aggregate_report()
  end

  defp aggregate_report({report, _body, _opts}), do: Enum.join(report, @separator)
end
