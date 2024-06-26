defmodule Weather.Report do
  @moduledoc """
  A module for generating weather reports.
  """

  alias Weather.Report.Alerts
  alias Weather.Report.Current

  @separator "\n"

  @doc """
  Create a new `Weather.Report` struct, applying defaults where necessary.
  """
  @spec generate(Req.Response.t(), Weather.Opts.t()) :: String.t()
  def generate(resp, opts) do
    {[], resp.body, opts}
    |> Current.generate()
    |> Alerts.generate()
    |> aggregate_report()
  end

  defp aggregate_report({report, _body, _opts}) do
    report
    |> Enum.reverse()
    |> Enum.join(@separator)
  end
end
