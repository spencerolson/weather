# Changelog for `Weather`

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