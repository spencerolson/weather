defmodule WeatherTest do
  use ExUnit.Case, async: true

  alias Fixtures.TestResponse.Success
  alias Fixtures.TestResponse.Unauthorized
  doctest Weather

  describe "get/1" do
    setup do
      %{
        opts: Weather.Opts.new(api_key: "123abc", latitude: 30.308689, longitude: -84.248528)
      }
    end

    test "gets weather data", context do
      Req.Test.expect(Weather.API, fn conn ->
        Plug.Conn.put_resp_header(conn, "content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Success.response()))
      end)

      assert {:ok, "76.33°F\nscattered clouds"} = Weather.get(context.opts)
    end

    test "handles unexpected responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        Plug.Conn.put_resp_header(conn, "content-type", "application/json")
        |> Plug.Conn.send_resp(401, :json.encode(Unauthorized.response()))
      end)

      message =
        "Unexpected Response :(\n\nStatus: 401\nMessage: %{\"cod\" => 401, \"message\" => \"Please note that using One Call 3.0 requires a separate subscription to the One Call by Call plan. Learn more here https://openweathermap.org/price. If you have a valid subscription to the One Call by Call plan, but still receive this error, then please see https://openweathermap.org/faq#error401 for more info.\"}"

      assert Weather.get(context.opts) == {:error, message}
    end

    @tag capture_log: true
    test "handles errors", context do
      Req.Test.expect(Weather.API, 4, &Req.Test.transport_error(&1, :econnrefused))

      assert Weather.get(context.opts) ==
               {:error, "Error :(\n\n%Req.TransportError{reason: :econnrefused}"}
    end

    @tag capture_log: true
    test "retries after errors", context do
      Req.Test.expect(Weather.API, 1, &Req.Test.transport_error(&1, :econnrefused))

      Req.Test.expect(
        Weather.API,
        fn conn ->
          Plug.Conn.put_resp_header(conn, "content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(Success.response()))
        end
      )

      assert {:ok, "76.33°F\nscattered clouds"} = Weather.get(context.opts)
    end
  end
end
