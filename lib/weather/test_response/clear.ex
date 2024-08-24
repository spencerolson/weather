defmodule Weather.TestResponse.Clear do
  @moduledoc false

  @spec response() :: map()
  def response do
    %{
      "current" => %{
        "clouds" => 40,
        "dew_point" => 48.92,
        "dt" => 1_717_793_218,
        "feels_like" => 76.33,
        "humidity" => 37,
        "pressure" => 1009,
        "sunrise" => 1_717_755_455,
        "sunset" => 1_717_809_921,
        "temp" => 77.18,
        "uvi" => 4.44,
        "visibility" => 10_000,
        "weather" => [
          %{
            "description" => "scattered clouds",
            "icon" => "03d",
            "id" => 802,
            "main" => "Clouds"
          }
        ],
        "wind_deg" => 300,
        "wind_gust" => 33.38,
        "wind_speed" => 19.57
      },
      "daily" => [
        %{
          "clouds" => 9,
          "dew_point" => 50.36,
          "dt" => 1_717_779_600,
          "feels_like" => %{
            "day" => 72.01,
            "eve" => 73.47,
            "morn" => 54.95,
            "night" => 60.31
          },
          "humidity" => 45,
          "moon_phase" => 0.5,
          "moonrise" => 1_717_757_280,
          "moonset" => 1_717_816_500,
          "pop" => 0,
          "pressure" => 1009,
          "summary" =>
            "You can expect clear sky in the morning, with partly cloudy in the afternoon",
          "sunrise" => 1_717_755_455,
          "sunset" => 1_717_809_921,
          "temp" => %{
            "day" => 72.91,
            "eve" => 74.23,
            "max" => 77.18,
            "min" => 55.62,
            "morn" => 55.81,
            "night" => 60.91
          },
          "uvi" => 8.76,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 300,
          "wind_gust" => 33.02,
          "wind_speed" => 18.34
        },
        %{
          "clouds" => 94,
          "dew_point" => 56.75,
          "dt" => 1_717_866_000,
          "feels_like" => %{
            "day" => 68.49,
            "eve" => 63.88,
            "morn" => 56.8,
            "night" => 58.21
          },
          "humidity" => 65,
          "moon_phase" => 0.08,
          "moonrise" => 1_717_847_340,
          "moonset" => 1_717_905_840,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => 0.65,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_717_841_841,
          "sunset" => 1_717_896_357,
          "temp" => %{
            "day" => 68.85,
            "eve" => 63.55,
            "max" => 73.15,
            "min" => 56.66,
            "morn" => 57.79,
            "night" => 58.39
          },
          "uvi" => 8.95,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 215,
          "wind_gust" => 19.46,
          "wind_speed" => 12.93
        },
        %{
          "clouds" => 79,
          "dew_point" => 47.59,
          "dt" => 1_717_952_400,
          "feels_like" => %{
            "day" => 70.2,
            "eve" => 66.99,
            "morn" => 53.26,
            "night" => 57.24
          },
          "humidity" => 43,
          "moon_phase" => 0.11,
          "moonrise" => 1_717_937_760,
          "moonset" => 1_717_994_520,
          "pop" => 0,
          "pressure" => 1013,
          "summary" => "Expect a day of partly cloudy with clear spells",
          "sunrise" => 1_717_928_230,
          "sunset" => 1_717_982_791,
          "temp" => %{
            "day" => 71.35,
            "eve" => 67.57,
            "max" => 72.25,
            "min" => 53.92,
            "morn" => 54.07,
            "night" => 58.06
          },
          "uvi" => 8.38,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 301,
          "wind_gust" => 31.03,
          "wind_speed" => 18.3
        },
        %{
          "clouds" => 35,
          "dew_point" => 45.43,
          "dt" => 1_718_038_800,
          "feels_like" => %{
            "day" => 60.76,
            "eve" => 63,
            "morn" => 49.53,
            "night" => 54.7
          },
          "humidity" => 54,
          "moon_phase" => 0.14,
          "moonrise" => 1_718_028_240,
          "moonset" => 0,
          "pop" => 0,
          "pressure" => 1016,
          "summary" => "Expect a day of partly cloudy with clear spells",
          "sunrise" => 1_718_014_620,
          "sunset" => 1_718_069_223,
          "temp" => %{
            "day" => 62.29,
            "eve" => 64.24,
            "max" => 68.05,
            "min" => 50.85,
            "morn" => 50.85,
            "night" => 56.48
          },
          "uvi" => 7.22,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 12,
          "wind_gust" => 17.74,
          "wind_speed" => 10.69
        },
        %{
          "clouds" => 98,
          "dew_point" => 36.9,
          "dt" => 1_718_125_200,
          "feels_like" => %{
            "day" => 68.11,
            "eve" => 66.83,
            "morn" => 51.8,
            "night" => 59.65
          },
          "humidity" => 31,
          "moon_phase" => 0.17,
          "moonrise" => 1_718_118_600,
          "moonset" => 1_718_082_660,
          "pop" => 0,
          "pressure" => 1016,
          "summary" => "There will be clear sky until morning, then partly cloudy",
          "sunrise" => 1_718_101_012,
          "sunset" => 1_718_155_654,
          "temp" => %{
            "day" => 69.96,
            "eve" => 67.77,
            "max" => 70.84,
            "min" => 51.17,
            "morn" => 54.1,
            "night" => 61.16
          },
          "uvi" => 8.37,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 241,
          "wind_gust" => 8.01,
          "wind_speed" => 7.31
        },
        %{
          "clouds" => 0,
          "dew_point" => 55.17,
          "dt" => 1_718_211_600,
          "feels_like" => %{
            "day" => 76.08,
            "eve" => 75.99,
            "morn" => 57.56,
            "night" => 69.31
          },
          "humidity" => 48,
          "moon_phase" => 0.2,
          "moonrise" => 1_718_208_900,
          "moonset" => 1_718_170_500,
          "pop" => 0,
          "pressure" => 1015,
          "summary" => "Expect a day of partly cloudy with clear spells",
          "sunrise" => 1_718_187_407,
          "sunset" => 1_718_242_083,
          "temp" => %{
            "day" => 76.48,
            "eve" => 75.63,
            "max" => 78.42,
            "min" => 56.16,
            "morn" => 58.82,
            "night" => 68.92
          },
          "uvi" => 0.57,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 217,
          "wind_gust" => 19.64,
          "wind_speed" => 9.15
        },
        %{
          "clouds" => 41,
          "dew_point" => 67.66,
          "dt" => 1_718_298_000,
          "feels_like" => %{
            "day" => 84.92,
            "eve" => 78.26,
            "morn" => 67.82,
            "night" => 73.15
          },
          "humidity" => 62,
          "moon_phase" => 0.23,
          "moonrise" => 1_718_298_960,
          "moonset" => 1_718_258_160,
          "pop" => 1,
          "pressure" => 1011,
          "rain" => 12.66,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_718_273_803,
          "sunset" => 1_718_328_510,
          "temp" => %{
            "day" => 82.08,
            "eve" => 77.22,
            "max" => 82.08,
            "min" => 65.62,
            "morn" => 67.48,
            "night" => 71.89
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10d",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 237,
          "wind_gust" => 29.39,
          "wind_speed" => 14.5
        },
        %{
          "clouds" => 0,
          "dew_point" => 59.02,
          "dt" => 1_718_384_400,
          "feels_like" => %{
            "day" => 76.59,
            "eve" => 72.97,
            "morn" => 63.28,
            "night" => 64.17
          },
          "humidity" => 54,
          "moon_phase" => 0.25,
          "moonrise" => 1_718_389_020,
          "moonset" => 1_718_345_640,
          "pop" => 1,
          "pressure" => 1014,
          "rain" => 0.48,
          "summary" => "There will be rain until morning, then clearing",
          "sunrise" => 1_718_360_201,
          "sunset" => 1_718_414_936,
          "temp" => %{
            "day" => 76.68,
            "eve" => 72.97,
            "max" => 77.85,
            "min" => 63.09,
            "morn" => 63.09,
            "night" => 64.62
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 326,
          "wind_gust" => 23.38,
          "wind_speed" => 13.29
        }
      ],
      "hourly" => [
        %{
          "clouds" => 32,
          "dew_point" => 49.51,
          "dt" => 1_717_790_400,
          "feels_like" => 75.42,
          "humidity" => 39,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 76.26,
          "uvi" => 6.4,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 306,
          "wind_gust" => 23.49,
          "wind_speed" => 16.42
        },
        %{
          "clouds" => 40,
          "dew_point" => 48.92,
          "dt" => 1_717_794_000,
          "feels_like" => 76.33,
          "humidity" => 37,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 77.18,
          "uvi" => 4.44,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 306,
          "wind_gust" => 21.41,
          "wind_speed" => 14.74
        },
        %{
          "clouds" => 32,
          "dew_point" => 50.09,
          "dt" => 1_717_797_600,
          "feels_like" => 75.33,
          "humidity" => 40,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 76.14,
          "uvi" => 2.57,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 308,
          "wind_gust" => 20.42,
          "wind_speed" => 13.35
        },
        %{
          "clouds" => 32,
          "dew_point" => 51.55,
          "dt" => 1_717_801_200,
          "feels_like" => 73.47,
          "humidity" => 45,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 74.23,
          "uvi" => 0.95,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 313,
          "wind_gust" => 19.37,
          "wind_speed" => 11.27
        },
        %{
          "clouds" => 36,
          "dew_point" => 53.38,
          "dt" => 1_717_804_800,
          "feels_like" => 70.72,
          "humidity" => 53,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 71.38,
          "uvi" => 0.28,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 307,
          "wind_gust" => 17.43,
          "wind_speed" => 8.23
        },
        %{
          "clouds" => 88,
          "dew_point" => 54.61,
          "dt" => 1_717_808_400,
          "feels_like" => 67.06,
          "humidity" => 63,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 67.64,
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
          "wind_deg" => 300,
          "wind_gust" => 13.15,
          "wind_speed" => 6.31
        },
        %{
          "clouds" => 100,
          "dew_point" => 54.3,
          "dt" => 1_717_812_000,
          "feels_like" => 62.98,
          "humidity" => 72,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 63.54,
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
          "wind_deg" => 293,
          "wind_gust" => 12.1,
          "wind_speed" => 5.57
        },
        %{
          "clouds" => 100,
          "dew_point" => 54.1,
          "dt" => 1_717_815_600,
          "feels_like" => 61.66,
          "humidity" => 75,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 62.22,
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
          "wind_deg" => 282,
          "wind_gust" => 9.8,
          "wind_speed" => 4.99
        },
        %{
          "clouds" => 100,
          "dew_point" => 53.67,
          "dt" => 1_717_819_200,
          "feels_like" => 60.31,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 60.91,
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
          "wind_deg" => 325,
          "wind_gust" => 7.31,
          "wind_speed" => 3.38
        },
        %{
          "clouds" => 95,
          "dew_point" => 53.19,
          "dt" => 1_717_822_800,
          "feels_like" => 59.4,
          "humidity" => 78,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 60.03,
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
          "wind_deg" => 326,
          "wind_gust" => 2.26,
          "wind_speed" => 2.21
        },
        %{
          "clouds" => 98,
          "dew_point" => 52.32,
          "dt" => 1_717_826_400,
          "feels_like" => 58.66,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 59.4,
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
          "wind_deg" => 275,
          "wind_gust" => 4.94,
          "wind_speed" => 4.25
        },
        %{
          "clouds" => 100,
          "dew_point" => 51.57,
          "dt" => 1_717_830_000,
          "feels_like" => 57.69,
          "humidity" => 78,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 58.48,
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
          "wind_deg" => 251,
          "wind_gust" => 5.93,
          "wind_speed" => 4.29
        },
        %{
          "clouds" => 87,
          "dew_point" => 50.67,
          "dt" => 1_717_833_600,
          "feels_like" => 56.68,
          "humidity" => 78,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 57.56,
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
          "wind_deg" => 268,
          "wind_gust" => 6.15,
          "wind_speed" => 4.38
        },
        %{
          "clouds" => 96,
          "dew_point" => 50.02,
          "dt" => 1_717_837_200,
          "feels_like" => 56.14,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 57.11,
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
          "wind_deg" => 240,
          "wind_gust" => 10.54,
          "wind_speed" => 5.75
        },
        %{
          "clouds" => 97,
          "dew_point" => 49.57,
          "dt" => 1_717_840_800,
          "feels_like" => 55.65,
          "humidity" => 77,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 56.66,
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
          "wind_deg" => 233,
          "wind_gust" => 7.81,
          "wind_speed" => 4.63
        },
        %{
          "clouds" => 98,
          "dew_point" => 49.75,
          "dt" => 1_717_844_400,
          "feels_like" => 56.8,
          "humidity" => 75,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 57.79,
          "uvi" => 0.09,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 205,
          "wind_gust" => 3.65,
          "wind_speed" => 3.06
        },
        %{
          "clouds" => 98,
          "dew_point" => 50.81,
          "dt" => 1_717_848_000,
          "feels_like" => 59.54,
          "humidity" => 71,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 60.46,
          "uvi" => 0.25,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 217,
          "wind_gust" => 3.31,
          "wind_speed" => 2.24
        },
        %{
          "clouds" => 100,
          "dew_point" => 51.4,
          "dt" => 1_717_851_600,
          "feels_like" => 59.86,
          "humidity" => 71,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 60.75,
          "uvi" => 0.41,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 197,
          "wind_gust" => 5.97,
          "wind_speed" => 3.47
        },
        %{
          "clouds" => 81,
          "dew_point" => 52.57,
          "dt" => 1_717_855_200,
          "feels_like" => 66.56,
          "humidity" => 59,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 67.35,
          "uvi" => 3.1,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 196,
          "wind_gust" => 9.17,
          "wind_speed" => 5.5
        },
        %{
          "clouds" => 88,
          "dew_point" => 54.07,
          "dt" => 1_717_858_800,
          "feels_like" => 67.24,
          "humidity" => 61,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 67.89,
          "uvi" => 2.18,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 200,
          "wind_gust" => 10.78,
          "wind_speed" => 6.58
        },
        %{
          "clouds" => 92,
          "dew_point" => 56.16,
          "dt" => 1_717_862_400,
          "feels_like" => 67.73,
          "humidity" => 65,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 68.16,
          "uvi" => 4.71,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 204,
          "wind_gust" => 11.52,
          "wind_speed" => 7.81
        },
        %{
          "clouds" => 94,
          "dew_point" => 56.75,
          "dt" => 1_717_866_000,
          "feels_like" => 68.49,
          "humidity" => 65,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 68.85,
          "uvi" => 5,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 201,
          "wind_gust" => 13.51,
          "wind_speed" => 8.99
        },
        %{
          "clouds" => 91,
          "dew_point" => 58.1,
          "dt" => 1_717_869_600,
          "feels_like" => 71.76,
          "humidity" => 62,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 71.96,
          "uvi" => 8.95,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 203,
          "wind_gust" => 13.94,
          "wind_speed" => 9.78
        },
        %{
          "clouds" => 63,
          "dew_point" => 60.91,
          "dt" => 1_717_873_200,
          "feels_like" => 73.26,
          "humidity" => 66,
          "pop" => 0.48,
          "pressure" => 1009,
          "temp" => 73.15,
          "uvi" => 8.17,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 215,
          "wind_gust" => 15.95,
          "wind_speed" => 12.93
        },
        %{
          "clouds" => 82,
          "dew_point" => 61.03,
          "dt" => 1_717_876_800,
          "feels_like" => 65.39,
          "humidity" => 86,
          "pop" => 0.59,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.12},
          "temp" => 65.14,
          "uvi" => 0.91,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 218,
          "wind_gust" => 19.46,
          "wind_speed" => 10.98
        },
        %{
          "clouds" => 88,
          "dew_point" => 61.21,
          "dt" => 1_717_880_400,
          "feels_like" => 64.02,
          "humidity" => 91,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.24},
          "temp" => 63.68,
          "uvi" => 0.47,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 213,
          "wind_gust" => 17.65,
          "wind_speed" => 8.43
        },
        %{
          "clouds" => 91,
          "dew_point" => 60.8,
          "dt" => 1_717_884_000,
          "feels_like" => 64.31,
          "humidity" => 90,
          "pop" => 0.85,
          "pressure" => 1009,
          "temp" => 63.99,
          "uvi" => 0.73,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 216,
          "wind_gust" => 17.09,
          "wind_speed" => 8.9
        },
        %{
          "clouds" => 93,
          "dew_point" => 60.87,
          "dt" => 1_717_887_600,
          "feels_like" => 63.88,
          "humidity" => 91,
          "pop" => 0.63,
          "pressure" => 1009,
          "temp" => 63.55,
          "uvi" => 0.52,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 225,
          "wind_gust" => 15.39,
          "wind_speed" => 7.96
        },
        %{
          "clouds" => 94,
          "dew_point" => 61.5,
          "dt" => 1_717_891_200,
          "feels_like" => 63.86,
          "humidity" => 93,
          "pop" => 0.3,
          "pressure" => 1010,
          "temp" => 63.45,
          "uvi" => 0.12,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 253,
          "wind_gust" => 14.36,
          "wind_speed" => 7.36
        },
        %{
          "clouds" => 100,
          "dew_point" => 61.05,
          "dt" => 1_717_894_800,
          "feels_like" => 63.14,
          "humidity" => 94,
          "pop" => 0.47,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.14},
          "temp" => 62.74,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 309,
          "wind_gust" => 14.38,
          "wind_speed" => 6.49
        },
        %{
          "clouds" => 100,
          "dew_point" => 58.71,
          "dt" => 1_717_898_400,
          "feels_like" => 60.89,
          "humidity" => 92,
          "pop" => 0.9,
          "pressure" => 1011,
          "rain" => %{"1h" => 0.15},
          "temp" => 60.78,
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
          "wind_deg" => 0,
          "wind_gust" => 16.64,
          "wind_speed" => 8.3
        },
        %{
          "clouds" => 100,
          "dew_point" => 57.24,
          "dt" => 1_717_902_000,
          "feels_like" => 59.99,
          "humidity" => 90,
          "pop" => 0.27,
          "pressure" => 1011,
          "temp" => 60.06,
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
          "wind_deg" => 26,
          "wind_gust" => 17.63,
          "wind_speed" => 7.29
        },
        %{
          "clouds" => 100,
          "dew_point" => 55.71,
          "dt" => 1_717_905_600,
          "feels_like" => 58.21,
          "humidity" => 91,
          "pop" => 0.04,
          "pressure" => 1011,
          "temp" => 58.39,
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
          "wind_deg" => 9,
          "wind_gust" => 13.24,
          "wind_speed" => 4.81
        },
        %{
          "clouds" => 83,
          "dew_point" => 55.26,
          "dt" => 1_717_909_200,
          "feels_like" => 56.89,
          "humidity" => 93,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 57.11,
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
          "wind_deg" => 346,
          "wind_gust" => 9.51,
          "wind_speed" => 4.25
        },
        %{
          "clouds" => 69,
          "dew_point" => 54.63,
          "dt" => 1_717_912_800,
          "feels_like" => 56.16,
          "humidity" => 94,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 56.39,
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
          "wind_deg" => 316,
          "wind_gust" => 8.16,
          "wind_speed" => 4.74
        },
        %{
          "clouds" => 0,
          "dew_point" => 53.62,
          "dt" => 1_717_916_400,
          "feels_like" => 55.02,
          "humidity" => 94,
          "pop" => 0,
          "pressure" => 1011,
          "temp" => 55.36,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01n",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 325,
          "wind_gust" => 12.06,
          "wind_speed" => 5.1
        },
        %{
          "clouds" => 8,
          "dew_point" => 52.77,
          "dt" => 1_717_920_000,
          "feels_like" => 54.39,
          "humidity" => 92,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 54.88,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01n",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 301,
          "wind_gust" => 10.87,
          "wind_speed" => 5.01
        },
        %{
          "clouds" => 31,
          "dew_point" => 51.89,
          "dt" => 1_717_923_600,
          "feels_like" => 53.92,
          "humidity" => 91,
          "pop" => 0,
          "pressure" => 1012,
          "temp" => 54.5,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03n",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 305,
          "wind_gust" => 13.02,
          "wind_speed" => 5.3
        },
        %{
          "clouds" => 48,
          "dew_point" => 50.72,
          "dt" => 1_717_927_200,
          "feels_like" => 53.2,
          "humidity" => 89,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 53.92,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03n",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 277,
          "wind_gust" => 12.66,
          "wind_speed" => 5.82
        },
        %{
          "clouds" => 53,
          "dew_point" => 50.29,
          "dt" => 1_717_930_800,
          "feels_like" => 53.26,
          "humidity" => 87,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 54.07,
          "uvi" => 0.12,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 293,
          "wind_gust" => 17.34,
          "wind_speed" => 6.22
        },
        %{
          "clouds" => 44,
          "dew_point" => 50.56,
          "dt" => 1_717_934_400,
          "feels_like" => 56.17,
          "humidity" => 79,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 57.06,
          "uvi" => 0.54,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 305,
          "wind_gust" => 20.89,
          "wind_speed" => 7.74
        },
        %{
          "clouds" => 34,
          "dew_point" => 50.13,
          "dt" => 1_717_938_000,
          "feels_like" => 59.56,
          "humidity" => 68,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 60.6,
          "uvi" => 1.49,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "scattered clouds",
              "icon" => "03d",
              "id" => 802,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 307,
          "wind_gust" => 20.15,
          "wind_speed" => 10.27
        },
        %{
          "clouds" => 73,
          "dew_point" => 50.63,
          "dt" => 1_717_941_600,
          "feels_like" => 62.62,
          "humidity" => 63,
          "pop" => 0,
          "pressure" => 1014,
          "temp" => 63.59,
          "uvi" => 3,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 308,
          "wind_gust" => 17.78,
          "wind_speed" => 10.71
        },
        %{
          "clouds" => 66,
          "dew_point" => 50.94,
          "dt" => 1_717_945_200,
          "feels_like" => 65.59,
          "humidity" => 57,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 66.56,
          "uvi" => 4.86,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 316,
          "wind_gust" => 17.96,
          "wind_speed" => 11.16
        },
        %{
          "clouds" => 77,
          "dew_point" => 49.28,
          "dt" => 1_717_948_800,
          "feels_like" => 68.09,
          "humidity" => 49,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 69.17,
          "uvi" => 6.64,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 306,
          "wind_gust" => 16.75,
          "wind_speed" => 11.61
        },
        %{
          "clouds" => 79,
          "dew_point" => 47.59,
          "dt" => 1_717_952_400,
          "feels_like" => 70.2,
          "humidity" => 43,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 71.35,
          "uvi" => 8.01,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 301,
          "wind_gust" => 24.9,
          "wind_speed" => 11.48
        },
        %{
          "clouds" => 66,
          "dew_point" => 48.22,
          "dt" => 1_717_956_000,
          "feels_like" => 71.19,
          "humidity" => 43,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 72.25,
          "uvi" => 8.38,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 297,
          "wind_gust" => 25.79,
          "wind_speed" => 14.79
        },
        %{
          "clouds" => 0,
          "dew_point" => 48.83,
          "dt" => 1_717_959_600,
          "feels_like" => 71.19,
          "humidity" => 43,
          "pop" => 0,
          "pressure" => 1013,
          "temp" => 72.25,
          "uvi" => 7.71,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 297,
          "wind_gust" => 27.34,
          "wind_speed" => 17.16
        }
      ],
      "lat" => 42.3871,
      "lon" => -87.9562,
      "minutely" => [
        %{"dt" => 1_717_793_220, "precipitation" => 0},
        %{"dt" => 1_717_793_280, "precipitation" => 0},
        %{"dt" => 1_717_793_340, "precipitation" => 0},
        %{"dt" => 1_717_793_400, "precipitation" => 0},
        %{"dt" => 1_717_793_460, "precipitation" => 0},
        %{"dt" => 1_717_793_520, "precipitation" => 0},
        %{"dt" => 1_717_793_580, "precipitation" => 0},
        %{"dt" => 1_717_793_640, "precipitation" => 0},
        %{"dt" => 1_717_793_700, "precipitation" => 0},
        %{"dt" => 1_717_793_760, "precipitation" => 0},
        %{"dt" => 1_717_793_820, "precipitation" => 0},
        %{"dt" => 1_717_793_880, "precipitation" => 0},
        %{"dt" => 1_717_793_940, "precipitation" => 0},
        %{"dt" => 1_717_794_000, "precipitation" => 0},
        %{"dt" => 1_717_794_060, "precipitation" => 0},
        %{"dt" => 1_717_794_120, "precipitation" => 0},
        %{"dt" => 1_717_794_180, "precipitation" => 0},
        %{"dt" => 1_717_794_240, "precipitation" => 0},
        %{"dt" => 1_717_794_300, "precipitation" => 0},
        %{"dt" => 1_717_794_360, "precipitation" => 0},
        %{"dt" => 1_717_794_420, "precipitation" => 0},
        %{"dt" => 1_717_794_480, "precipitation" => 0},
        %{"dt" => 1_717_794_540, "precipitation" => 0},
        %{"dt" => 1_717_794_600, "precipitation" => 0},
        %{"dt" => 1_717_794_660, "precipitation" => 0},
        %{"dt" => 1_717_794_720, "precipitation" => 0},
        %{"dt" => 1_717_794_780, "precipitation" => 0},
        %{"dt" => 1_717_794_840, "precipitation" => 0},
        %{"dt" => 1_717_794_900, "precipitation" => 0},
        %{"dt" => 1_717_794_960, "precipitation" => 0},
        %{"dt" => 1_717_795_020, "precipitation" => 0},
        %{"dt" => 1_717_795_080, "precipitation" => 0},
        %{"dt" => 1_717_795_140, "precipitation" => 0},
        %{"dt" => 1_717_795_200, "precipitation" => 0},
        %{"dt" => 1_717_795_260, "precipitation" => 0},
        %{"dt" => 1_717_795_320, "precipitation" => 0},
        %{"dt" => 1_717_795_380, "precipitation" => 0},
        %{"dt" => 1_717_795_440, "precipitation" => 0},
        %{"dt" => 1_717_795_500, "precipitation" => 0},
        %{"dt" => 1_717_795_560, "precipitation" => 0},
        %{"dt" => 1_717_795_620, "precipitation" => 0},
        %{"dt" => 1_717_795_680, "precipitation" => 0},
        %{"dt" => 1_717_795_740, "precipitation" => 0},
        %{"dt" => 1_717_795_800, "precipitation" => 0},
        %{"dt" => 1_717_795_860, "precipitation" => 0},
        %{"dt" => 1_717_795_920, "precipitation" => 0},
        %{"dt" => 1_717_795_980, "precipitation" => 0},
        %{"dt" => 1_717_796_040, "precipitation" => 0},
        %{"dt" => 1_717_796_100, "precipitation" => 0},
        %{"dt" => 1_717_796_160, "precipitation" => 0},
        %{"dt" => 1_717_796_220, "precipitation" => 0},
        %{"dt" => 1_717_796_280, "precipitation" => 0},
        %{"dt" => 1_717_796_340, "precipitation" => 0},
        %{"dt" => 1_717_796_400, "precipitation" => 0},
        %{"dt" => 1_717_796_460, "precipitation" => 0},
        %{"dt" => 1_717_796_520, "precipitation" => 0},
        %{"dt" => 1_717_796_580, "precipitation" => 0},
        %{"dt" => 1_717_796_640, "precipitation" => 0},
        %{"dt" => 1_717_796_700, "precipitation" => 0},
        %{"dt" => 1_717_796_760, "precipitation" => 0}
      ],
      "timezone" => "America/Chicago",
      "timezone_offset" => -18_000
    }
  end
end
