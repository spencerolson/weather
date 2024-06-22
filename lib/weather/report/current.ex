defmodule Weather.Report.Current do
  @moduledoc """
  Generates a report for the current weather.
  """

  @doc """
  Generate a report for the current weather.
  """
  def generate({report, body, opts}) do
    {report, body, opts}
    |> add_current_temp()
    |> add_description()
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

  defp units(opts) do
    case opts.units do
      "imperial" -> "F"
      "metric" -> "C"
      "standard" -> "K"
    end
  end

  defp add_description({report, body, opts}) do
    %{"current" => %{"weather" => [%{"description" => description}]}} = body

    {
      [description | report],
      body,
      opts
    }
  end
end
