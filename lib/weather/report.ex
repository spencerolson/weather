defmodule Weather.Report do
  @moduledoc """
  Generates a comprehensive weather report composed of subreports.
  """

  alias Weather.Report.Alerts
  alias Weather.Report.Current
  alias Weather.Report.Hourly
  alias Weather.Report.Rain

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
    |> Rain.generate()
    |> aggregate_report()
    |> add_padding()
  end

  defp aggregate_report({report, _body, _opts}), do: Enum.join(report, @separator)
  defp add_padding(report), do: @padding <> report <> @padding
end
