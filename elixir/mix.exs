defmodule Signable.MixProject do
  use Mix.Project

  def project do
    version = version()
    [
      app: :signable,
      version: version,
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
      ],
      package: package(version),
      # docs
      name: "Signable",
      source_url: "https://github.com/coingaming/signable/tree/v#{version}/elixir",
      homepage_url: "https://github.com/coingaming/signable/tree/v#{version}/elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp version do
    case File.read("VERSION") do
      {:ok, version} -> String.trim(version)
      {:error, _} -> "0.0.0-development"
    end
  end

  defp package(version) do
    [
      organization: "coingaming",
      licenses: ["UNLICENSED"],
      files: ["lib", "mix.exs", "README.md", "VERSION"],
      links: %{
        "GitHub" => "https://github.com/coingaming/signable/tree/v#{version}/elixir"
      }
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
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false},
      {:propcheck, "~> 1.1", only: [:test, :dev]},
      {:poison, "~> 3.1", only: [:dev, :test]},
      {:stream_data, "~> 0.5", only: [:dev, :test]},
      {:hm_crypto, github: "coingaming/hm-crypto"}
    ]
  end
end
