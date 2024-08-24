defmodule Weather.Report.Custom.FullMoon do
  @moduledoc """
  A custom `Weather.Report` that prints when there's a full moon.
  """

  use Weather.Report

  @full_moon_phase 0.5

  @doc """
  Generates a full moon report.
  """
  @impl Weather.Report
  def generate({report, %{"daily" => [%{"moon_phase" => @full_moon_phase} | _]} = body, opts}) do
    {
      ["🌝🌚 OMG FULL MOON TONIGHT 🌚🌝" | report],
      body,
      opts
    }
  end

  def generate(weather), do: weather
end
