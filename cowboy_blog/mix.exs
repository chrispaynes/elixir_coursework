defmodule CowboyBlog.Mixfile do
  use Mix.Project

  def project do
    [app: :cowboy_blog,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  # Applications returns a module for working with applications and defining application callbacks
  def application do
    [applications: [:logger, :cowboy, :earmark],
     mod: {CowboyBlog, []}]
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
  [ {:cowboy, "1.0.4"},
    {:earmark, github: "pragdave/earmark"}
  ]
  end
end