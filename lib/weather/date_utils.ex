defmodule Weather.DateUtils do
  @moduledoc """
  Provides date display utilities.
  """

  @doc """
  Returns the time specific to the hour, displayed in 12-hour or 24-hour format.
  """
  @spec time_by_hour(integer(), String.t(), Weather.Opts.t()) :: String.t()
  def time_by_hour(unix_time, timezone, %Weather.Opts{twelve: true}) when is_integer(unix_time) do
    time(unix_time, timezone, "%-I%p")
  end

  def time_by_hour(unix_time, timezone, _) when is_integer(unix_time) do
    time(unix_time, timezone, "%0H")
  end

  @doc """
  Returns the time specific to the minute, displayed in 12-hour or 24-hour format.
  """
  @spec time_by_minute(integer(), String.t(), Weather.Opts.t()) :: String.t()
  def time_by_minute(unix_time, timezone, %Weather.Opts{twelve: true} = _opts)
      when is_integer(unix_time) do
    time(unix_time, timezone, "%-I:%0M%p")
  end

  def time_by_minute(unix_time, timezone, _) when is_integer(unix_time) do
    time(unix_time, timezone, "%0H:%0M")
  end

  @doc """
  Returns the time specific to the minute, displayed in 12-hour or 24-hour format, with the day.
  """
  @spec time_by_minute_with_day(integer(), String.t(), Weather.Opts.t()) :: String.t()
  def time_by_minute_with_day(unix_time, timezone, %Weather.Opts{twelve: true} = _opts)
      when is_integer(unix_time) do
    time(unix_time, timezone, "%a %-I:%0M%p")
  end

  def time_by_minute_with_day(unix_time, timezone, _) when is_integer(unix_time) do
    time(unix_time, timezone, "%a %0H:%0M")
  end

  defp time(unix_time, timezone, format) do
    unix_time
    |> datetime(timezone)
    |> Calendar.strftime(format)
  end

  defp datetime(unix_time, timezone) do
    without_zone = DateTime.from_unix!(unix_time)

    case DateTime.shift_zone(without_zone, timezone) do
      {:ok, with_zone} -> with_zone
      {:error, _} -> without_zone
    end
  end
end
