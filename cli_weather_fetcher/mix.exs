defmodule CliWeatherFetcher.Mixfile do
  use Mix.Project

  def project do
    [app: :cli_weather_fetcher,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :inets, :hackney, :poison],
    mod: {CliWeatherFetcher, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:hackney, "~> 1.6"},
     {:poison, "~> 3.0"}]
  end
end
