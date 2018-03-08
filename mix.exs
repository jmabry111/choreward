defmodule Choreward.Mixfile do
  use Mix.Project

  def project do
    [
      app: :choreward,
      version: "0.0.1",
      elixir: "~> 1.4",
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
      mod: {Choreward, []},
      applications: [
        :bamboo,
        :cowboy,
        :ex_machina,
        :gettext,
        :logger,
        :phoenix,
        :phoenix_ecto,
        :phoenix_html,
        :phoenix_pubsub,
        :postgrex,
        :timex,
        :timex_ecto,
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bamboo, "~> 0.8"},
      {:cowboy, "~> 1.1.2"},
      {:doorman, "~> 0.5.1"},
      {:ex_machina, "~> 2.1.0"},
      {:ex_spec, "~> 2.0.1", only: :test},
      {:formulator, "~> 0.1.7"},
      {:gettext, "~> 0.13.1"},
      {:hound, "~> 1.0.4"},
      {:icalendar, "~> 0.7"},
      {:mailgun, "~> 0.1.2"},
      {:number, "~> 0.5"},
      {:phoenix, "~> 1.3.1"},
      {:phoenix_ecto, "~> 3.2"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0.1"},
      {:poison, "~> 3.1", override: true},
      {:postgrex, ">= 0.13.2"},
      {:timex, "~> 3.2"},
      {:timex_ecto, "~> 3.2"}
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
