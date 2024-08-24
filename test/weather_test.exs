defmodule WeatherTest do
  @moduledoc nodoc: true
  use ExUnit.Case, async: true

  alias Weather.TestResponse.BadRequest
  alias Weather.TestResponse.Clear
  alias Weather.TestResponse.Rain
  alias Weather.TestResponse.Storm
  alias Weather.TestResponse.Unauthorized

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

      assert Weather.get(context.opts) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "accepts an optional label for the overall report", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | label: "Home Sweet Home"}) == {
               :ok,
               """

               Home Sweet Home

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "accepts an optional length for the hourly report", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | hours: 24}) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°  ⮕   58°  ⬆   67°  ⬆   69°  ⬇   65°
               3PM      6PM      9PM      12AM     3AM      6AM      9AM      12PM     3PM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "accepts an optional interval for the hourly report", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | every_n_hours: 6}) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   64°  ⬇   58°
               3PM      9PM      3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "supports 24-hour format", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | twelve: false}) == {
               :ok,
               """

               🌞 05:17 | 🌚 20:25

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
               15       18       21       00       03\s

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "displays minutely rain and alerts", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Storm.response()))
      end)

      assert Weather.get(context.opts) == {
               :ok,
               """

                                  << 🌧️  8:28PM - 9:27PM >>\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               [                                                            ]
               [.........       ...............     ........................]
               [............................................................]
               [............................................................]
               [............................................................]
               [............................................................]
                               +              +              +\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               🌧️  9PM - 2AM

               🌞 5:44AM | 🌚 8:42PM

               77°  ⬇   73°  ⬇   70°  ⬇   68°  ⬆   72°
               8PM      11PM     2AM      5AM      8AM

               77° | very heavy rain | 76% humidity

               FLOOD WATCH (Tue 5:00PM - Wed 7:00AM)
               * WHAT...Flash flooding caused by excessive rainfall is possible.

               * WHERE...Portions of Kansas, including the following areas,
               Atchison KS, Doniphan, Johnson KS, Leavenworth, Miami and
               Wyandotte and Missouri, including the following areas, Adair,
               Andrew, Buchanan, Caldwell, Carroll, Cass, Chariton, Clay,
               Clinton, Daviess, De Kalb, Gentry, Grundy, Harrison, Jackson,
               Johnson MO, Lafayette, Linn MO, Livingston, Macon, Mercer,
               Nodaway, Platte, Putnam, Ray, Saline, Schuyler, Sullivan and Worth.

               * WHEN...From 5 PM CDT this afternoon through Wednesday morning.

               * IMPACTS...Excessive runoff may result in flooding of rivers,
               creeks, streams, and other low-lying and flood-prone locations.
               Creeks and streams may rise out of their banks. Low-water
               crossings may be flooded. Area creeks and streams are running high
               and could flood with more heavy rain.

               * ADDITIONAL DETAILS...
               - Forecast rainfall with thunderstorms this afternoon and
               evening.
               - http://www.weather.gov/safety/flood

               TORNADO WATCH (Tue 7:48PM - Tue 9:00PM)
               TORNADO WATCH 497 REMAINS VALID UNTIL 9 PM CDT THIS EVENING FOR
               THE FOLLOWING AREAS

               IN MISSOURI THIS WATCH INCLUDES 4 COUNTIES

               IN NORTH CENTRAL MISSOURI

               PUTNAM                SULLIVAN

               IN NORTHEAST MISSOURI

               ADAIR                 SCHUYLER

               THIS INCLUDES THE CITIES OF DOWNING, GLENWOOD, GREEN CITY,
               GREENTOP, KIRKSVILLE, LANCASTER, MILAN, QUEEN CITY,
               AND UNIONVILLE.

               SEVERE THUNDERSTORM WARNING (Tue 8:12PM - Tue 9:30PM)
               SVREAX

               The National Weather Service in Pleasant Hill has issued a

               * Severe Thunderstorm Warning for...
               Southeastern Adair County in northeastern Missouri...
               Southeastern Linn County in north central Missouri...
               Macon County in north central Missouri...

               * Until 930 PM CDT.

               * At 812 PM CDT, severe thunderstorms were located along a line
               extending from near Edina to near Brookfield, moving east at 45
               mph.

               HAZARD...60 mph wind gusts and penny size hail.

               SOURCE...Emergency management. The Kirksville Airport reported a
               61 mph wind gust at 805 pm.

               IMPACT...Expect damage to roofs, siding, and trees.

               * Locations impacted include...
               Kirksville, Macon, Brookfield, Marceline, La Plata, Bevier,
               Bucklin, Atlanta, Callao, Brashear, New Cambria, Gibbs, Millard,
               Elmer, Ethel, South Gifford, Kirksville Regional, New Boston, and
               Saint Catherine.

               SEVERE THUNDERSTORM WARNING (Tue 7:42PM - Tue 8:45PM)
               SVREAX

               The National Weather Service in Pleasant Hill has issued a

               * Severe Thunderstorm Warning for...
               Adair County in northeastern Missouri...
               Linn County in north central Missouri...
               Eastern Sullivan County in north central Missouri...
               Southeastern Putnam County in north central Missouri...
               Southern Schuyler County in northeastern Missouri...
               Northwestern Macon County in north central Missouri...
               Northeastern Livingston County in north central Missouri...

               * Until 845 PM CDT.

               * At 742 PM CDT, severe thunderstorms were located along a line
               extending from 6 miles north of Novinger to near Chillicothe,
               moving east at 25 mph.

               HAZARD...60 mph wind gusts and penny size hail.

               SOURCE...Radar indicated.

               IMPACT...Expect damage to roofs, siding, and trees.

               * Locations impacted include...
               Kirksville, Brookfield, Marceline, La Plata, Green City, Bucklin,
               Meadville, Novinger, Greentop, Laclede, Linneus, Greencastle,
               Brashear, Wheeling, Browning, New Cambria, Purdin, Gibbs, Millard,
               and Elmer.

               SEVERE THUNDERSTORM WARNING (Tue 8:17PM - Tue 8:45PM)
               At 816 PM CDT, severe thunderstorms were located along a line
               extending from near Greentop to near Laclede, moving east at 25 mph.

               HAZARD...60 mph wind gusts and penny size hail.

               SOURCE...Emergency management. The Kirksville Airport reported a 61
               mph wind gust at 805 pm. Widespread power outages have been
               reported in Putnam and Schuyler counties.

               IMPACT...Expect damage to roofs, siding, and trees.

               Locations impacted include...
               Kirksville, Brookfield, Marceline, La Plata, Bucklin, Meadville,
               Novinger, Laclede, Linneus, Brashear, Wheeling, Browning, New
               Cambria, Purdin, Gibbs, Millard, Elmer, Ethel, South Gifford, and
               Kirksville Regional.
               """
             }
    end

    test "optionally shows only the title for alerts", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Storm.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | alert_titles_only: true}) == {
               :ok,
               """

                                  << 🌧️  8:28PM - 9:27PM >>\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               [                                                            ]
               [.........       ...............     ........................]
               [............................................................]
               [............................................................]
               [............................................................]
               [............................................................]
                               +              +              +\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               🌧️  9PM - 2AM

               🌞 5:44AM | 🌚 8:42PM

               77°  ⬇   73°  ⬇   70°  ⬇   68°  ⬆   72°
               8PM      11PM     2AM      5AM      8AM

               77° | very heavy rain | 76% humidity

               FLOOD WATCH (Tue 5:00PM - Wed 7:00AM)

               TORNADO WATCH (Tue 7:48PM - Tue 9:00PM)

               SEVERE THUNDERSTORM WARNING (Tue 8:12PM - Tue 9:30PM)

               SEVERE THUNDERSTORM WARNING (Tue 7:42PM - Tue 8:45PM)

               SEVERE THUNDERSTORM WARNING (Tue 8:17PM - Tue 8:45PM)
               """
             }
    end

    test "uses the first description for current weather, if there are multiple", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Rain.response()))
      end)

      assert Weather.get(context.opts) == {
               :ok,
               """

                                  << 🌧️  7:28AM - 8:27AM >>\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               [                                                            ]
               [                                                            ]
               [                    ........................................]
               [............................................................]
               [............................................................]
               [............................................................]
                               +              +              +\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               🌧️  7AM - 9AM, 10AM - 12PM

               🌞 6:01AM | 🌚 7:52PM

               66°  ⬇   65°  ⬆   67°  ⬆   73°  ⬇   71°
               7AM      10AM     1PM      4PM      7PM

               66° | moderate rain | 92% humidity
               """
             }
    end

    test "optionally hides alerts", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Storm.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | hide_alerts: true}) == {
               :ok,
               """

                                  << 🌧️  8:28PM - 9:27PM >>\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               [                                                            ]
               [.........       ...............     ........................]
               [............................................................]
               [............................................................]
               [............................................................]
               [............................................................]
                               +              +              +\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               🌧️  9PM - 2AM

               🌞 5:44AM | 🌚 8:42PM

               77°  ⬇   73°  ⬇   70°  ⬇   68°  ⬆   72°
               8PM      11PM     2AM      5AM      8AM

               77° | very heavy rain | 76% humidity
               """
             }
    end

    test "colorizes alerts", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Storm.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | colors: true}) == {
               :ok,
               """

                                  << 🌧️  8:28PM - 9:27PM >>\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               [                                                            ]
               [.........       ...............     ........................]
               [............................................................]
               [............................................................]
               [............................................................]
               [............................................................]
                               +              +              +\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               🌧️  9PM - 2AM

               🌞 5:44AM | 🌚 8:42PM

               \e[38;5;214m77°\e[0m  ⬇   \e[38;5;214m73°\e[0m  ⬇   \e[38;5;214m70°\e[0m  ⬇   \e[38;5;226m68°\e[0m  ⬆   \e[38;5;214m72°\e[0m
               8PM      11PM     2AM      5AM      8AM

               77° | very heavy rain | 76% humidity

               \e[38;5;9mFLOOD WATCH (Tue 5:00PM - Wed 7:00AM)\e[0m
               * WHAT...Flash flooding caused by excessive rainfall is possible.

               * WHERE...Portions of Kansas, including the following areas,
               Atchison KS, Doniphan, Johnson KS, Leavenworth, Miami and
               Wyandotte and Missouri, including the following areas, Adair,
               Andrew, Buchanan, Caldwell, Carroll, Cass, Chariton, Clay,
               Clinton, Daviess, De Kalb, Gentry, Grundy, Harrison, Jackson,
               Johnson MO, Lafayette, Linn MO, Livingston, Macon, Mercer,
               Nodaway, Platte, Putnam, Ray, Saline, Schuyler, Sullivan and Worth.

               * WHEN...From 5 PM CDT this afternoon through Wednesday morning.

               * IMPACTS...Excessive runoff may result in flooding of rivers,
               creeks, streams, and other low-lying and flood-prone locations.
               Creeks and streams may rise out of their banks. Low-water
               crossings may be flooded. Area creeks and streams are running high
               and could flood with more heavy rain.

               * ADDITIONAL DETAILS...
               - Forecast rainfall with thunderstorms this afternoon and
               evening.
               - http://www.weather.gov/safety/flood

               \e[38;5;9mTORNADO WATCH (Tue 7:48PM - Tue 9:00PM)\e[0m
               TORNADO WATCH 497 REMAINS VALID UNTIL 9 PM CDT THIS EVENING FOR
               THE FOLLOWING AREAS

               IN MISSOURI THIS WATCH INCLUDES 4 COUNTIES

               IN NORTH CENTRAL MISSOURI

               PUTNAM                SULLIVAN

               IN NORTHEAST MISSOURI

               ADAIR                 SCHUYLER

               THIS INCLUDES THE CITIES OF DOWNING, GLENWOOD, GREEN CITY,
               GREENTOP, KIRKSVILLE, LANCASTER, MILAN, QUEEN CITY,
               AND UNIONVILLE.

               \e[38;5;9mSEVERE THUNDERSTORM WARNING (Tue 8:12PM - Tue 9:30PM)\e[0m
               SVREAX

               The National Weather Service in Pleasant Hill has issued a

               * Severe Thunderstorm Warning for...
               Southeastern Adair County in northeastern Missouri...
               Southeastern Linn County in north central Missouri...
               Macon County in north central Missouri...

               * Until 930 PM CDT.

               * At 812 PM CDT, severe thunderstorms were located along a line
               extending from near Edina to near Brookfield, moving east at 45
               mph.

               HAZARD...60 mph wind gusts and penny size hail.

               SOURCE...Emergency management. The Kirksville Airport reported a
               61 mph wind gust at 805 pm.

               IMPACT...Expect damage to roofs, siding, and trees.

               * Locations impacted include...
               Kirksville, Macon, Brookfield, Marceline, La Plata, Bevier,
               Bucklin, Atlanta, Callao, Brashear, New Cambria, Gibbs, Millard,
               Elmer, Ethel, South Gifford, Kirksville Regional, New Boston, and
               Saint Catherine.

               \e[38;5;9mSEVERE THUNDERSTORM WARNING (Tue 7:42PM - Tue 8:45PM)\e[0m
               SVREAX

               The National Weather Service in Pleasant Hill has issued a

               * Severe Thunderstorm Warning for...
               Adair County in northeastern Missouri...
               Linn County in north central Missouri...
               Eastern Sullivan County in north central Missouri...
               Southeastern Putnam County in north central Missouri...
               Southern Schuyler County in northeastern Missouri...
               Northwestern Macon County in north central Missouri...
               Northeastern Livingston County in north central Missouri...

               * Until 845 PM CDT.

               * At 742 PM CDT, severe thunderstorms were located along a line
               extending from 6 miles north of Novinger to near Chillicothe,
               moving east at 25 mph.

               HAZARD...60 mph wind gusts and penny size hail.

               SOURCE...Radar indicated.

               IMPACT...Expect damage to roofs, siding, and trees.

               * Locations impacted include...
               Kirksville, Brookfield, Marceline, La Plata, Green City, Bucklin,
               Meadville, Novinger, Greentop, Laclede, Linneus, Greencastle,
               Brashear, Wheeling, Browning, New Cambria, Purdin, Gibbs, Millard,
               and Elmer.

               \e[38;5;9mSEVERE THUNDERSTORM WARNING (Tue 8:17PM - Tue 8:45PM)\e[0m\

               At 816 PM CDT, severe thunderstorms were located along a line
               extending from near Greentop to near Laclede, moving east at 25 mph.

               HAZARD...60 mph wind gusts and penny size hail.

               SOURCE...Emergency management. The Kirksville Airport reported a 61
               mph wind gust at 805 pm. Widespread power outages have been
               reported in Putnam and Schuyler counties.

               IMPACT...Expect damage to roofs, siding, and trees.

               Locations impacted include...
               Kirksville, Brookfield, Marceline, La Plata, Bucklin, Meadville,
               Novinger, Laclede, Linneus, Brashear, Wheeling, Browning, New
               Cambria, Purdin, Gibbs, Millard, Elmer, Ethel, South Gifford, and
               Kirksville Regional.
               """
             }
    end

    test "supports 24-hour format in rain report", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Rain.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | twelve: false}) == {
               :ok,
               """

                                   << 🌧️  07:28 - 08:27 >>\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               [                                                            ]
               [                                                            ]
               [                    ........................................]
               [............................................................]
               [............................................................]
               [............................................................]
                               +              +              +\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s

               🌧️  07 - 09, 10 - 12

               🌞 06:01 | 🌚 19:52

               66°  ⬇   65°  ⬆   67°  ⬆   73°  ⬇   71°
               07       10       13       16       19\s

               66° | moderate rain | 92% humidity
               """
             }
    end

    test "handles unauthorized responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(401, :json.encode(Unauthorized.response()))
      end)

      message = """
      Unauthorized (status 401)

      Are you sure you provided the correct API key?

      Please note that using One Call 3.0 requires a separate subscription to the One Call by Call plan. Learn more here https://openweathermap.org/price. If you have a valid subscription to the One Call by Call plan, but still receive this error, then please see https://openweathermap.org/faq#error401 for more info.
      """

      assert Weather.get(context.opts) == {:error, message}
    end

    test "handles unexpected responses", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(400, :json.encode(BadRequest.response()))
      end)

      message = """
      Unexpected response (status 400)

      wrong latitude
      """

      assert Weather.get(context.opts) == {:error, message}
    end

    @tag capture_log: true
    test "handles errors", context do
      Req.Test.expect(Weather.API, 4, &Req.Test.transport_error(&1, :econnrefused))

      message = """
      Error

      %Req.TransportError{reason: :econnrefused}
      """

      assert Weather.get(context.opts) == {:error, message}
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

      assert Weather.get(context.opts) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "colorizes fahrenheit temps correctly", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | colors: true}) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               \e[38;5;214m76°\e[0m  ⬇   \e[38;5;214m74°\e[0m  ⬇   \e[38;5;226m64°\e[0m  ⬇   \e[38;5;226m60°\e[0m  ⬇   \e[38;5;148m58°\e[0m
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "colorizes celsius temps correctly", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | units: "metric", colors: true}) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               \e[38;5;88m76°\e[0m  ⬇   \e[38;5;88m74°\e[0m  ⬇   \e[38;5;88m64°\e[0m  ⬇   \e[38;5;88m60°\e[0m  ⬇   \e[38;5;88m58°\e[0m
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "colorizes kelvin temps correctly", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | units: "standard", colors: true}) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               \e[38;5;245m76°\e[0m  ⬇   \e[38;5;245m74°\e[0m  ⬇   \e[38;5;245m64°\e[0m  ⬇   \e[38;5;245m60°\e[0m  ⬇   \e[38;5;245m58°\e[0m
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "supports returning test data, which doesn't require an API key, latitude, or longitude to be present" do
      opts = Weather.Opts.new(test: "clear", colors: false)

      assert Weather.get(opts) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               76°  ⬇   74°  ⬇   64°  ⬇   60°  ⬇   58°
               3PM      6PM      9PM      12AM     3AM

               77° | scattered clouds | 37% humidity
               """
             }
    end

    test "omits hourly data when passed 0 for hours", context do
      Req.Test.expect(Weather.API, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.send_resp(200, :json.encode(Clear.response()))
      end)

      assert Weather.get(%Weather.Opts{context.opts | hours: 0}) == {
               :ok,
               """

               🌞 5:17AM | 🌚 8:25PM

               77° | scattered clouds | 37% humidity
               """
             }
    end
  end
end
