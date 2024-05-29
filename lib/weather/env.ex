defmodule Weather.ENV do
  def get(key) do
    Application.get_env(:weather, key)
  end
end
