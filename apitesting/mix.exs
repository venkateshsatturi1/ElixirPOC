defmodule Apitesting.MixProject do
  use Mix.Project


  def project do
    [
      app: :apitesting,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls, dirs: ["test", "lib"]],
      coveralls: [token: System.get_env("COVERALLS_REPO_TOKEN")],
      preferred_cli_env: [
        coverall:   :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.json": :test,
        "coveralls.html": :test
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
      # {:gettext, git: "https://github.com/elixir-lang/gettext.git", tag: "0.1"},
       {:plug, ">= 0.4.0"},
       {:httpoison, "~> 2.1"},
       {:jason, "~> 1.2"},
       {:floki, "~> 0.30"},
       {:espec, "~> 1.9"},
       {:ex_spec, "~> 2.0"},
       {:exspect, "~> 0.1.0"},
       {:poison, "~> 5.0"},
       {:exvcr, "~> 0.13.5"},
       {:excoveralls, "~> 0.16.1"},
       {:mysql, "~>1.8"},
       {:ecto, "~>3.9"},
       {:myxql, "~> 0.4.0"}

      # {:ex_unit_html_formatter, "~> 1.0"},
      # {:reportex, "~> 0.15"}

    ]
  end
end
