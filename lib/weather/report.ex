defmodule Weather.Report do
  @moduledoc """
  """

  @doc """
  Create a new `Weather.Report` struct, applying defaults where necessary.
  """
  # @spec new(Weather.Opts.t()) :: Weather.Opts.t()
  def generate(resp, opts) do
    {[], resp.body, opts}
    |> add_current_temp()
    |> add_description()
    |> add_alerts()
    |> aggregate_report()
  end

  defp add_current_temp({report, body, opts}) do
    %{"current" => %{"feels_like" => feels_like}} = body
    current_temp = "#{feels_like}°#{units(opts)}"

    {
      [current_temp | report],
      body,
      opts
    }
  end

  defp add_description({report, body, opts}) do
    %{"current" => %{"weather" => [%{"description" => description}]}} = body

    {
      [description | report],
      body,
      opts
    }
  end

  defp add_alerts({report, %{"alerts" => alerts} = body, opts}) do
    alerts_summary = alerts |> Enum.map(& &1["description"]) |> Enum.join(separator())

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
    |> Enum.join(separator())
  end

  defp units(%Weather.Opts{units: "imperial"}), do: "F"
  defp units(%Weather.Opts{units: "metric"}), do: "C"
  defp units(%Weather.Opts{units: "standard"}), do: "K"

  defp separator(), do: "\n\n"
end
