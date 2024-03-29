defmodule DerivcoFootball.MixProject do
  use Mix.Project

  def project do
    [
      app: :derivco_football,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison],
      mod: {DerivcoFootball, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.1"},
      {:poison, "~> 4.0"},
      {:exprotobuf, "~> 1.2"},
      {:httpoison, "~> 1.5"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
    ]
  end
end
