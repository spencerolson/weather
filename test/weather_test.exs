defmodule WeatherTest do
  use ExUnit.Case, async: true
  doctest Weather

  describe "fetch/0" do
    test "fetches weather data" do
      Req.Test.expect(
        Weather.API,
        fn conn ->
          Plug.Conn.put_resp_header(conn, "content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(%{foo: "bar"}))
        end
      )

      assert Weather.fetch() == {:ok, :success, body: %{"foo" => "bar"}}
    end

    test "handles unexpected responses" do
      Req.Test.expect(Weather.API, &Plug.Conn.send_resp(&1, 401, "unauthorized"))
      assert Weather.fetch() == {:error, :unexpected_response}
    end

    test "handles errors" do
      Req.Test.expect(Weather.API, 4, &Req.Test.transport_error(&1, :econnrefused))
      assert Weather.fetch() == {:error, :error}
    end

    test "retries after errors" do
      Req.Test.expect(Weather.API, 1, &Req.Test.transport_error(&1, :econnrefused))

      Req.Test.expect(
        Weather.API,
        fn conn ->
          Plug.Conn.put_resp_header(conn, "content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(%{foo: "bar"}))
        end
      )

      assert Weather.fetch() == {:ok, :success, body: %{"foo" => "bar"}}
    end
  end
end
