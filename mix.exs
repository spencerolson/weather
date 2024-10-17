defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      version: "0.4.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      package: package(),
      name: "Weather",
      source_url: "https://github.com/spencerolson/weather",
      docs: [
        main: "Weather",
        logo: "priv/static/images/logo.png",
        extras: ["README.md", "LIVEBOOK.livemd"]
      ],
      escript: escript(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [
        # Put the project-level PLT in the priv/ directory (instead of the default _build/ location)
        plt_file: {:no_warn, "priv/plts/project.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false},
      {:mimic, "~> 1.7", only: :test},
      {:plug, "~> 1.0"},
      {:req, "~> 0.5.0"},
      {:tz, "~> 0.27"},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [push: &push/1]
  end

  defp package do
    [
      name: "weather",
      description:
        "An Elixir library and command-line interface for fetching weather data from the OpenWeatherMap API.",
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://github.com/spencerolson/weather/blob/main/CHANGELOG.md",
        "GitHub" => "https://github.com/spencerolson/weather",
        "OpenWeatherMap 'One Call API 3.0'" => "https://openweathermap.org/api/one-call-3"
      }
    ]
  end

  defp push(_args) do
    with :ok <-
           run(
             "git diff --quiet && git diff --cached --quiet",
             "1. Check for uncommitted changes"
           ),
         :ok <- run("mix format --check-formatted &> /dev/null", "2. Check formatting"),
         :ok <- run("mix credo &> /dev/null", "3. Run credo"),
         :ok <- run("mix dialyzer --quiet &> /dev/null", "4. Run dialyzer"),
         :ok <- run("mix test --include slow &> /dev/null", "5. Run tests") do
      Mix.shell().cmd("git push")
    else
      :error -> [:red, "Failed!"] |> IO.ANSI.format() |> IO.puts()
    end
  end

  defp run(command, step) do
    [:yellow, step, :reset, "\n$ #{command}\n"]
    |> IO.ANSI.format()
    |> IO.puts()

    case Mix.shell().cmd(command) do
      0 -> :ok
      _ -> :error
    end
  end

  defp escript do
    [main_module: Weather.CLI, name: :weather, strip_beams: true, embed_elixir: true]
  end

  defp elixirc_paths(_), do: ["lib"]
end
