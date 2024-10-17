defmodule Weather.Report do
  @moduledoc """
  A behaviour module for implementing weather reports.
  """

  @callback generate({list(String.t()), map(), Weather.Opts.t()}) ::
              {list(), map(), Weather.Opts.t()}

  defmacro __using__(_) do
    quote do
      @behaviour Weather.Report

      @doc false
      def generate({report, body}), do: generate({report, body, Weather.Opts.new!()})
    end
  end
end
