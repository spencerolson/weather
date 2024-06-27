defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
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
      {:req, "~> 0.5.0"},
      {:plug, "~> 1.0"},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp escript do
    [main_module: Weather.CLI, name: :weather, strip_beams: true, embed_elixir: true]
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures", "test/mocks"]
  defp elixirc_paths(_), do: ["lib"]
end
