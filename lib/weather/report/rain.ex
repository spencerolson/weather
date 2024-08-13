defmodule Weather.Report.Rain do
  @moduledoc """
  Generates a chart showing rain intensity each minute for the next hour.
  """

  alias Weather.DateUtils

  @rain_indicator "."
  @datapoints_per_row 60

  @doc """
  Generates a rain report.
  """
  @spec generate({list(), map(), Weather.Opts.t()}) :: {list(), map(), Weather.Opts.t()}
  def generate({report, body, %Weather.Opts{} = opts}) do
    report
    |> add_rain_report(body, opts)
    |> then(&{&1, body, opts})
  end

  defp add_rain_report(report, body, opts) do
    if rain_forecasted?(body) do
      body
      |> build_report()
      |> make_pretty(body, opts)
      |> Enum.join("\n")
      |> then(&[&1, "" | report])
    else
      report
    end
  end

  defp rain_forecasted?(body) do
    Enum.any?(body["minutely"], fn minutely -> minutely["precipitation"] > 0 end)
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
    start_time =
      body["minutely"]
      |> hd()
      |> then(&DateUtils.time_by_minute(&1, body["timezone"], opts))

    end_time =
      body["minutely"]
      |> Enum.at(-1)
      |> then(&DateUtils.time_by_minute(&1, body["timezone"], opts))

    ["Rain (#{start_time} - #{end_time})", "" | report]
  end

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
