defmodule WeatherTest do
  use ExUnit.Case, async: true

  alias Fixtures.TestResponse.Success
  alias Fixtures.TestResponse.Unauthorized
  doctest Weather

  describe "get/1" do
    setup do: %{opts: Weather.Opts.new([])}

    test "gets weather data", context do
      Req.Test.expect(Weather.API, fn conn ->
        Plug.Conn.put_resp_header(conn, "content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Success.response()))
      end)

      assert {:ok, :success, body: body} = Weather.get(context.opts)
      assert %{"current" => %{"feels_like" => 76.33}} = body
    end

    test "handles unexpected responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        Plug.Conn.put_resp_header(conn, "content-type", "application/json")
        |> Plug.Conn.send_resp(401, :json.encode(Unauthorized.response()))
      end)

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
          |> Plug.Conn.send_resp(200, :json.encode(Success.response()))
        end
      )

      assert {:ok, :success, body: body} = Weather.get(context.opts)
      assert %{"current" => %{"feels_like" => 76.33}} = body
    end
  end
end
