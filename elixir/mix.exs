defmodule Signable.MixProject do
  use Mix.Project

  def project do
    [
      app: :signable,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "./plts/dialyzer.plt"},
        ignore_warnings: ".dialyzer_ignore",
        plt_add_apps: [:mix, :ex_unit, :ex_env, :public_key]
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.travis": :test,
        "coveralls.circle": :test,
        "coveralls.semaphore": :test,
        "coveralls.post": :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        credo: :test,
        dialyzer: :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/proto"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:protobuf, github: "coingaming/protobuf-elixir", branch: "beta", override: true},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.11", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false},
      {:propcheck, "~> 1.1", only: [:test, :dev]},
      {:poison, "~> 3.1", only: [:dev, :test]},
      {:hm_crypto, git: "git@github.com:coingaming/hm-crypto"}
    ]
  end
end
