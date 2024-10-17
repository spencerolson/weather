# Changelog for `Weather`

## 0.4.0

### Breaking Changes
- `Weather.Opts.new/1` now returns a tuple `{:ok, Weather.Opts.t()} | {:error, String.t()}` ([4b825a7](https://github.com/spencerolson/weather/commit/4b825a77ba4e82e54a7417c53886bd09e0306df7))

### Features
- Added `Weather.Opts.new!/1` which either returns a `Weather.Opts` struct or raises an `ArgumentError` when given invalid input (which was the previous behavior of `Weather.Opts.new/1`) ([4b825a7](https://github.com/spencerolson/weather/commit/4b825a77ba4e82e54a7417c53886bd09e0306df7))

## 0.3.8

### Bug Fixes
- Fix times showing up in UTC when the escript was installed via hex :| ([f09eebb](https://github.com/spencerolson/weather/commit/f09eebb184d029c8bf87f6fe30a312197b3a5376))

## 0.3.7

### Bug Fixes
- Un-break search by zip :| ([62ff335](https://github.com/spencerolson/weather/commit/62ff335e331f8d3b63e165ecfa92dcda03578b59))

## 0.3.6

### Bug Fixes
- Remove escript `priv` hack for Req. Now the executable works as expected after installing via `mix escript.install hex weather` :) ([0b6b270](https://github.com/spencerolson/weather/commit/0b6b270b3a7b0d45487e9d773575aa7386c9d833) and [8f70e4a](https://github.com/spencerolson/weather/commit/8f70e4af4412dcb09fd7e18ae2fb33d18a8d2e15))

## Features
- Update README with simplified CLI installation instructions. CLI can now be installed via `mix escript.install hex weather` ([7ddb58c](https://github.com/spencerolson/weather/commit/7ddb58c44d9af1875e90d26d40822be2ce4cf12f) and [061e5b5](https://github.com/spencerolson/weather/commit/061e5b528b85b24a85ab15af0724c11a73d34c7d))

## 0.3.5

### Bug Fixes
- When you supply a bad API key and a ZIP code, the error message you get back now indicates the API key is bad (previously it stated the ZIP was bad) ([3e63a92](https://github.com/spencerolson/weather/commit/3e63a927e277ae5a4e98a8b21883d144674bceac))

## 0.3.4

### Features
- Add a Livebook! And add "Run in Livebook" button to README ([8270eee](https://github.com/spencerolson/weather/commit/8270eee1e0d010351cc7a9c71066eb8e829a9d05))
- Improve `--zip` docs, making it clear non-US codes are accepted ([7b104d7](https://github.com/spencerolson/weather/commit/7b104d7bc7e6f09c110404e86f92e2509604cf47))
- Add timezone database info to readme ([db8ae9e](https://github.com/spencerolson/weather/commit/db8ae9e827cd5edee0e34c93b07f118b0fa8867c))

## 0.3.3

No notable changes. Just a README typo fix.

## 0.3.2

### Bug Fixes
- Fix a bug where the hourly rain report would report rain for the current hour when no more rain was expected between <now> and the end of the hour ([752e374](https://github.com/spencerolson/weather/commit/752e374c4d292db3bb2dd87ec30563bed56ac208))

### Features
- Add `--feels-like` CLI switch ([34f6546](https://github.com/spencerolson/weather/commit/34f6546ea8ae659d0763dd364bb6b053ae34c2ed))
- Add `--color-codes` CLI switch ([8aa009d](https://github.com/spencerolson/weather/commit/8aa009d9657b1369b00770ff17ffd5374f2476ca))
- Add dialyxer ([0615e52](https://github.com/spencerolson/weather/commit/0615e528527633c8e386f43753f32b9434878300))

## 0.3.1

### Bug Fixes
- Handle `0` for 'hours' and 'every' options ([e5b4140](https://github.com/spencerolson/weather/commit/e5b4140d74d2b6e50002e1215438e815832bab48))

### Features
- Add support for custom reports! See the [Customization](https://github.com/spencerolson/weather/blob/main/README.md#customization) section in the README for more info ([ba0fa30](https://github.com/spencerolson/weather/commit/ba0fa30624b81cf30b2a8c5ce391d56fdeafdc1e))

## 0.3.0

### Breaking Changes
- Rename latitude and longitude env vars. `MY_HOME_LAT` -> `WEATHER_LATITUDE`, `MY_HOME_LONG` -> `WEATHER_LONGITUDE` ([fd0fd10](https://github.com/spencerolson/weather/commit/fd0fd10680ca5504f105dea4d9ba8f208fbe34a5))
- Change rain icon `☔ -> 🌧️`. Arguably not a breaking change but it could be if folks match on the icon ([eee817f](https://github.com/spencerolson/weather/commit/eee817f92a34380cb2fdcd3cb486bcebb4d5b67b))

### Features
- Update the README, finally! ([a33eda3](https://github.com/spencerolson/weather/commit/a33eda3fafc7017aa6e7e391f09f7669e98385a9))

## 0.2.8

### Features
- Add `Weather.get!` ([bd7aadc](https://github.com/spencerolson/weather/commit/bd7aadcb6c8f5449dfded495b9ebb43e846dcb6c))
- Redact `appid` when inspecting %Weather.Opts{} ([927f630](https://github.com/spencerolson/weather/commit/927f630fcfdd8f9143712d8bba4a402b14c35b58))
- Add default args to many methods for ease of use ([38710fe](https://github.com/spencerolson/weather/commit/38710fe8a1b4ccfbc5eb4a780105978200152f32))

## 0.2.7

### Bug Fixes
1. Don't blow up when there is no "minutely" data returned ([91d3c59](https://github.com/spencerolson/weather/commit/91d3c593080234c489e96f7a8c7fc37b15757b64))
2. Remove ambiguity of alert time spans by including day ([1181af0](https://github.com/spencerolson/weather/commit/1181af0c64621bb9994280af124aed729c2e2e8b))

## 0.2.6

### Features
1. Add `--zip` CLI switch ([21e3b7c](https://github.com/spencerolson/weather/commit/21e3b7c9fd24f1992946fbfd68d6f06213c807c6))
2. Add `--label` CLI switch ([874aa03](https://github.com/spencerolson/weather/commit/874aa03f45209d3cf879cf43cafb25d46064d8c9))

### Bug Fixes
1. Fix docs for minutely/hourly rain ([9285c5f](https://github.com/spencerolson/weather/commit/9285c5fa7bd1415ee166de319f60c18681fda499))

### Features
1. spruce up "minutely" rain title ([a08c91f](https://github.com/spencerolson/weather/commit/a08c91fdf38d7ba7409848bfeed6d5a7313b3328))
2. add 🌞 sunrise | 🌚 sunset ([f7babe0](https://github.com/spencerolson/weather/commit/f7babe0203aaa903035256e49d5d6a1604d4dd85))
3. add hourly rain report ([06f8bb1](https://github.com/spencerolson/weather/commit/06f8bb173cb1d599016fe7592fc4a763df1575ef))

## 0.2.5

### Features
1. spruce up "minutely" rain title ([a08c91f](https://github.com/spencerolson/weather/commit/a08c91fdf38d7ba7409848bfeed6d5a7313b3328))
2. add 🌞 sunrise | 🌚 sunset ([f7babe0](https://github.com/spencerolson/weather/commit/f7babe0203aaa903035256e49d5d6a1604d4dd85))
3. add hourly rain report ([06f8bb1](https://github.com/spencerolson/weather/commit/06f8bb173cb1d599016fe7592fc4a763df1575ef))

## 0.2.4

### Features
1. add `--alert-titles-only` CLI switch ([f4b7cf9](https://github.com/spencerolson/weather/commit/f4b7cf91efaf8c966543f7a93263081ff2b802f4))

## 0.2.3

### Bug Fixes
1. Fix a problem where test responses were not available when the library was being used as a dependency ([39bce22](https://github.com/spencerolson/weather/commit/39bce22d217b99f640000af27abe12f568f888f2))

## 0.2.2

### Features
1. add formatter check to github actions ([3ec74db](https://github.com/spencerolson/weather/commit/3ec74db3a804f1a4037c049c070a31c60622c071))

## 0.2.1

### Bug Fixes
1. Fix a problem where an error would be thrown if there were multiple descriptions for the current weather ([39a3e6c](https://github.com/spencerolson/weather/commit/39a3e6c7e6936641c38716982ad0a9c29684f2b9))
2. Fix formatting bugs ([1e3d3cb](https://github.com/spencerolson/weather/commit/1e3d3cb689794e9c258ad9674b07abb630af7250)):
    - add newline at end of unauthorized responses
    - add newline at end of unexpected responses
    - add newline at end of error reponses
    - remove unwanted trailing whitespace at end of temp and time lines for hourly report

### Features
1. Add formatting check to `mix push` ([a643f53](https://github.com/spencerolson/weather/commit/a643f5313480f9bd7f3022d8ab57508e7c578d2c))
2. Add 'rain' as option for --test switch ([841f803](https://github.com/spencerolson/weather/commit/841f80323d80337a5166674c832cc7a6e5b613c3))

## 0.2.0

### Breaking Changes
1. `Weather.Colors.colorize` now accepts a string and a color code. `@spec colorize(number, Weather.Opts.t()) :: String.t()` -> `@spec colorize(String.t(), integer()) :: String.t()` ([3864018](https://github.com/spencerolson/weather/commit/386401838fecc40b9505dc7363ae6cdd9e17171f#diff-3039f194d9b35e11671e2988fab25f2cf6f5de4818314a917cb50dd17b03ec86))

2. `Weather.DateUtils.time_by_hour` now accepts an integer unix time as its first arg instead of a map. `@spec time_by_hour(map(), String.t(), Weather.Opts.t()) :: String.t()` -> `@spec time_by_hour(integer(), String.t(), Weather.Opts.t()) :: String.t()` ([3864018](https://github.com/spencerolson/weather/commit/386401838fecc40b9505dc7363ae6cdd9e17171f#diff-d58369207ba80061161aaaaf11f5a3bdf657dea0acf2f37084c2c25d66d8d3d3))

3. `Weather.DateUtils.time_by_minute` now accepts an integer unix time as its first arg instead of a map. `@spec time_by_minute(map(), String.t(), Weather.Opts.t()) :: String.t()` -> `@spec time_by_minute(integer(), String.t(), Weather.Opts.t()) :: String.t()` ([3864018](https://github.com/spencerolson/weather/commit/386401838fecc40b9505dc7363ae6cdd9e17171f#diff-d58369207ba80061161aaaaf11f5a3bdf657dea0acf2f37084c2c25d66d8d3d3))

### Bug Fixes
1. Fix report spacing ([5263b15](https://github.com/spencerolson/weather/commit/5263b15d2cd485cf050da2a65a8602f949452290))

### Features
1. Colorize alert titles and change time remaining in alert title to time span ([3864018](https://github.com/spencerolson/weather/commit/386401838fecc40b9505dc7363ae6cdd9e17171f))

2. Add `--hide-alerts` switch to allow hiding weather alerts, even when alerts are available. Default is false, which shows alerts if there are any available ([0709825](https://github.com/spencerolson/weather/commit/070982524d429c9172d99044c835b6f6b56c73be))

## 0.1.5

### Features
1. add --test option which lets you try things out without an API key, latitude, or longitude set ([2c27364](https://github.com/spencerolson/weather/commit/2c273645b16edf6f2478210e9af211726de0a8c4))

## 0.1.4

### Features
1. spruce up readme with buttons and a demo gif

## 0.1.3

### Bug Fixes
1. change order of versions in `CHANGELOG.md`, whoops ([de71d0b](https://github.com/spencerolson/weather/commit/de71d0b8d973039988515d551dfa4e303799d2ee))

### Features
1. improve pattern matching specificity for public functions ([540a317](https://github.com/spencerolson/weather/commit/540a317a946af9f97dc90de9aaffb615c4b64fd8))

## 0.1.2

### Bug Fixes
1. get env vars directly so this library can be used as a dependency ([c491157](https://github.com/spencerolson/weather/commit/c49115722e243ca6576c9a32a18ac6fb71276c72))

## 0.1.1

### Bug Fixes
1. Move finch config to mix.exs so this library can be used as a dependency ([7e6bea6](https://github.com/spencerolson/weather/commit/7e6bea65eb2e0670cf62ece570569210f1b7e12e))

## 0.1.0
1. Initial Release