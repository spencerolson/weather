defmodule Weather.TestResponse.Unauthorized do
  @moduledoc false

  @spec response() :: map()
  def response do
    %{
      "cod" => 401,
      "message" =>
        "Please note that using One Call 3.0 requires a separate subscription to the One Call by Call plan. Learn more here https://openweathermap.org/price. If you have a valid subscription to the One Call by Call plan, but still receive this error, then please see https://openweathermap.org/faq#error401 for more info."
    }
  end
end
