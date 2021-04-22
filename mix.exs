defmodule Zebra.Mixfile do
  use Mix.Project

  def project do
    [
      app: :zebra,
      version: "0.0.1",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Zebra.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev),  do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:grpc, "~> 0.3.1"},
      {:grpc_mock, github: "renderedtext/grpc-mock", only: [:dev, :test]},
      {:plug_cowboy, "~> 2.0"},
      {:phoenix, "~> 1.4.0-rc.2"},
      {:phoenix_html, "~> 2.13.0"},
      {:phoenix_live_reload, "~> 1.2.0"},
      {:quantum, "~> 2.3"},

      {:httpoison, "~> 1.0"},
      {:ecto, "~> 2.2"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:timex, "~> 3.3.0"},
      {:timex_ecto, "~> 3.3.0"},
      {:tackle, github: "renderedtext/ex-tackle"},
      {:mock, "~> 0.3.0", only: :test},
      {:fun_registry, github: "renderedtext/fun-registry", only: [:dev, :test]},
      {:junit_formatter, "~> 3.0", only: [:test]},
      {:paginator, "~> 0.4"},
      {:poison, "~> 3.1"},
      {:watchman, github: "renderedtext/ex-watchman", overide: false},
      {:util, github: "renderedtext/elixir-util"},
      {:uuid, "~> 1.1"},
      {:statistics, "~> 0.5.0"},

      {:sentry, "~> 7.0"},
      {:sentry_grpc, github: "renderedtext/sentry_grpc"},
      {:jason, "~> 1.1"},
      {:cachex, "~> 3.2"},
      {:grpc_health_check, github: "renderedtext/grpc_health_check"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
