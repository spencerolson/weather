defmodule WeatherTest do
  @moduledoc nodoc: true
  use ExUnit.Case, async: true
  use Mimic

  alias Weather.Fixtures.TestResponse.BadRequest
  alias Weather.Fixtures.TestResponse.Clear
  alias Weather.Fixtures.TestResponse.Storm
  alias Weather.Fixtures.TestResponse.Unauthorized
  doctest Weather

  describe "get/1" do
    setup do
      %{
        opts:
          Weather.Opts.new(
            api_key: "123abc",
            latitude: 30.308689,
            longitude: -84.248528,
            colors: false
          )
      }
    end

    test "gets weather data", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {:ok,
              "\n76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°     \n3PM      6PM      9PM      12AM     3AM     \n\n77° | scattered clouds | 37% humidity\n"} =
               Weather.get(context.opts)
    end

    test "accepts an optional length for the hourly report", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {
               :ok,
               "\n76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°  ⮕   58°  ⬆   67°  ⬆   69°  ⬇   65°     \n3PM      6PM      9PM      12AM     3AM      6AM      9AM      12PM     3PM     \n\n77° | scattered clouds | 37% humidity\n"
             } = Weather.get(%Weather.Opts{context.opts | hours: 24})
    end

    test "accepts an optional interval for the hourly report", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {:ok,
              "\n76°  ⬇   64°  ⬇   58°     \n3PM      9PM      3AM     \n\n77° | scattered clouds | 37% humidity\n"} =
               Weather.get(%Weather.Opts{context.opts | every_n_hours: 6})
    end

    test "supports 24-hour format", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {:ok,
              "\n76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°     \n15       18       21       00       03      \n\n77° | scattered clouds | 37% humidity\n"} =
               Weather.get(%Weather.Opts{context.opts | twelve: false})
    end

    test "displays minutely rain and alerts", context do
      stub(
        DateTime,
        :utc_now,
        fn -> DateTime.new!(~D[2024-07-03], ~T[00:26:08.003]) end
      )

      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Storm.response()))
      end)

      assert {
               :ok,
               "\nRain (8:28PM - 9:27PM)\n\n[                                                            ]\n[.........       ...............     ........................]\n[............................................................]\n[............................................................]\n[............................................................]\n[............................................................]\n                +              +              +               \n\n77°  ⬇   73°  ⬇   70°  ⬇   68°  ⬆   72°     \n8PM      11PM     2AM      5AM      8AM     \n\n77° | very heavy rain | 76% humidity\nFLOOD WATCH (11h 33m remaining)\n* WHAT...Flash flooding caused by excessive rainfall is possible.\n\n* WHERE...Portions of Kansas, including the following areas,\nAtchison KS, Doniphan, Johnson KS, Leavenworth, Miami and\nWyandotte and Missouri, including the following areas, Adair,\nAndrew, Buchanan, Caldwell, Carroll, Cass, Chariton, Clay,\nClinton, Daviess, De Kalb, Gentry, Grundy, Harrison, Jackson,\nJohnson MO, Lafayette, Linn MO, Livingston, Macon, Mercer,\nNodaway, Platte, Putnam, Ray, Saline, Schuyler, Sullivan and Worth.\n\n* WHEN...From 5 PM CDT this afternoon through Wednesday morning.\n\n* IMPACTS...Excessive runoff may result in flooding of rivers,\ncreeks, streams, and other low-lying and flood-prone locations.\nCreeks and streams may rise out of their banks. Low-water\ncrossings may be flooded. Area creeks and streams are running high\nand could flood with more heavy rain.\n\n* ADDITIONAL DETAILS...\n- Forecast rainfall with thunderstorms this afternoon and\nevening.\n- http://www.weather.gov/safety/flood\nTORNADO WATCH (1h 33m remaining)\nTORNADO WATCH 497 REMAINS VALID UNTIL 9 PM CDT THIS EVENING FOR\nTHE FOLLOWING AREAS\n\nIN MISSOURI THIS WATCH INCLUDES 4 COUNTIES\n\nIN NORTH CENTRAL MISSOURI\n\nPUTNAM                SULLIVAN\n\nIN NORTHEAST MISSOURI\n\nADAIR                 SCHUYLER\n\nTHIS INCLUDES THE CITIES OF DOWNING, GLENWOOD, GREEN CITY,\nGREENTOP, KIRKSVILLE, LANCASTER, MILAN, QUEEN CITY,\nAND UNIONVILLE.\nSEVERE THUNDERSTORM WARNING (2h 3m remaining)\nSVREAX\n\nThe National Weather Service in Pleasant Hill has issued a\n\n* Severe Thunderstorm Warning for...\nSoutheastern Adair County in northeastern Missouri...\nSoutheastern Linn County in north central Missouri...\nMacon County in north central Missouri...\n\n* Until 930 PM CDT.\n\n* At 812 PM CDT, severe thunderstorms were located along a line\nextending from near Edina to near Brookfield, moving east at 45\nmph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Emergency management. The Kirksville Airport reported a\n61 mph wind gust at 805 pm.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\n* Locations impacted include...\nKirksville, Macon, Brookfield, Marceline, La Plata, Bevier,\nBucklin, Atlanta, Callao, Brashear, New Cambria, Gibbs, Millard,\nElmer, Ethel, South Gifford, Kirksville Regional, New Boston, and\nSaint Catherine.\nSEVERE THUNDERSTORM WARNING (1h 18m remaining)\nSVREAX\n\nThe National Weather Service in Pleasant Hill has issued a\n\n* Severe Thunderstorm Warning for...\nAdair County in northeastern Missouri...\nLinn County in north central Missouri...\nEastern Sullivan County in north central Missouri...\nSoutheastern Putnam County in north central Missouri...\nSouthern Schuyler County in northeastern Missouri...\nNorthwestern Macon County in north central Missouri...\nNortheastern Livingston County in north central Missouri...\n\n* Until 845 PM CDT.\n\n* At 742 PM CDT, severe thunderstorms were located along a line\nextending from 6 miles north of Novinger to near Chillicothe,\nmoving east at 25 mph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Radar indicated.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\n* Locations impacted include...\nKirksville, Brookfield, Marceline, La Plata, Green City, Bucklin,\nMeadville, Novinger, Greentop, Laclede, Linneus, Greencastle,\nBrashear, Wheeling, Browning, New Cambria, Purdin, Gibbs, Millard,\nand Elmer.\nSEVERE THUNDERSTORM WARNING (1h 18m remaining)\nAt 816 PM CDT, severe thunderstorms were located along a line\nextending from near Greentop to near Laclede, moving east at 25 mph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Emergency management. The Kirksville Airport reported a 61\nmph wind gust at 805 pm. Widespread power outages have been\nreported in Putnam and Schuyler counties.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\nLocations impacted include...\nKirksville, Brookfield, Marceline, La Plata, Bucklin, Meadville,\nNovinger, Laclede, Linneus, Brashear, Wheeling, Browning, New\nCambria, Purdin, Gibbs, Millard, Elmer, Ethel, South Gifford, and\nKirksville Regional.\n\n"
             } = Weather.get(context.opts)
    end

    test "supports 24-hour format in rain report", context do
      stub(
        DateTime,
        :utc_now,
        fn -> DateTime.new!(~D[2024-07-03], ~T[00:26:08.003]) end
      )

      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Storm.response()))
      end)

      assert {
               :ok,
               "\nRain (20:28 - 21:27)\n\n[                                                            ]\n[.........       ...............     ........................]\n[............................................................]\n[............................................................]\n[............................................................]\n[............................................................]\n                +              +              +               \n\n77°  ⬇   73°  ⬇   70°  ⬇   68°  ⬆   72°     \n20       23       02       05       08      \n\n77° | very heavy rain | 76% humidity\nFLOOD WATCH (11h 33m remaining)\n* WHAT...Flash flooding caused by excessive rainfall is possible.\n\n* WHERE...Portions of Kansas, including the following areas,\nAtchison KS, Doniphan, Johnson KS, Leavenworth, Miami and\nWyandotte and Missouri, including the following areas, Adair,\nAndrew, Buchanan, Caldwell, Carroll, Cass, Chariton, Clay,\nClinton, Daviess, De Kalb, Gentry, Grundy, Harrison, Jackson,\nJohnson MO, Lafayette, Linn MO, Livingston, Macon, Mercer,\nNodaway, Platte, Putnam, Ray, Saline, Schuyler, Sullivan and Worth.\n\n* WHEN...From 5 PM CDT this afternoon through Wednesday morning.\n\n* IMPACTS...Excessive runoff may result in flooding of rivers,\ncreeks, streams, and other low-lying and flood-prone locations.\nCreeks and streams may rise out of their banks. Low-water\ncrossings may be flooded. Area creeks and streams are running high\nand could flood with more heavy rain.\n\n* ADDITIONAL DETAILS...\n- Forecast rainfall with thunderstorms this afternoon and\nevening.\n- http://www.weather.gov/safety/flood\nTORNADO WATCH (1h 33m remaining)\nTORNADO WATCH 497 REMAINS VALID UNTIL 9 PM CDT THIS EVENING FOR\nTHE FOLLOWING AREAS\n\nIN MISSOURI THIS WATCH INCLUDES 4 COUNTIES\n\nIN NORTH CENTRAL MISSOURI\n\nPUTNAM                SULLIVAN\n\nIN NORTHEAST MISSOURI\n\nADAIR                 SCHUYLER\n\nTHIS INCLUDES THE CITIES OF DOWNING, GLENWOOD, GREEN CITY,\nGREENTOP, KIRKSVILLE, LANCASTER, MILAN, QUEEN CITY,\nAND UNIONVILLE.\nSEVERE THUNDERSTORM WARNING (2h 3m remaining)\nSVREAX\n\nThe National Weather Service in Pleasant Hill has issued a\n\n* Severe Thunderstorm Warning for...\nSoutheastern Adair County in northeastern Missouri...\nSoutheastern Linn County in north central Missouri...\nMacon County in north central Missouri...\n\n* Until 930 PM CDT.\n\n* At 812 PM CDT, severe thunderstorms were located along a line\nextending from near Edina to near Brookfield, moving east at 45\nmph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Emergency management. The Kirksville Airport reported a\n61 mph wind gust at 805 pm.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\n* Locations impacted include...\nKirksville, Macon, Brookfield, Marceline, La Plata, Bevier,\nBucklin, Atlanta, Callao, Brashear, New Cambria, Gibbs, Millard,\nElmer, Ethel, South Gifford, Kirksville Regional, New Boston, and\nSaint Catherine.\nSEVERE THUNDERSTORM WARNING (1h 18m remaining)\nSVREAX\n\nThe National Weather Service in Pleasant Hill has issued a\n\n* Severe Thunderstorm Warning for...\nAdair County in northeastern Missouri...\nLinn County in north central Missouri...\nEastern Sullivan County in north central Missouri...\nSoutheastern Putnam County in north central Missouri...\nSouthern Schuyler County in northeastern Missouri...\nNorthwestern Macon County in north central Missouri...\nNortheastern Livingston County in north central Missouri...\n\n* Until 845 PM CDT.\n\n* At 742 PM CDT, severe thunderstorms were located along a line\nextending from 6 miles north of Novinger to near Chillicothe,\nmoving east at 25 mph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Radar indicated.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\n* Locations impacted include...\nKirksville, Brookfield, Marceline, La Plata, Green City, Bucklin,\nMeadville, Novinger, Greentop, Laclede, Linneus, Greencastle,\nBrashear, Wheeling, Browning, New Cambria, Purdin, Gibbs, Millard,\nand Elmer.\nSEVERE THUNDERSTORM WARNING (1h 18m remaining)\nAt 816 PM CDT, severe thunderstorms were located along a line\nextending from near Greentop to near Laclede, moving east at 25 mph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Emergency management. The Kirksville Airport reported a 61\nmph wind gust at 805 pm. Widespread power outages have been\nreported in Putnam and Schuyler counties.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\nLocations impacted include...\nKirksville, Brookfield, Marceline, La Plata, Bucklin, Meadville,\nNovinger, Laclede, Linneus, Brashear, Wheeling, Browning, New\nCambria, Purdin, Gibbs, Millard, Elmer, Ethel, South Gifford, and\nKirksville Regional.\n\n"
             } = Weather.get(%Weather.Opts{context.opts | twelve: false})
    end

    test "handles unauthorized responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(401, :json.encode(Unauthorized.response()))
      end)

      message =
        "Unauthorized (status 401)\n\nAre you sure you provided the correct API key?\n\nPlease note that using One Call 3.0 requires a separate subscription to the One Call by Call plan. Learn more here https://openweathermap.org/price. If you have a valid subscription to the One Call by Call plan, but still receive this error, then please see https://openweathermap.org/faq#error401 for more info."

      assert Weather.get(context.opts) == {:error, message}
    end

    test "handles unexpected responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(400, :json.encode(BadRequest.response()))
      end)

      message = "Unexpected response (status 400)\n\nwrong latitude"
      assert Weather.get(context.opts) == {:error, message}
    end

    @tag capture_log: true
    test "handles errors", context do
      Req.Test.expect(Weather.API, 4, &Req.Test.transport_error(&1, :econnrefused))

      assert Weather.get(context.opts) ==
               {:error, "Error\n\n%Req.TransportError{reason: :econnrefused}"}
    end

    @tag capture_log: true
    test "retries after errors", context do
      Req.Test.expect(Weather.API, 1, &Req.Test.transport_error(&1, :econnrefused))

      Req.Test.expect(
        Weather.API,
        fn conn ->
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/json")
          |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
        end
      )

      assert {:ok,
              "\n76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°     \n3PM      6PM      9PM      12AM     3AM     \n\n77° | scattered clouds | 37% humidity\n"} =
               Weather.get(context.opts)
    end

    test "colorizes fahrenheit temps correctly", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {
               :ok,
               "\n\e[38;5;214m76°\e[0m  ⬇   \e[38;5;214m74°\e[0m  ⬇   \e[38;5;226m64°\e[0m  ⬇   \e[38;5;226m60°\e[0m  ⬇   \e[38;5;148m58°\e[0m     \n3PM      6PM      9PM      12AM     3AM     \n\n77° | scattered clouds | 37% humidity\n"
             } = Weather.get(%Weather.Opts{context.opts | colors: true})
    end

    test "colorizes celsius temps correctly", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {
               :ok,
               "\n\e[38;5;88m76°\e[0m  ⬇   \e[38;5;88m74°\e[0m  ⬇   \e[38;5;88m64°\e[0m  ⬇   \e[38;5;88m60°\e[0m  ⬇   \e[38;5;88m58°\e[0m     \n3PM      6PM      9PM      12AM     3AM     \n\n77° | scattered clouds | 37% humidity\n"
             } =
               Weather.get(%Weather.Opts{context.opts | units: "metric", colors: true})
    end

    test "colorizes kelvin temps correctly", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert {
               :ok,
               "\n\e[38;5;245m76°\e[0m  ⬇   \e[38;5;245m74°\e[0m  ⬇   \e[38;5;245m64°\e[0m  ⬇   \e[38;5;245m60°\e[0m  ⬇   \e[38;5;245m58°\e[0m     \n3PM      6PM      9PM      12AM     3AM     \n\n77° | scattered clouds | 37% humidity\n"
             } =
               Weather.get(%Weather.Opts{context.opts | units: "standard", colors: true})
    end

    test "supports returning test data, which doesn't require an API key, latitude, or longitude to be present" do
      opts = Weather.Opts.new(test: "clear", colors: false)
      assert {:ok, "\n76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°     \n3PM      6PM      9PM      12AM     3AM     \n\n77° | scattered clouds | 37% humidity\n"} = Weather.get(opts)
    end
  end
end
