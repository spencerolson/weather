defmodule Weather.TestResponse.Rain do
  @moduledoc false

  @spec response() :: map()
  def response do
    %{
      "current" => %{
        "clouds" => 100,
        "dew_point" => 63.79,
        "dt" => 1_723_724_857,
        "feels_like" => 66.83,
        "humidity" => 92,
        "pressure" => 1016,
        "rain" => %{"1h" => 1.54},
        "sunrise" => 1_723_719_666,
        "sunset" => 1_723_769_557,
        "temp" => 66.18,
        "uvi" => 0.06,
        "visibility" => 10_000,
        "weather" => [
          %{
            "description" => "moderate rain",
            "icon" => "10d",
            "id" => 501,
            "main" => "Rain"
          },
          %{
            "description" => "mist",
            "icon" => "50d",
            "id" => 701,
            "main" => "Mist"
          }
        ],
        "wind_deg" => 180,
        "wind_gust" => 20.71,
        "wind_speed" => 11.5
      },
      "daily" => [
        %{
          "clouds" => 100,
          "dew_point" => 61.63,
          "dt" => 1_723_741_200,
          "feels_like" => %{
            "day" => 65.08,
            "eve" => 72.18,
            "morn" => 67.17,
            "night" => 71.55
          },
          "humidity" => 90,
          "moon_phase" => 0.35,
          "moonrise" => 1_723_760_580,
          "moonset" => 1_723_700_940,
          "pop" => 1,
          "pressure" => 1014,
          "rain" => 12.44,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_723_719_666,
          "sunset" => 1_723_769_557,
          "temp" => %{
            "day" => 64.69,
            "eve" => 70.88,
            "max" => 72.64,
            "min" => 64.69,
            "morn" => 66.7,
            "night" => 70.21
          },
          "uvi" => 1.56,
          "weather" => [
            %{
              "description" => "heavy intensity rain",
              "icon" => "10d",
              "id" => 502,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 173,
          "wind_gust" => 32.57,
          "wind_speed" => 14.97
        },
        %{
          "clouds" => 63,
          "dew_point" => 67.41,
          "dt" => 1_723_827_600,
          "feels_like" => %{
            "day" => 83.61,
            "eve" => 79.47,
            "morn" => 68.49,
            "night" => 69.67
          },
          "humidity" => 63,
          "moon_phase" => 0.39,
          "moonrise" => 1_723_850_160,
          "moonset" => 1_723_790_880,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => 9.63,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_723_806_129,
          "sunset" => 1_723_855_871,
          "temp" => %{
            "day" => 81.07,
            "eve" => 79.47,
            "max" => 84.24,
            "min" => 67.3,
            "morn" => 67.39,
            "night" => 68.86
          },
          "uvi" => 7.13,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10d",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 244,
          "wind_gust" => 28.7,
          "wind_speed" => 12.53
        },
        %{
          "clouds" => 100,
          "dew_point" => 64.62,
          "dt" => 1_723_914_000,
          "feels_like" => %{
            "day" => 70.59,
            "eve" => 73.06,
            "morn" => 66.24,
            "night" => 67.46
          },
          "humidity" => 83,
          "moon_phase" => 0.42,
          "moonrise" => 1_723_939_260,
          "moonset" => 1_723_881_480,
          "pop" => 0.8,
          "pressure" => 1010,
          "summary" =>
            "You can expect partly cloudy in the morning, with clearing in the afternoon",
          "sunrise" => 1_723_892_592,
          "sunset" => 1_723_942_183,
          "temp" => %{
            "day" => 70,
            "eve" => 72.57,
            "max" => 74.44,
            "min" => 65.52,
            "morn" => 65.77,
            "night" => 66.76
          },
          "uvi" => 5.95,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 306,
          "wind_gust" => 25.46,
          "wind_speed" => 12.41
        },
        %{
          "clouds" => 99,
          "dew_point" => 62.22,
          "dt" => 1_724_000_400,
          "feels_like" => %{
            "day" => 70.68,
            "eve" => 69.78,
            "morn" => 63.75,
            "night" => 66.63
          },
          "humidity" => 75,
          "moon_phase" => 0.46,
          "moonrise" => 1_724_027_820,
          "moonset" => 1_723_972_500,
          "pop" => 1,
          "pressure" => 1013,
          "rain" => 2.29,
          "summary" => "Expect a day of partly cloudy with rain",
          "sunrise" => 1_723_979_055,
          "sunset" => 1_724_028_495,
          "temp" => %{
            "day" => 70.41,
            "eve" => 69.26,
            "max" => 71.94,
            "min" => 63.27,
            "morn" => 63.27,
            "night" => 66.43
          },
          "uvi" => 6.81,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 359,
          "wind_gust" => 23.69,
          "wind_speed" => 10.87
        },
        %{
          "clouds" => 0,
          "dew_point" => 54.03,
          "dt" => 1_724_086_800,
          "feels_like" => %{
            "day" => 77.23,
            "eve" => 70.05,
            "morn" => 59.5,
            "night" => 64.54
          },
          "humidity" => 44,
          "moon_phase" => 0.5,
          "moonrise" => 1_724_115_960,
          "moonset" => 1_724_063_820,
          "pop" => 0,
          "pressure" => 1019,
          "summary" => "There will be clear sky today",
          "sunrise" => 1_724_065_518,
          "sunset" => 1_724_114_805,
          "temp" => %{
            "day" => 77.7,
            "eve" => 70.48,
            "max" => 77.7,
            "min" => 59.86,
            "morn" => 59.86,
            "night" => 64.83
          },
          "uvi" => 0.2,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 13,
          "wind_gust" => 21.79,
          "wind_speed" => 12.82
        },
        %{
          "clouds" => 5,
          "dew_point" => 50.09,
          "dt" => 1_724_173_200,
          "feels_like" => %{
            "day" => 77.65,
            "eve" => 72.18,
            "morn" => 59.32,
            "night" => 64.49
          },
          "humidity" => 37,
          "moon_phase" => 0.54,
          "moonrise" => 1_724_203_920,
          "moonset" => 1_724_155_020,
          "pop" => 0,
          "pressure" => 1021,
          "summary" =>
            "You can expect clear sky in the morning, with partly cloudy in the afternoon",
          "sunrise" => 1_724_151_981,
          "sunset" => 1_724_201_115,
          "temp" => %{
            "day" => 78.37,
            "eve" => 72.63,
            "max" => 79.36,
            "min" => 60.22,
            "morn" => 60.22,
            "night" => 65.95
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
          "wind_deg" => 43,
          "wind_gust" => 12.88,
          "wind_speed" => 5.59
        },
        %{
          "clouds" => 56,
          "dew_point" => 52.21,
          "dt" => 1_724_259_600,
          "feels_like" => %{
            "day" => 75.72,
            "eve" => 73.29,
            "morn" => 57.27,
            "night" => 67.41
          },
          "humidity" => 43,
          "moon_phase" => 0.58,
          "moonrise" => 1_724_291_760,
          "moonset" => 1_724_246_220,
          "pop" => 0,
          "pressure" => 1021,
          "summary" => "Expect a day of partly cloudy with clear spells",
          "sunrise" => 1_724_238_443,
          "sunset" => 1_724_287_423,
          "temp" => %{
            "day" => 76.37,
            "eve" => 73.72,
            "max" => 78.66,
            "min" => 58.69,
            "morn" => 58.69,
            "night" => 68.29
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 208,
          "wind_gust" => 8.55,
          "wind_speed" => 7.29
        },
        %{
          "clouds" => 100,
          "dew_point" => 55.83,
          "dt" => 1_724_346_000,
          "feels_like" => %{
            "day" => 78.04,
            "eve" => 78.37,
            "morn" => 60.21,
            "night" => 72.09
          },
          "humidity" => 46,
          "moon_phase" => 0.61,
          "moonrise" => 1_724_379_600,
          "moonset" => 1_724_337_360,
          "pop" => 0,
          "pressure" => 1017,
          "summary" =>
            "The day will start with clear sky through the late morning hours, transitioning to partly cloudy",
          "sunrise" => 1_724_324_906,
          "sunset" => 1_724_373_731,
          "temp" => %{
            "day" => 78.35,
            "eve" => 77.92,
            "max" => 84.65,
            "min" => 61.23,
            "morn" => 61.23,
            "night" => 72
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 203,
          "wind_gust" => 21.47,
          "wind_speed" => 12.08
        }
      ],
      "hourly" => [
        %{
          "clouds" => 100,
          "dew_point" => 63.79,
          "dt" => 1_723_723_200,
          "feels_like" => 66.83,
          "humidity" => 92,
          "pop" => 0.26,
          "pressure" => 1016,
          "rain" => %{"1h" => 0.33},
          "temp" => 66.18,
          "uvi" => 0.06,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 164,
          "wind_gust" => 22.84,
          "wind_speed" => 7.31
        },
        %{
          "clouds" => 100,
          "dew_point" => 62.92,
          "dt" => 1_723_726_800,
          "feels_like" => 67.1,
          "humidity" => 88,
          "pop" => 0.6,
          "pressure" => 1016,
          "rain" => %{"1h" => 4.86},
          "temp" => 66.6,
          "uvi" => 0.12,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "heavy intensity rain",
              "icon" => "10d",
              "id" => 502,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 150,
          "wind_gust" => 23.49,
          "wind_speed" => 8.14
        },
        %{
          "clouds" => 100,
          "dew_point" => 61.83,
          "dt" => 1_723_730_400,
          "feels_like" => 67.14,
          "humidity" => 84,
          "pop" => 0.83,
          "pressure" => 1016,
          "temp" => 66.81,
          "uvi" => 0.55,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 175,
          "wind_gust" => 25.48,
          "wind_speed" => 9.24
        },
        %{
          "clouds" => 100,
          "dew_point" => 61.29,
          "dt" => 1_723_734_000,
          "feels_like" => 65.55,
          "humidity" => 87,
          "pop" => 1,
          "pressure" => 1015,
          "rain" => %{"1h" => 0.61},
          "temp" => 65.25,
          "uvi" => 0.16,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 149,
          "wind_gust" => 31.07,
          "wind_speed" => 13.24
        },
        %{
          "clouds" => 100,
          "dew_point" => 61.77,
          "dt" => 1_723_737_600,
          "feels_like" => 65.19,
          "humidity" => 90,
          "pop" => 1,
          "pressure" => 1015,
          "rain" => %{"1h" => 0.5},
          "temp" => 64.78,
          "uvi" => 0.21,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 159,
          "wind_gust" => 28.79,
          "wind_speed" => 10.65
        },
        %{
          "clouds" => 100,
          "dew_point" => 61.63,
          "dt" => 1_723_741_200,
          "feels_like" => 65.08,
          "humidity" => 90,
          "pop" => 0.8,
          "pressure" => 1014,
          "temp" => 64.69,
          "uvi" => 0.78,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 158,
          "wind_gust" => 32.14,
          "wind_speed" => 11.5
        },
        %{
          "clouds" => 100,
          "dew_point" => 63.07,
          "dt" => 1_723_744_800,
          "feels_like" => 67.46,
          "humidity" => 87,
          "pop" => 0.8,
          "pressure" => 1014,
          "temp" => 66.97,
          "uvi" => 0.29,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 171,
          "wind_gust" => 32.57,
          "wind_speed" => 12.24
        },
        %{
          "clouds" => 100,
          "dew_point" => 66.47,
          "dt" => 1_723_748_400,
          "feels_like" => 69.3,
          "humidity" => 94,
          "pop" => 1,
          "pressure" => 1013,
          "rain" => %{"1h" => 0.83},
          "temp" => 68.34,
          "uvi" => 0.26,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 171,
          "wind_gust" => 31.92,
          "wind_speed" => 12.8
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.78,
          "dt" => 1_723_752_000,
          "feels_like" => 72.59,
          "humidity" => 87,
          "pop" => 1,
          "pressure" => 1012,
          "rain" => %{"1h" => 0.41},
          "temp" => 71.64,
          "uvi" => 0.86,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 173,
          "wind_gust" => 30.49,
          "wind_speed" => 14.97
        },
        %{
          "clouds" => 100,
          "dew_point" => 68.67,
          "dt" => 1_723_755_600,
          "feels_like" => 73.74,
          "humidity" => 88,
          "pop" => 1,
          "pressure" => 1012,
          "rain" => %{"1h" => 0.3},
          "temp" => 72.64,
          "uvi" => 1.56,
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
          "wind_gust" => 26.28,
          "wind_speed" => 14.03
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.85,
          "dt" => 1_723_759_200,
          "feels_like" => 72.46,
          "humidity" => 95,
          "pop" => 1,
          "pressure" => 1011,
          "rain" => %{"1h" => 0.33},
          "temp" => 71.19,
          "uvi" => 0.57,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 173,
          "wind_gust" => 25.86,
          "wind_speed" => 12.66
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.6,
          "dt" => 1_723_762_800,
          "feels_like" => 72.18,
          "humidity" => 96,
          "pop" => 1,
          "pressure" => 1011,
          "rain" => %{"1h" => 0.34},
          "temp" => 70.88,
          "uvi" => 0.1,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 177,
          "wind_gust" => 24.65,
          "wind_speed" => 10.13
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.85,
          "dt" => 1_723_766_400,
          "feels_like" => 71.98,
          "humidity" => 97,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.98},
          "temp" => 70.65,
          "uvi" => 0.04,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 164,
          "wind_gust" => 22.03,
          "wind_speed" => 8.43
        },
        %{
          "clouds" => 99,
          "dew_point" => 70.38,
          "dt" => 1_723_770_000,
          "feels_like" => 72.36,
          "humidity" => 98,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.2},
          "temp" => 70.95,
          "uvi" => 0,
          "visibility" => 9609,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10n",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 151,
          "wind_gust" => 20.15,
          "wind_speed" => 8.55
        },
        %{
          "clouds" => 100,
          "dew_point" => 70.32,
          "dt" => 1_723_773_600,
          "feels_like" => 72.27,
          "humidity" => 98,
          "pop" => 0.67,
          "pressure" => 1011,
          "temp" => 70.88,
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
          "wind_deg" => 146,
          "wind_gust" => 20.02,
          "wind_speed" => 8.7
        },
        %{
          "clouds" => 100,
          "dew_point" => 70.38,
          "dt" => 1_723_777_200,
          "feels_like" => 72.14,
          "humidity" => 98,
          "pop" => 0.94,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.51},
          "temp" => 70.75,
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
          "wind_deg" => 148,
          "wind_gust" => 20.69,
          "wind_speed" => 9.17
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.6,
          "dt" => 1_723_780_800,
          "feels_like" => 71.55,
          "humidity" => 98,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 2.24},
          "temp" => 70.21,
          "uvi" => 0,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 158,
          "wind_gust" => 23.6,
          "wind_speed" => 10.54
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.62,
          "dt" => 1_723_784_400,
          "feels_like" => 71.38,
          "humidity" => 99,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 1.71},
          "temp" => 70.03,
          "uvi" => 0,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 172,
          "wind_gust" => 22.48,
          "wind_speed" => 8.99
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.24,
          "dt" => 1_723_788_000,
          "feels_like" => 70.99,
          "humidity" => 99,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 2.67},
          "temp" => 69.67,
          "uvi" => 0,
          "visibility" => 37,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 189,
          "wind_gust" => 22.79,
          "wind_speed" => 8.48
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.3,
          "dt" => 1_723_791_600,
          "feels_like" => 71.2,
          "humidity" => 98,
          "pop" => 1,
          "pressure" => 1010,
          "rain" => %{"1h" => 1.06},
          "temp" => 69.91,
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
          "wind_deg" => 192,
          "wind_gust" => 15.7,
          "wind_speed" => 6.67
        },
        %{
          "clouds" => 100,
          "dew_point" => 68.11,
          "dt" => 1_723_795_200,
          "feels_like" => 69.85,
          "humidity" => 98,
          "pop" => 0.8,
          "pressure" => 1009,
          "temp" => 68.68,
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
          "wind_gust" => 15.32,
          "wind_speed" => 8.43
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.15,
          "dt" => 1_723_798_800,
          "feels_like" => 68.5,
          "humidity" => 98,
          "pop" => 0.8,
          "pressure" => 1009,
          "temp" => 67.46,
          "uvi" => 0,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04n",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 197,
          "wind_gust" => 14.85,
          "wind_speed" => 6.89
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.05,
          "dt" => 1_723_802_400,
          "feels_like" => 68.38,
          "humidity" => 99,
          "pop" => 1,
          "pressure" => 1009,
          "rain" => %{"1h" => 0.29},
          "temp" => 67.3,
          "uvi" => 0,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10n",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 199,
          "wind_gust" => 13.78,
          "wind_speed" => 6.42
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.06,
          "dt" => 1_723_806_000,
          "feels_like" => 68.49,
          "humidity" => 99,
          "pop" => 1,
          "pressure" => 1009,
          "rain" => %{"1h" => 1.1},
          "temp" => 67.39,
          "uvi" => 0,
          "visibility" => 279,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 210,
          "wind_gust" => 15.55,
          "wind_speed" => 7.36
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.46,
          "dt" => 1_723_809_600,
          "feels_like" => 69.03,
          "humidity" => 98,
          "pop" => 1,
          "pressure" => 1009,
          "rain" => %{"1h" => 0.23},
          "temp" => 67.93,
          "uvi" => 0.2,
          "visibility" => 2032,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 227,
          "wind_gust" => 19.51,
          "wind_speed" => 8.88
        },
        %{
          "clouds" => 100,
          "dew_point" => 67.89,
          "dt" => 1_723_813_200,
          "feels_like" => 69.82,
          "humidity" => 97,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 68.68,
          "uvi" => 0.83,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 243,
          "wind_gust" => 19.26,
          "wind_speed" => 10
        },
        %{
          "clouds" => 100,
          "dew_point" => 68.5,
          "dt" => 1_723_816_800,
          "feels_like" => 71.6,
          "humidity" => 93,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 70.48,
          "uvi" => 2.13,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 258,
          "wind_gust" => 17.96,
          "wind_speed" => 9.8
        },
        %{
          "clouds" => 100,
          "dew_point" => 69.37,
          "dt" => 1_723_820_400,
          "feels_like" => 75.94,
          "humidity" => 83,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 74.86,
          "uvi" => 3.79,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 269,
          "wind_gust" => 15.82,
          "wind_speed" => 8.97
        },
        %{
          "clouds" => 79,
          "dew_point" => 68.29,
          "dt" => 1_723_824_000,
          "feels_like" => 79.23,
          "humidity" => 70,
          "pop" => 0.2,
          "pressure" => 1010,
          "rain" => %{"1h" => 0.2},
          "temp" => 79.23,
          "uvi" => 5.47,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 274,
          "wind_gust" => 15.32,
          "wind_speed" => 10.33
        },
        %{
          "clouds" => 63,
          "dew_point" => 67.41,
          "dt" => 1_723_827_600,
          "feels_like" => 83.61,
          "humidity" => 63,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 81.07,
          "uvi" => 6.74,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 277,
          "wind_gust" => 13.85,
          "wind_speed" => 10.56
        },
        %{
          "clouds" => 53,
          "dew_point" => 65.79,
          "dt" => 1_723_831_200,
          "feels_like" => 84.99,
          "humidity" => 57,
          "pop" => 0,
          "pressure" => 1010,
          "temp" => 82.81,
          "uvi" => 7.13,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "broken clouds",
              "icon" => "04d",
              "id" => 803,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 279,
          "wind_gust" => 13.49,
          "wind_speed" => 9.71
        },
        %{
          "clouds" => 0,
          "dew_point" => 65.28,
          "dt" => 1_723_834_800,
          "feels_like" => 85.64,
          "humidity" => 54,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 83.73,
          "uvi" => 6.39,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 276,
          "wind_gust" => 12.06,
          "wind_speed" => 8.59
        },
        %{
          "clouds" => 0,
          "dew_point" => 65.05,
          "dt" => 1_723_838_400,
          "feels_like" => 86.13,
          "humidity" => 53,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 84.24,
          "uvi" => 5.02,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 260,
          "wind_gust" => 11.45,
          "wind_speed" => 8.7
        },
        %{
          "clouds" => 1,
          "dew_point" => 65.73,
          "dt" => 1_723_842_000,
          "feels_like" => 85.24,
          "humidity" => 55,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 83.28,
          "uvi" => 3.28,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 250,
          "wind_gust" => 11.63,
          "wind_speed" => 9.44
        },
        %{
          "clouds" => 1,
          "dew_point" => 66.22,
          "dt" => 1_723_845_600,
          "feels_like" => 84.47,
          "humidity" => 58,
          "pop" => 0,
          "pressure" => 1008,
          "temp" => 82.29,
          "uvi" => 1.43,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 239,
          "wind_gust" => 12.1,
          "wind_speed" => 9.26
        },
        %{
          "clouds" => 2,
          "dew_point" => 68.02,
          "dt" => 1_723_849_200,
          "feels_like" => 79.47,
          "humidity" => 68,
          "pop" => 0.35,
          "pressure" => 1009,
          "rain" => %{"1h" => 0.25},
          "temp" => 79.47,
          "uvi" => 0.54,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 241,
          "wind_gust" => 18.01,
          "wind_speed" => 9.4
        },
        %{
          "clouds" => 0,
          "dew_point" => 68.58,
          "dt" => 1_723_852_800,
          "feels_like" => 78.24,
          "humidity" => 75,
          "pop" => 0.33,
          "pressure" => 1008,
          "temp" => 77.29,
          "uvi" => 0.12,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 234,
          "wind_gust" => 21.54,
          "wind_speed" => 8.39
        },
        %{
          "clouds" => 0,
          "dew_point" => 68.52,
          "dt" => 1_723_856_400,
          "feels_like" => 74.5,
          "humidity" => 85,
          "pop" => 1,
          "pressure" => 1008,
          "rain" => %{"1h" => 1.63},
          "temp" => 73.45,
          "uvi" => 0,
          "visibility" => 7773,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10n",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 244,
          "wind_gust" => 28.7,
          "wind_speed" => 12.53
        },
        %{
          "clouds" => 0,
          "dew_point" => 67.98,
          "dt" => 1_723_860_000,
          "feels_like" => 72.61,
          "humidity" => 89,
          "pop" => 1,
          "pressure" => 1008,
          "rain" => %{"1h" => 0.23},
          "temp" => 71.56,
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
          "wind_deg" => 266,
          "wind_gust" => 27.72,
          "wind_speed" => 8.9
        },
        %{
          "clouds" => 0,
          "dew_point" => 66.49,
          "dt" => 1_723_863_600,
          "feels_like" => 70.38,
          "humidity" => 90,
          "pop" => 1,
          "pressure" => 1008,
          "rain" => %{"1h" => 0.26},
          "temp" => 69.49,
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
          "wind_deg" => 269,
          "wind_gust" => 28.57,
          "wind_speed" => 8.39
        },
        %{
          "clouds" => 17,
          "dew_point" => 65.84,
          "dt" => 1_723_867_200,
          "feels_like" => 69.67,
          "humidity" => 90,
          "pop" => 0.8,
          "pressure" => 1008,
          "temp" => 68.86,
          "uvi" => 0,
          "visibility" => 10_000,
          "weather" => [
            %{
              "description" => "few clouds",
              "icon" => "02n",
              "id" => 801,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 266,
          "wind_gust" => 28.23,
          "wind_speed" => 8.28
        },
        %{
          "clouds" => 35,
          "dew_point" => 65.53,
          "dt" => 1_723_870_800,
          "feels_like" => 68.99,
          "humidity" => 91,
          "pop" => 0.8,
          "pressure" => 1008,
          "temp" => 68.2,
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
          "wind_deg" => 270,
          "wind_gust" => 25.46,
          "wind_speed" => 8.34
        },
        %{
          "clouds" => 36,
          "dew_point" => 65.1,
          "dt" => 1_723_874_400,
          "feels_like" => 67.82,
          "humidity" => 93,
          "pop" => 0.8,
          "pressure" => 1008,
          "temp" => 67.05,
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
          "wind_deg" => 265,
          "wind_gust" => 21.79,
          "wind_speed" => 7.45
        },
        %{
          "clouds" => 33,
          "dew_point" => 64.74,
          "dt" => 1_723_878_000,
          "feels_like" => 66.9,
          "humidity" => 95,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 66.13,
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
          "wind_deg" => 250,
          "wind_gust" => 19.44,
          "wind_speed" => 7.4
        },
        %{
          "clouds" => 67,
          "dew_point" => 64.47,
          "dt" => 1_723_881_600,
          "feels_like" => 66.27,
          "humidity" => 96,
          "pop" => 0,
          "pressure" => 1009,
          "temp" => 65.52,
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
          "wind_deg" => 253,
          "wind_gust" => 20.04,
          "wind_speed" => 7.76
        },
        %{
          "clouds" => 66,
          "dew_point" => 64.11,
          "dt" => 1_723_885_200,
          "feels_like" => 66.38,
          "humidity" => 94,
          "pop" => 0,
          "pressure" => 1008,
          "temp" => 65.7,
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
          "wind_deg" => 272,
          "wind_gust" => 20.85,
          "wind_speed" => 8.93
        },
        %{
          "clouds" => 70,
          "dew_point" => 63.43,
          "dt" => 1_723_888_800,
          "feels_like" => 66.24,
          "humidity" => 93,
          "pop" => 0,
          "pressure" => 1008,
          "temp" => 65.61,
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
          "wind_deg" => 279,
          "wind_gust" => 20.18,
          "wind_speed" => 9.04
        },
        %{
          "clouds" => 77,
          "dew_point" => 62.42,
          "dt" => 1_723_892_400,
          "feels_like" => 66.24,
          "humidity" => 89,
          "pop" => 0,
          "pressure" => 1008,
          "temp" => 65.77,
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
          "wind_deg" => 285,
          "wind_gust" => 20,
          "wind_speed" => 10.45
        }
      ],
      "lat" => 42.3871,
      "lon" => -87.9562,
      "minutely" => [
        %{"dt" => 1_723_724_880, "precipitation" => 0},
        %{"dt" => 1_723_724_940, "precipitation" => 0},
        %{"dt" => 1_723_725_000, "precipitation" => 0},
        %{"dt" => 1_723_725_060, "precipitation" => 0},
        %{"dt" => 1_723_725_120, "precipitation" => 0},
        %{"dt" => 1_723_725_180, "precipitation" => 0},
        %{"dt" => 1_723_725_240, "precipitation" => 0},
        %{"dt" => 1_723_725_300, "precipitation" => 0},
        %{"dt" => 1_723_725_360, "precipitation" => 0},
        %{"dt" => 1_723_725_420, "precipitation" => 0},
        %{"dt" => 1_723_725_480, "precipitation" => 0},
        %{"dt" => 1_723_725_540, "precipitation" => 0},
        %{"dt" => 1_723_725_600, "precipitation" => 0},
        %{"dt" => 1_723_725_660, "precipitation" => 0},
        %{"dt" => 1_723_725_720, "precipitation" => 0},
        %{"dt" => 1_723_725_780, "precipitation" => 0},
        %{"dt" => 1_723_725_840, "precipitation" => 0},
        %{"dt" => 1_723_725_900, "precipitation" => 0},
        %{"dt" => 1_723_725_960, "precipitation" => 0},
        %{"dt" => 1_723_726_020, "precipitation" => 0},
        %{"dt" => 1_723_726_080, "precipitation" => 0},
        %{"dt" => 1_723_726_140, "precipitation" => 0},
        %{"dt" => 1_723_726_200, "precipitation" => 0},
        %{"dt" => 1_723_726_260, "precipitation" => 0},
        %{"dt" => 1_723_726_320, "precipitation" => 0},
        %{"dt" => 1_723_726_380, "precipitation" => 0},
        %{"dt" => 1_723_726_440, "precipitation" => 0},
        %{"dt" => 1_723_726_500, "precipitation" => 0},
        %{"dt" => 1_723_726_560, "precipitation" => 0},
        %{"dt" => 1_723_726_620, "precipitation" => 0},
        %{"dt" => 1_723_726_680, "precipitation" => 0},
        %{"dt" => 1_723_726_740, "precipitation" => 0},
        %{"dt" => 1_723_726_800, "precipitation" => 0.1864},
        %{"dt" => 1_723_726_860, "precipitation" => 0.2864},
        %{"dt" => 1_723_726_920, "precipitation" => 0.9808},
        %{"dt" => 1_723_726_980, "precipitation" => 2.8352},
        %{"dt" => 1_723_727_040, "precipitation" => 4.1596},
        %{"dt" => 1_723_727_100, "precipitation" => 6.484},
        %{"dt" => 1_723_727_160, "precipitation" => 6.484},
        %{"dt" => 1_723_727_220, "precipitation" => 6.484},
        %{"dt" => 1_723_727_280, "precipitation" => 6.484},
        %{"dt" => 1_723_727_340, "precipitation" => 6.484},
        %{"dt" => 1_723_727_400, "precipitation" => 6.484},
        %{"dt" => 1_723_727_460, "precipitation" => 6.9166},
        %{"dt" => 1_723_727_520, "precipitation" => 7.3492},
        %{"dt" => 1_723_727_580, "precipitation" => 7.7818},
        %{"dt" => 1_723_727_640, "precipitation" => 16.2144},
        %{"dt" => 1_723_727_700, "precipitation" => 16.647},
        %{"dt" => 1_723_727_760, "precipitation" => 18.9146},
        %{"dt" => 1_723_727_820, "precipitation" => 19.1822},
        %{"dt" => 1_723_727_880, "precipitation" => 26.4498},
        %{"dt" => 1_723_727_940, "precipitation" => 34.7174},
        %{"dt" => 1_723_728_000, "precipitation" => 55.985},
        %{"dt" => 1_723_728_060, "precipitation" => 62.651},
        %{"dt" => 1_723_728_120, "precipitation" => 63.317},
        %{"dt" => 1_723_728_180, "precipitation" => 54.983},
        %{"dt" => 1_723_728_240, "precipitation" => 35.649},
        %{"dt" => 1_723_728_300, "precipitation" => 23.315},
        %{"dt" => 1_723_728_360, "precipitation" => 14.315},
        %{"dt" => 1_723_728_420, "precipitation" => 7.315}
      ],
      "timezone" => "America/Chicago",
      "timezone_offset" => -18_000
    }
  end
end
