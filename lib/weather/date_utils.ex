defmodule Weather.DateUtils do
  @moduledoc """
  Provides date display utilities.
  """

  @doc """
  Returns the time specific to the hour, displayed in 12-hour or 24-hour format.
  """
  @spec time_by_hour(map(), String.t(), Weather.Opts.t()) :: String.t()
  def time_by_hour(data, timezone, %Weather.Opts{twelve: true}), do: time(data, timezone, "%-I%p")
  def time_by_hour(data, timezone, _), do: time(data, timezone, "%0H")

  @doc """
  Returns the time specific to the minute, displayed in 12-hour or 24-hour format.
  """
  @spec time_by_minute(map(), String.t(), Weather.Opts.t()) :: String.t()
  def time_by_minute(data, timezone, %Weather.Opts{twelve: true}),
    do: time(data, timezone, "%-I:%0M%p")

  def time_by_minute(data, timezone, _), do: time(data, timezone, "%0H:%0M")

  defp time(data, timezone, format) do
    data
    |> datetime(timezone)
    |> Calendar.strftime(format)
  end

  defp datetime(data, timezone) do
    without_zone = DateTime.from_unix!(data["dt"])

    case DateTime.shift_zone(without_zone, timezone) do
      {:ok, with_zone} -> with_zone
      {:error, _} -> without_zone
    end
  end
end
