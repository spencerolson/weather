defmodule Weather.TestResponse.BadRequest do
  @moduledoc false

  @spec response() :: map()
  def response, do: %{"cod" => 400, "message" => "wrong latitude"}
end
