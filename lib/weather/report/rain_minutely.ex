defmodule Weather.Report.RainMinutely do
  @moduledoc """
  Generates a chart showing rain intensity each minute for the next hour.
  """

  use Weather.Report

  alias Weather.DateUtils

  @rain_indicator "."
  @datapoints_per_row 60

  @doc """
  Generates a chart showing rain intensity each minute for the next hour.
  """
  @impl Weather.Report
  def generate({report, %{"minutely" => _} = body, opts}) do
    report
    |> add_rain_report(body, opts)
    |> then(&{&1, body, opts})
  end

  def generate(weather_report), do: weather_report

  defp add_rain_report(report, body, opts) do
    if rain_forecasted?(body) do
      body
      |> build_report()
      |> make_pretty(body, opts)
      |> Enum.join("\n")
      |> then(&[&1 | report])
    else
      report
    end
  end

  defp rain_forecasted?(body) do
    Enum.any?(body["minutely"], fn %{"precipitation" => mm_h} -> mm_h > 0 end)
  end

  defp build_report(body) do
    indicators =
      for {_, match_fn} <- intensity_levels(),
          minutely <- body["minutely"] do
        indicator(minutely["precipitation"], match_fn)
      end

    Enum.chunk_every(indicators, @datapoints_per_row)
  end

  defp indicator(mm_h, match_fn), do: if(match_fn.(mm_h), do: @rain_indicator, else: " ")

  defp intensity_levels do
    [
      violent: &(&1 >= 50),
      very_heavy: &(&1 >= 16),
      heavy: &(&1 >= 4),
      moderate: &(&1 >= 1),
      light: &(&1 >= 0.25),
      very_light: &(&1 > 0)
    ]
  end

  defp make_pretty(report, body, opts) do
    report
    |> add_borders()
    |> add_title(body, opts)
    |> add_15_min_markers()
  end

  defp add_borders(report) do
    Enum.map(report, fn row ->
      row
      |> then(&["[" | &1])
      |> Enum.reverse()
      |> then(&["]" | &1])
      |> Enum.reverse()
    end)
  end

  defp add_title(report, body, opts) do
    %{"minutely" => [%{"dt" => start_dt} | _], "timezone" => tz} = body
    [%{"dt" => end_dt} | _] = Enum.reverse(body["minutely"])

    start_time = DateUtils.time_by_minute(start_dt, tz, opts)
    end_time = DateUtils.time_by_minute(end_dt, tz, opts)

    "<< 🌧️  #{start_time} - #{end_time} >>"
    |> center(report)
    |> then(&[&1, "" | report])
  end

  defp center(str, [row | _]) do
    case length(row) - String.length(str) do
      diff when diff > 1 ->
        before_len = div(diff, 2)
        after_len = diff - before_len
        padding(before_len) <> str <> padding(after_len)

      _ ->
        str
    end
  end

  defp padding(length), do: String.duplicate(" ", length)

  defp add_15_min_markers(report) do
    markers =
      Enum.map(-1..60, fn n ->
        if n in [15, 30, 45], do: "+", else: " "
      end)

    report
    |> Enum.reverse()
    |> then(&[markers | &1])
    |> Enum.reverse()
  end
end
