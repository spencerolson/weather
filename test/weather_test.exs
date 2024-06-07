defmodule WeatherTest do
  use ExUnit.Case, async: true
  doctest Weather

  describe "get/1" do
    setup do: %{opts: Weather.Opts.new([])}

    test "gets weather data", context do
      Req.Test.expect(
        Weather.API,
        fn conn ->
          Plug.Conn.put_resp_header(conn, "content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(%{foo: "bar"}))
        end
      )

      assert Weather.get(context.opts) == {:ok, :success, body: %{"foo" => "bar"}}
    end

    test "handles unexpected responses", context do
      Req.Test.expect(Weather.API, &Plug.Conn.send_resp(&1, 401, "unauthorized"))

      assert Weather.get(context.opts) == {:error, :unexpected_response}
    end

    @tag capture_log: true
    test "handles errors", context do
      Req.Test.expect(Weather.API, 4, &Req.Test.transport_error(&1, :econnrefused))

      assert Weather.get(context.opts) == {:error, :error}
    end

    @tag capture_log: true
    test "retries after errors", context do
      Req.Test.expect(Weather.API, 1, &Req.Test.transport_error(&1, :econnrefused))

      Req.Test.expect(
        Weather.API,
        fn conn ->
          Plug.Conn.put_resp_header(conn, "content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(%{foo: "bar"}))
        end
      )

      assert Weather.get(context.opts) == {:ok, :success, body: %{"foo" => "bar"}}
    end
  end
end
