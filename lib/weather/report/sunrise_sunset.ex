defmodule Weather.Report.SunriseSunset do
  @moduledoc """
  Generates a report showing sunrise and sunset times.
  """

  use Weather.Report

  alias Weather.DateUtils

  @doc """
  Generates a sunrise and sunset report.
  """

  @impl Weather.Report
  def generate({report, body, opts}) do
    %{
      "current" => %{"sunrise" => sunrise, "sunset" => sunset},
      "timezone" => timezone
    } = body

    rise = DateUtils.time_by_minute(sunrise, timezone, opts)
    set = DateUtils.time_by_minute(sunset, timezone, opts)
    {["🌞 #{rise} | 🌚 #{set}" | report], body, opts}
  end
end
