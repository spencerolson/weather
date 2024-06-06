defmodule Weather do
  @moduledoc """
  Documentation for `Weather`.
  """

  def fetch, do: Weather.CLI.main([])
end
