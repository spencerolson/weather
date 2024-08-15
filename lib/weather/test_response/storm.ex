defmodule Weather.TestResponse.Storm do
  @moduledoc false

  @spec response() :: map()
  def response do
    %{
      "alerts" => [
        %{
          "description" =>
            "* WHAT...Flash flooding caused by excessive rainfall is possible.\n\n* WHERE...Portions of Kansas, including the following areas,\nAtchison KS, Doniphan, Johnson KS, Leavenworth, Miami and\nWyandotte and Missouri, including the following areas, Adair,\nAndrew, Buchanan, Caldwell, Carroll, Cass, Chariton, Clay,\nClinton, Daviess, De Kalb, Gentry, Grundy, Harrison, Jackson,\nJohnson MO, Lafayette, Linn MO, Livingston, Macon, Mercer,\nNodaway, Platte, Putnam, Ray, Saline, Schuyler, Sullivan and Worth.\n\n* WHEN...From 5 PM CDT this afternoon through Wednesday morning.\n\n* IMPACTS...Excessive runoff may result in flooding of rivers,\ncreeks, streams, and other low-lying and flood-prone locations.\nCreeks and streams may rise out of their banks. Low-water\ncrossings may be flooded. Area creeks and streams are running high\nand could flood with more heavy rain.\n\n* ADDITIONAL DETAILS...\n- Forecast rainfall with thunderstorms this afternoon and\nevening.\n- http://www.weather.gov/safety/flood",
          "end" => 1_720_008_000,
          "event" => "Flood Watch",
          "sender_name" => "NWS Kansas City/Pleasant Hill MO",
          "start" => 1_719_957_600,
          "tags" => ["Flood"]
        },
        %{
          "description" =>
            "TORNADO WATCH 497 REMAINS VALID UNTIL 9 PM CDT THIS EVENING FOR\nTHE FOLLOWING AREAS\n\nIN MISSOURI THIS WATCH INCLUDES 4 COUNTIES\n\nIN NORTH CENTRAL MISSOURI\n\nPUTNAM                SULLIVAN\n\nIN NORTHEAST MISSOURI\n\nADAIR                 SCHUYLER\n\nTHIS INCLUDES THE CITIES OF DOWNING, GLENWOOD, GREEN CITY,\nGREENTOP, KIRKSVILLE, LANCASTER, MILAN, QUEEN CITY,\nAND UNIONVILLE.",
          "end" => 1_719_972_000,
          "event" => "Tornado Watch",
          "sender_name" => "NWS Kansas City/Pleasant Hill MO",
          "start" => 1_719_967_680,
          "tags" => ["Tornado"]
        },
        %{
          "description" =>
            "SVREAX\n\nThe National Weather Service in Pleasant Hill has issued a\n\n* Severe Thunderstorm Warning for...\nSoutheastern Adair County in northeastern Missouri...\nSoutheastern Linn County in north central Missouri...\nMacon County in north central Missouri...\n\n* Until 930 PM CDT.\n\n* At 812 PM CDT, severe thunderstorms were located along a line\nextending from near Edina to near Brookfield, moving east at 45\nmph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Emergency management. The Kirksville Airport reported a\n61 mph wind gust at 805 pm.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\n* Locations impacted include...\nKirksville, Macon, Brookfield, Marceline, La Plata, Bevier,\nBucklin, Atlanta, Callao, Brashear, New Cambria, Gibbs, Millard,\nElmer, Ethel, South Gifford, Kirksville Regional, New Boston, and\nSaint Catherine.",
          "end" => 1_719_973_800,
          "event" => "Severe Thunderstorm Warning",
          "sender_name" => "NWS Kansas City/Pleasant Hill MO",
          "start" => 1_719_969_120,
          "tags" => ["Thunderstorm"]
        },
        %{
          "description" =>
            "SVREAX\n\nThe National Weather Service in Pleasant Hill has issued a\n\n* Severe Thunderstorm Warning for...\nAdair County in northeastern Missouri...\nLinn County in north central Missouri...\nEastern Sullivan County in north central Missouri...\nSoutheastern Putnam County in north central Missouri...\nSouthern Schuyler County in northeastern Missouri...\nNorthwestern Macon County in north central Missouri...\nNortheastern Livingston County in north central Missouri...\n\n* Until 845 PM CDT.\n\n* At 742 PM CDT, severe thunderstorms were located along a line\nextending from 6 miles north of Novinger to near Chillicothe,\nmoving east at 25 mph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Radar indicated.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\n* Locations impacted include...\nKirksville, Brookfield, Marceline, La Plata, Green City, Bucklin,\nMeadville, Novinger, Greentop, Laclede, Linneus, Greencastle,\nBrashear, Wheeling, Browning, New Cambria, Purdin, Gibbs, Millard,\nand Elmer.",
          "end" => 1_719_971_100,
          "event" => "Severe Thunderstorm Warning",
          "sender_name" => "NWS Kansas City/Pleasant Hill MO",
          "start" => 1_719_967_320,
          "tags" => ["Thunderstorm"]
        },
        %{
          "description" =>
            "At 816 PM CDT, severe thunderstorms were located along a line\nextending from near Greentop to near Laclede, moving east at 25 mph.\n\nHAZARD...60 mph wind gusts and penny size hail.\n\nSOURCE...Emergency management. The Kirksville Airport reported a 61\nmph wind gust at 805 pm. Widespread power outages have been\nreported in Putnam and Schuyler counties.\n\nIMPACT...Expect damage to roofs, siding, and trees.\n\nLocations impacted include...\nKirksville, Brookfield, Marceline, La Plata, Bucklin, Meadville,\nNovinger, Laclede, Linneus, Brashear, Wheeling, Browning, New\nCambria, Purdin, Gibbs, Millard, Elmer, Ethel, South Gifford, and\nKirksville Regional.",
          "end" => 1_719_971_100,
          "event" => "Severe Thunderstorm Warning",
          "sender_name" => "NWS Kansas City/Pleasant Hill MO",
          "start" => 1_719_969_420,
          "tags" => ["Thunderstorm"]
        }
      ],
      "current" => %{
        "clouds" => 98,
        "dew_point" => 68.94,
        "dt" => 1_719_970_077,
        "feels_like" => 78.08,
        "humidity" => 76,
        "pressure" => 1007,
        "rain" => %{"1h" => 34.51},
        "sunrise" => 1_719_917_093,
        "sunset" => 1_719_970_946,
        "temp" => 77.09,
        "uvi" => 0.1,
        "visibility" => 10_000,
        "weather" => [
          %{
            "description" => "very heavy rain",
            "icon" => "10d",
            "id" => 503,
            "main" => "Rain"
          }
        ],
        "wind_deg" => 224,
        "wind_gust" => 32.64,
        "wind_speed" => 12.44
      },
      "daily" => [
        %{
          "clouds" => 11,
          "dew_point" => 73.76,
          "dt" => 1_719_943_200,
          "feels_like" => %{
            "day" => 94.51,
            "eve" => 79.47,
            "morn" => 63.54,
            "night" => 74.1
          },
          "humidity" => 66,
          "moon_phase" => 0.89,
          "moonrise" => 1_719_905_580,
          "moonset" => 1_719_961_200,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => 35.23,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_719_917_093,
          "sunset" => 1_719_970_946,
          "temp" => %{
            "day" => 86.5,
            "eve" => 78.31,
            "max" => 90.41,
            "min" => 61.43,
            "morn" => 63.5,
            "night" => 72.97
          },
          "uvi" => 9.19,
          "weather" => [
            %{
              "description" => "very heavy rain",
              "icon" => "10d",
              "id" => 503,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 274,
          "wind_gust" => 39.06,
          "wind_speed" => 19.73
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.32,
          "dt" => 1_720_029_600,
          "feels_like" => %{
            "day" => 83.37,
            "eve" => 85.17,
            "morn" => 71.83,
            "night" => 71.06
          },
          "humidity" => 63,
          "moon_phase" => 0.92,
          "moonrise" => 1_719_994_440,
          "moonset" => 1_720_051_860,
          "pop" => 1,
          "pressure" => 1015,
          "rain" => 6.62,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_720_003_525,
          "sunset" => 1_720_057_335,
          "temp" => %{
            "day" => 80.91,
            "eve" => 81.21,
            "max" => 83.88,
            "min" => 68.27,
            "morn" => 70.52,
            "night" => 70.12
          },
          "uvi" => 9.07,
          "weather" => [
            %{
              "description" => "heavy intensity rain",
              "icon" => "10d",
              "id" => 502,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 244,
          "wind_gust" => 27.47,
          "wind_speed" => 10.04
        },
        %{
          "clouds" => 50,
          "dew_point" => 69.15,
          "dt" => 1_720_116_000,
          "feels_like" => %{
            "day" => 78.94,
            "eve" => 79.43,
            "morn" => 67.5,
            "night" => 72.28
          },
          "humidity" => 74,
          "moon_phase" => 0.96,
          "moonrise" => 1_720_083_780,
          "moonset" => 1_720_142_040,
          "pop" => 1,
          "pressure" => 1013,
          "rain" => 1.84,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_720_089_958,
          "sunset" => 1_720_143_722,
          "temp" => %{
            "day" => 77.97,
            "eve" => 78.06,
            "max" => 78.42,
            "min" => 66.06,
            "morn" => 66.92,
            "night" => 71.06
          },
          "uvi" => 2.4,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 137,
          "wind_gust" => 23.73,
          "wind_speed" => 12.03
        },
        %{
          "clouds" => 0,
          "dew_point" => 59.94,
          "dt" => 1_720_202_400,
          "feels_like" => %{
            "day" => 75.65,
            "eve" => 71.69,
            "morn" => 59.49,
            "night" => 64.53
          },
          "humidity" => 58,
          "moon_phase" => 0,
          "moonrise" => 1_720_173_660,
          "moonset" => 1_720_231_620,
          "pop" => 0.8,
          "pressure" => 1011,
          "rain" => 0.2,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_720_176_392,
          "sunset" => 1_720_230_107,
          "temp" => %{
            "day" => 75.65,
            "eve" => 71.51,
            "max" => 76.62,
            "min" => 57.61,
            "morn" => 59.59,
            "night" => 64.31
          },
          "uvi" => 7.94,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 305,
          "wind_gust" => 41.05,
          "wind_speed" => 20.13
        },
        %{
          "clouds" => 0,
          "dew_point" => 57,
          "dt" => 1_720_288_800,
          "feels_like" => %{
            "day" => 77.54,
            "eve" => 76.42,
            "morn" => 59.31,
            "night" => 68.52
          },
          "humidity" => 49,
          "moon_phase" => 0.03,
          "moonrise" => 1_720_263_900,
          "moonset" => 1_720_320_540,
          "pop" => 0,
          "pressure" => 1016,
          "summary" =>
            "You can expect clear sky in the morning, with partly cloudy in the afternoon",
          "sunrise" => 1_720_262_828,
          "sunset" => 1_720_316_491,
          "temp" => %{
            "day" => 77.76,
            "eve" => 75.63,
            "max" => 79.36,
            "min" => 59.43,
            "morn" => 59.43,
            "night" => 68.07
          },
          "uvi" => 8.82,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 306,
          "wind_gust" => 23.06,
          "wind_speed" => 8.23
        },
        %{
          "clouds" => 46,
          "dew_point" => 67.17,
          "dt" => 1_720_375_200,
          "feels_like" => %{
            "day" => 85.19,
            "eve" => 70.86,
            "morn" => 66.31,
            "night" => 65.17
          },
          "humidity" => 60,
          "moon_phase" => 0.06,
          "moonrise" => 1_720_354_320,
          "moonset" => 1_720_408_980,
          "pop" => 1,
          "pressure" => 1012,
          "rain" => 3.83,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_720_349_265,
          "sunset" => 1_720_402_872,
          "temp" => %{
            "day" => 82.53,
            "eve" => 69.98,
            "max" => 82.53,
            "min" => 63.99,
            "morn" => 65.88,
            "night" => 64.51
          },
          "uvi" => 0.34,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 228,
          "wind_gust" => 26.31,
          "wind_speed" => 15.68
        },
        %{
          "clouds" => 1,
          "dew_point" => 61.43,
          "dt" => 1_720_461_600,
          "feels_like" => %{
            "day" => 79.72,
            "eve" => 83.08,
            "morn" => 64.87,
            "night" => 69.31
          },
          "humidity" => 54,
          "moon_phase" => 0.09,
          "moonrise" => 1_720_444_680,
          "moonset" => 1_720_497_000,
          "pop" => 0,
          "pressure" => 1014,
          "summary" =>
            "The day will start with partly cloudy through the late morning hours, transitioning to clearing",
          "sunrise" => 1_720_435_703,
          "sunset" => 1_720_489_251,
          "temp" => %{
            "day" => 79.72,
            "eve" => 80.42,
            "max" => 82.31,
            "min" => 63.36,
            "morn" => 64.18,
            "night" => 69.13
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 231,
          "wind_gust" => 14.07,
          "wind_speed" => 6.87
        },
        %{
          "clouds" => 1,
          "dew_point" => 63.3,
          "dt" => 1_720_548_000,
          "feels_like" => %{
            "day" => 83.48,
            "eve" => 84.83,
            "morn" => 66.06,
            "night" => 71.67
          },
          "humidity" => 52,
          "moon_phase" => 0.12,
          "moonrise" => 1_720_534_980,
          "moonset" => 1_720_584_840,
          "pop" => 0,
          "pressure" => 1015,
          "summary" => "There will be clear sky today",
          "sunrise" => 1_720_522_143,
          "sunset" => 1_720_575_629,
          "temp" => %{
            "day" => 82.35,
            "eve" => 81.32,
            "max" => 83.97,
            "min" => 64.47,
            "morn" => 65.61,
            "night" => 71.06
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 332,
          "wind_gust" => 18.3,
          "wind_speed" => 11.41
        }
      ],
      "hourly" => [
        %{
          "clouds" => 98,
          "dew_point" => 68.94,
          "dt" => 1_719_968_400,
          "feels_like" => 78.08,
          "humidity" => 76,
          "pop" => 0.34,
          "pressure" => 1007,
          "temp" => 77.09,
          "uvi" => 0.1,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 224,
          "wind_gust" => 32.64,
          "wind_speed" => 12.44
        },
        %{
          "clouds" => 90,
          "dew_point" => 70.36,
          "dt" => 1_719_972_000,
          "feels_like" => 78.53,
          "humidity" => 79,
          "pop" => 1,
          "pressure" => 1007,
          "rain" => %{"1h" => 9.99},
          "temp" => 77.38,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "heavy intensity rain",
              "icon" => "10n",
              "id" => 502,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 236,
          "wind_gust" => 31.85,
          "wind_speed" => 10.04
        },
        %{
          "clouds" => 77,
          "dew_point" => 71.28,
          "dt" => 1_719_975_600,
          "feels_like" => 78.48,
          "humidity" => 82,
          "pop" => 1,
          "pressure" => 1008,
          "rain" => %{"1h" => 2.73},
          "temp" => 77.2,
          "uvi" => 0,
          "visibility" => 6482,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 274,
          "wind_gust" => 35.25,
          "wind_speed" => 19.73
        },
        %{
          "clouds" => 75,
          "dew_point" => 69.21,
          "dt" => 1_719_979_200,
          "feels_like" => 74.1,
          "humidity" => 88,
          "pop" => 1,
          "pressure" => 1009,
          "rain" => %{"1h" => 17.14},
          "temp" => 72.97,
          "uvi" => 0,
          "visibility" => 1147,
          "weather" => [
            %{
              "description" => "very heavy rain",
              "icon" => "10n",
              "id" => 503,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 278,
          "wind_gust" => 39.06,
          "wind_speed" => 18.45
        },
        %{
          "clouds" => 73,
          "dew_point" => 69.42,
          "dt" => 1_719_982_800,
          "feels_like" => 72.77,
          "humidity" => 93,
          "pop" => 1,
          "pressure" => 1011,
          "rain" => %{"1h" => 4.13},
          "temp" => 71.55,
          "uvi" => 0,
          "visibility" => 2965,
          "weather" => [
            %{
              "description" => "heavy intensity rain",
              "icon" => "10n",
              "id" => 502,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 244,
          "wind_gust" => 27.47,
          "wind_speed" => 10.04
        },
        %{
          "clouds" => 72,
          "dew_point" => 68.56,
          "dt" => 1_719_986_400,
          "feels_like" => 70.74,
          "humidity" => 97,
          "pop" => 1,
          "pressure" => 1011,
          "rain" => %{"1h" => 1.42},
          "temp" => 69.53,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 303,
          "wind_gust" => 13.2,
          "wind_speed" => 3.53
        },
        %{
          "clouds" => 99,
          "dew_point" => 68.27,
          "dt" => 1_719_990_000,
          "feels_like" => 70.68,
          "humidity" => 96,
          "pop" => 0.4,
          "pressure" => 1011,
          "temp" => 69.51,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 175,
          "wind_gust" => 2.77,
          "wind_speed" => 3.02
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.93,
          "dt" => 1_719_993_600,
          "feels_like" => 70.29,
          "humidity" => 96,
          "pop" => 0.31,
          "pressure" => 1012,
          "temp" => 69.15,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 216,
          "wind_gust" => 5.7,
          "wind_speed" => 5.32
        },
        %{
          "clouds" => 80,
          "dew_point" => 67.64,
          "dt" => 1_719_997_200,
          "feels_like" => 69.6,
          "humidity" => 97,
          "pop" => 0.12,
          "pressure" => 1012,
          "temp" => 68.49,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04n",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 258,
          "wind_gust" => 5.01,
          "wind_speed" => 4.68
        },
        %{
          "clouds" => 70,
          "dew_point" => 67.66,
          "dt" => 1_720_000_800,
          "feels_like" => 69.4,
          "humidity" => 98,
          "pop" => 0.04,
          "pressure" => 1012,
          "temp" => 68.27,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04n",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 249,
          "wind_gust" => 7.99,
          "wind_speed" => 5.03
        },
        %{
          "clouds" => 77,
          "dew_point" => 68.41,
          "dt" => 1_720_004_400,
          "feels_like" => 70.05,
          "humidity" => 99,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 68.81,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 283,
          "wind_gust" => 7.18,
          "wind_speed" => 4.36
        },
        %{
          "clouds" => 78,
          "dew_point" => 69.73,
          "dt" => 1_720_008_000,
          "feels_like" => 71.83,
          "humidity" => 97,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 70.52,
          "uvi" => 0.37,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 288,
          "wind_gust" => 4.52,
          "wind_speed" => 3.27
        },
        %{
          "clouds" => 100,
          "dew_point" => 70.39,
          "dt" => 1_720_011_600,
          "feels_like" => 73.78,
          "humidity" => 94,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 72.41,
          "uvi" => 1.09,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 292,
          "wind_gust" => 3.27,
          "wind_speed" => 2.73
        },
        %{
          "clouds" => 100,
          "dew_point" => 70.29,
          "dt" => 1_720_015_200,
          "feels_like" => 75.45,
          "humidity" => 87,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 74.25,
          "uvi" => 2.23,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 322,
          "wind_gust" => 3.85,
          "wind_speed" => 3.22
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.76,
          "dt" => 1_720_018_800,
          "feels_like" => 77.2,
          "humidity" => 81,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 76.08,
          "uvi" => 3.99,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 352,
          "wind_gust" => 3.38,
          "wind_speed" => 2.77
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.33,
          "dt" => 1_720_022_400,
          "feels_like" => 79.47,
          "humidity" => 73,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 78.49,
          "uvi" => 6.84,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 318,
          "wind_gust" => 3.4,
          "wind_speed" => 2.84
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.95,
          "dt" => 1_720_026_000,
          "feels_like" => 82.98,
          "humidity" => 66,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 80.35,
          "uvi" => 8.8,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 340,
          "wind_gust" => 4.09,
          "wind_speed" => 3.78
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.32,
          "dt" => 1_720_029_600,
          "feels_like" => 83.37,
          "humidity" => 63,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 80.91,
          "uvi" => 9.07,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 3,
          "wind_gust" => 4.03,
          "wind_speed" => 3.98
        },
        %{
          "clouds" => 100,
          "dew_point" => 66.81,
          "dt" => 1_720_033_200,
          "feels_like" => 84.61,
          "humidity" => 60,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 82.13,
          "uvi" => 4.94,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 30,
          "wind_gust" => 3.27,
          "wind_speed" => 3.51
        },
        %{
          "clouds" => 100,
          "dew_point" => 66.49,
          "dt" => 1_720_036_800,
          "feels_like" => 86.11,
          "humidity" => 56,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 83.73,
          "uvi" => 5.52,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 22,
          "wind_gust" => 3.2,
          "wind_speed" => 2.91
        },
        %{
          "clouds" => 98,
          "dew_point" => 65.95,
          "dt" => 1_720_040_400,
          "feels_like" => 86.07,
          "humidity" => 55,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 83.88,
          "uvi" => 3.23,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 44,
          "wind_gust" => 2.93,
          "wind_speed" => 3.31
        },
        %{
          "clouds" => 96,
          "dew_point" => 66.22,
          "dt" => 1_720_044_000,
          "feels_like" => 86.07,
          "humidity" => 56,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 83.71,
          "uvi" => 2.04,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 64,
          "wind_gust" => 2.21,
          "wind_speed" => 2.95
        },
        %{
          "clouds" => 96,
          "dew_point" => 67.98,
          "dt" => 1_720_047_600,
          "feels_like" => 86.18,
          "humidity" => 60,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 83.17,
          "uvi" => 1.45,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 42,
          "wind_gust" => 3.09,
          "wind_speed" => 3.31
        },
        %{
          "clouds" => 96,
          "dew_point" => 70.86,
          "dt" => 1_720_051_200,
          "feels_like" => 85.17,
          "humidity" => 71,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 81.21,
          "uvi" => 0.38,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 83,
          "wind_gust" => 3.89,
          "wind_speed" => 3.69
        },
        %{
          "clouds" => 100,
          "dew_point" => 66.97,
          "dt" => 1_720_054_800,
          "feels_like" => 77.74,
          "humidity" => 71,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 77,
          "uvi" => 0.07,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 121,
          "wind_gust" => 3.6,
          "wind_speed" => 3.65
        },
        %{
          "clouds" => 100,
          "dew_point" => 64.99,
          "dt" => 1_720_058_400,
          "feels_like" => 76.37,
          "humidity" => 69,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 75.85,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 103,
          "wind_gust" => 5.14,
          "wind_speed" => 5.21
        },
        %{
          "clouds" => 100,
          "dew_point" => 65.1,
          "dt" => 1_720_062_000,
          "feels_like" => 75.18,
          "humidity" => 72,
          "pop" => 0.2,
          "pressure" => 1015,
          "rain" => %{"1h" => 0.1},
          "temp" => 74.64,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10n",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 174,
          "wind_gust" => 2.35,
          "wind_speed" => 2.66
        },
        %{
          "clouds" => 100,
          "dew_point" => 66.94,
          "dt" => 1_720_065_600,
          "feels_like" => 71.06,
          "humidity" => 90,
          "pop" => 1,
          "pressure" => 1016,
          "rain" => %{"1h" => 0.97},
          "temp" => 70.12,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10n",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 96,
          "wind_gust" => 8.37,
          "wind_speed" => 6.2
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.35,
          "dt" => 1_720_069_200,
          "feels_like" => 71.29,
          "humidity" => 91,
          "pop" => 1,
          "pressure" => 1016,
          "rain" => %{"1h" => 0.42},
          "temp" => 70.29,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10n",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 159,
          "wind_gust" => 8.66,
          "wind_speed" => 5.82
        },
        %{
          "clouds" => 100,
          "dew_point" => 66.02,
          "dt" => 1_720_072_800,
          "feels_like" => 69.22,
          "humidity" => 92,
          "pop" => 1,
          "pressure" => 1015,
          "rain" => %{"1h" => 0.36},
          "temp" => 68.36,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10n",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 191,
          "wind_gust" => 17.9,
          "wind_speed" => 8.88
        },
        %{
          "clouds" => 100,
          "dew_point" => 63.16,
          "dt" => 1_720_076_400,
          "feels_like" => 67.73,
          "humidity" => 87,
          "pop" => 0,
          "pressure" => 1015,
          "temp" => 67.23,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 191,
          "wind_gust" => 9.1,
          "wind_speed" => 6.06
        },
        %{
          "clouds" => 95,
          "dew_point" => 60.96,
          "dt" => 1_720_080_000,
          "feels_like" => 67.5,
          "humidity" => 80,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 67.3,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 173,
          "wind_gust" => 3.98,
          "wind_speed" => 4.47
        },
        %{
          "clouds" => 97,
          "dew_point" => 60.3,
          "dt" => 1_720_083_600,
          "feels_like" => 66.16,
          "humidity" => 81,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 66.06,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 160,
          "wind_gust" => 3.67,
          "wind_speed" => 4.61
        },
        %{
          "clouds" => 98,
          "dew_point" => 62.83,
          "dt" => 1_720_087_200,
          "feels_like" => 66.85,
          "humidity" => 88,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 66.38,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 176,
          "wind_gust" => 9.55,
          "wind_speed" => 5.79
        },
        %{
          "clouds" => 97,
          "dew_point" => 63.12,
          "dt" => 1_720_090_800,
          "feels_like" => 66.88,
          "humidity" => 89,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 66.36,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 215,
          "wind_gust" => 7.25,
          "wind_speed" => 4.18
        },
        %{
          "clouds" => 97,
          "dew_point" => 63.64,
          "dt" => 1_720_094_400,
          "feels_like" => 67.5,
          "humidity" => 89,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 66.92,
          "uvi" => 0.05,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 145,
          "wind_gust" => 5.53,
          "wind_speed" => 3.76
        },
        %{
          "clouds" => 100,
          "dew_point" => 64.36,
          "dt" => 1_720_098_000,
          "feels_like" => 67.8,
          "humidity" => 91,
          "pop" => 1,
          "pressure" => 1015,
          "rain" => %{"1h" => 0.33},
          "temp" => 67.12,
          "uvi" => 0.14,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 170,
          "wind_gust" => 11.05,
          "wind_speed" => 4.14
        },
        %{
          "clouds" => 100,
          "dew_point" => 63.82,
          "dt" => 1_720_101_600,
          "feels_like" => 68.31,
          "humidity" => 88,
          "pop" => 0.88,
          "pressure" => 1015,
          "temp" => 67.69,
          "uvi" => 0.26,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 53,
          "wind_gust" => 4.36,
          "wind_speed" => 3.27
        },
        %{
          "clouds" => 95,
          "dew_point" => 64.54,
          "dt" => 1_720_105_200,
          "feels_like" => 70.59,
          "humidity" => 83,
          "pop" => 0.69,
          "pressure" => 1014,
          "temp" => 70,
          "uvi" => 0.49,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 66,
          "wind_gust" => 7.27,
          "wind_speed" => 5.17
        },
        %{
          "clouds" => 71,
          "dew_point" => 65.93,
          "dt" => 1_720_108_800,
          "feels_like" => 75.22,
          "humidity" => 74,
          "pop" => 0.5,
          "pressure" => 1014,
          "temp" => 74.59,
          "uvi" => 0.6,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 101,
          "wind_gust" => 11.36,
          "wind_speed" => 9.28
        },
        %{
          "clouds" => 57,
          "dew_point" => 67.28,
          "dt" => 1_720_112_400,
          "feels_like" => 77.07,
          "humidity" => 74,
          "pop" => 0.27,
          "pressure" => 1013,
          "temp" => 76.26,
          "uvi" => 1.06,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 108,
          "wind_gust" => 12.91,
          "wind_speed" => 11.36
        },
        %{
          "clouds" => 50,
          "dew_point" => 69.15,
          "dt" => 1_720_116_000,
          "feels_like" => 78.94,
          "humidity" => 74,
          "pop" => 0.12,
          "pressure" => 1013,
          "temp" => 77.97,
          "uvi" => 1.62,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 126,
          "wind_gust" => 13.33,
          "wind_speed" => 11.92
        },
        %{
          "clouds" => 64,
          "dew_point" => 69.8,
          "dt" => 1_720_119_600,
          "feels_like" => 78.67,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 77.59,
          "uvi" => 2.4,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 137,
          "wind_gust" => 12.26,
          "wind_speed" => 12.03
        },
        %{
          "clouds" => 66,
          "dew_point" => 70.09,
          "dt" => 1_720_123_200,
          "feels_like" => 78.94,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 77.85,
          "uvi" => 2.35,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 148,
          "wind_gust" => 10.4,
          "wind_speed" => 10.16
        },
        %{
          "clouds" => 67,
          "dew_point" => 70.3,
          "dt" => 1_720_126_800,
          "feels_like" => 79.59,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 78.42,
          "uvi" => 1.84,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 165,
          "wind_gust" => 10.47,
          "wind_speed" => 9.98
        },
        %{
          "clouds" => 74,
          "dew_point" => 70.66,
          "dt" => 1_720_130_400,
          "feels_like" => 78.87,
          "humidity" => 79,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 77.68,
          "uvi" => 1.61,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 180,
          "wind_gust" => 11.34,
          "wind_speed" => 8.46
        },
        %{
          "clouds" => 75,
          "dew_point" => 71.71,
          "dt" => 1_720_134_000,
          "feels_like" => 78.85,
          "humidity" => 82,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 77.54,
          "uvi" => 0.93,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 204,
          "wind_gust" => 13.27,
          "wind_speed" => 7
        },
        %{
          "clouds" => 73,
          "dew_point" => 72.14,
          "dt" => 1_720_137_600,
          "feels_like" => 79.43,
          "humidity" => 82,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 78.06,
          "uvi" => 0.37,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 208,
          "wind_gust" => 10.4,
          "wind_speed" => 5.21
        }
      ],
      "lat" => 42.3871,
      "lon" => -87.9562,
      "minutely" => [
        %{"dt" => 1_719_970_080, "precipitation" => 34.5082},
        %{"dt" => 1_719_970_140, "precipitation" => 35.4856},
        %{"dt" => 1_719_970_200, "precipitation" => 36.463},
        %{"dt" => 1_719_970_260, "precipitation" => 32.7216},
        %{"dt" => 1_719_970_320, "precipitation" => 28.9802},
        %{"dt" => 1_719_970_380, "precipitation" => 25.2388},
        %{"dt" => 1_719_970_440, "precipitation" => 21.4974},
        %{"dt" => 1_719_970_500, "precipitation" => 17.756},
        %{"dt" => 1_719_970_560, "precipitation" => 16.8678},
        %{"dt" => 1_719_970_620, "precipitation" => 15.9796},
        %{"dt" => 1_719_970_680, "precipitation" => 15.0914},
        %{"dt" => 1_719_970_740, "precipitation" => 14.2032},
        %{"dt" => 1_719_970_800, "precipitation" => 13.315},
        %{"dt" => 1_719_970_860, "precipitation" => 14.2032},
        %{"dt" => 1_719_970_920, "precipitation" => 15.0914},
        %{"dt" => 1_719_970_980, "precipitation" => 15.9796},
        %{"dt" => 1_719_971_040, "precipitation" => 16.8678},
        %{"dt" => 1_719_971_100, "precipitation" => 17.756},
        %{"dt" => 1_719_971_160, "precipitation" => 17.756},
        %{"dt" => 1_719_971_220, "precipitation" => 17.756},
        %{"dt" => 1_719_971_280, "precipitation" => 17.756},
        %{"dt" => 1_719_971_340, "precipitation" => 17.756},
        %{"dt" => 1_719_971_400, "precipitation" => 17.756},
        %{"dt" => 1_719_971_460, "precipitation" => 21.4974},
        %{"dt" => 1_719_971_520, "precipitation" => 25.2388},
        %{"dt" => 1_719_971_580, "precipitation" => 28.9802},
        %{"dt" => 1_719_971_640, "precipitation" => 32.7216},
        %{"dt" => 1_719_971_700, "precipitation" => 36.463},
        %{"dt" => 1_719_971_760, "precipitation" => 31.1674},
        %{"dt" => 1_719_971_820, "precipitation" => 25.8718},
        %{"dt" => 1_719_971_880, "precipitation" => 20.5762},
        %{"dt" => 1_719_971_940, "precipitation" => 15.2806},
        %{"dt" => 1_719_972_000, "precipitation" => 9.985},
        %{"dt" => 1_719_972_060, "precipitation" => 11.5392},
        %{"dt" => 1_719_972_120, "precipitation" => 13.0934},
        %{"dt" => 1_719_972_180, "precipitation" => 14.6476},
        %{"dt" => 1_719_972_240, "precipitation" => 16.2018},
        %{"dt" => 1_719_972_300, "precipitation" => 17.756},
        %{"dt" => 1_719_972_360, "precipitation" => 22.6262},
        %{"dt" => 1_719_972_420, "precipitation" => 27.4964},
        %{"dt" => 1_719_972_480, "precipitation" => 32.3666},
        %{"dt" => 1_719_972_540, "precipitation" => 37.2368},
        %{"dt" => 1_719_972_600, "precipitation" => 42.107},
        %{"dt" => 1_719_972_660, "precipitation" => 40.9782},
        %{"dt" => 1_719_972_720, "precipitation" => 39.8494},
        %{"dt" => 1_719_972_780, "precipitation" => 38.7206},
        %{"dt" => 1_719_972_840, "precipitation" => 37.5918},
        %{"dt" => 1_719_972_900, "precipitation" => 36.463},
        %{"dt" => 1_719_972_960, "precipitation" => 34.6392},
        %{"dt" => 1_719_973_020, "precipitation" => 32.8154},
        %{"dt" => 1_719_973_080, "precipitation" => 30.9916},
        %{"dt" => 1_719_973_140, "precipitation" => 29.1678},
        %{"dt" => 1_719_973_200, "precipitation" => 27.344},
        %{"dt" => 1_719_973_260, "precipitation" => 27.344},
        %{"dt" => 1_719_973_320, "precipitation" => 27.344},
        %{"dt" => 1_719_973_380, "precipitation" => 27.344},
        %{"dt" => 1_719_973_440, "precipitation" => 27.344},
        %{"dt" => 1_719_973_500, "precipitation" => 27.344},
        %{"dt" => 1_719_973_560, "precipitation" => 30.2966},
        %{"dt" => 1_719_973_620, "precipitation" => 33.2492}
      ],
      "timezone" => "America/Chicago",
      "timezone_offset" => -18_000
    }
  end
end
