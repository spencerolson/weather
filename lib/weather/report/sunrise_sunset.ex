defmodule Weather.Report.SunriseSunset do
  @moduledoc """
  Generates a report showing sunrise and sunset times.
  """

  alias Weather.DateUtils

  @doc """
  Generates a sunrise and sunset report.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, %Weather.Opts{} = opts}) do
    %{
      "current" => %{"sunrise" => sunrise, "sunset" => sunset},
      "timezone" => timezone
    } = body

    rise = DateUtils.time_by_minute(sunrise, timezone, opts)
    set = DateUtils.time_by_minute(sunset, timezone, opts)
    {["🌞 #{rise} | 🌚 #{set}" | report], body, opts}
  end
end
