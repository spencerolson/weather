defmodule WeatherTest do
  use ExUnit.Case, async: true

  alias Weather.Fixtures.TestResponse.Success
  alias Weather.Fixtures.TestResponse.Unauthorized
  doctest Weather

  describe "get/1" do
    setup do
      %{
        opts: Weather.Opts.new(api_key: "123abc", latitude: 30.308689, longitude: -84.248528)
      }
    end

    test "gets weather data", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Success.response()))
      end)

      assert {:ok, "76.33°F\nscattered clouds"} = Weather.get(context.opts)
    end

    test "displays alerts", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Success.response(alerts: true)))
      end)

      expected =
        "76.33°F\nscattered clouds\n\nSEVERE THUNDERSTORM WATCH (59 minutes remaining)\nTHE NATIONAL WEATHER SERVICE HAS ISSUED SEVERE THUNDERSTORM WATCH\n408 IN EFFECT UNTIL 8 PM CDT /9 PM EDT/ THIS EVENING FOR THE\nFOLLOWING AREAS\n\nIN ILLINOIS THIS WATCH INCLUDES 13 COUNTIES\n\nIN CENTRAL ILLINOIS\n\nLIVINGSTON\n\nIN EAST CENTRAL ILLINOIS\n\nFORD                  IROQUOIS\n\nIN NORTH CENTRAL ILLINOIS\n\nDE KALB               LA SALLE              LEE\n\nIN NORTHEAST ILLINOIS\n\nCOOK                  DUPAGE                GRUNDY\nKANE                  KANKAKEE              KENDALL\nWILL\n\nIN INDIANA THIS WATCH INCLUDES 5 COUNTIES\n\nIN NORTHWEST INDIANA\n\nBENTON                JASPER                LAKE IN\nNEWTON                PORTER\n\nTHIS INCLUDES THE CITIES OF AURORA, BOLINGBROOK, BOURBONNAIS,\nCAROL STREAM, CHESTERTON, CHICAGO, COAL CITY, DEKALB, DEMOTTE,\nDIXON, DOWNERS GROVE, DWIGHT, ELGIN, EVANSTON, FAIRBURY, FOWLER,\nGARY, GIBSON CITY, GILMAN, HAMMOND, JOLIET, KANKAKEE, KENTLAND,\nLA SALLE, LEMONT, LOMBARD, MARSEILLES, MENDOTA, MERRILLVILLE,\nMINOOKA, MOROCCO, MORRIS, NAPERVILLE, OAK LAWN, ORLAND PARK,\nOSWEGO, OTTAWA, OXFORD, PARK FOREST, PAXTON, PLANO, PONTIAC,\nPORTAGE, RENSSELAER, ROSELAWN, SCHAUMBURG, STREATOR, SYCAMORE,\nVALPARAISO, WATSEKA, WHEATON, WILMINGTON, AND YORKVILLE."

      assert {:ok, ^expected} = Weather.get(context.opts)
    end

    test "handles unexpected responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
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
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(Success.response()))
        end
      )

      assert {:ok, "76.33°F\nscattered clouds"} = Weather.get(context.opts)
    end
  end
end
