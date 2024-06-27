defmodule Weather.Report do
  alias Weather.Report.Alerts
  alias Weather.Report.Current

  @moduledoc """
  A module for generating weather reports.
  """
  @separator "\n"

  @doc """
  Create a new `Weather.Report` struct, applying defaults where necessary.
  """
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
