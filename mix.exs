defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      name: "Weather",
      source_url: "https://github.com/spencerolson/weather",
      homepage_url: "https://github.com/spencerolson/weather",
      docs: [
        main: "Weather",
        logo: "priv/static/images/logo.png",
        extras: ["README.md"]
      ],
      escript: escript(),
      elixirc_paths: elixirc_paths(Mix.env())
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
      {:tz, "~> 0.27"}
    ]
  end

  defp aliases do
    [push: &push/1]
  end

  defp push(_args) do
    with :ok <-
           run(
             "git diff --quiet && git diff --cached --quiet",
             "1. Check for uncommitted changes"
           ),
         :ok <- run("mix credo > /dev/null", "2. Run credo"),
         :ok <- run("mix test > /dev/null", "3. Run tests") do
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

  defp elixirc_paths(:test), do: ["lib", "test/fixtures", "test/mocks"]
  defp elixirc_paths(_), do: ["lib"]
end
