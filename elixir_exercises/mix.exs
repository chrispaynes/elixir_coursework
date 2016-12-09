defmodule ElixirExercises.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_exercises,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test]
   ]
  end

  # Configuration for the OTP application

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:dialyxir, "~> 0.4", only: [:dev], runtime: false},
     {:excoveralls, "~> 0.5", only: :test},
     {:credo, "~> 0.4", only: [:dev, :test]},
     {:ex_doc, github: "elixir-lang/ex_doc"}
    ]
  end
end
