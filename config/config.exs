# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :choreward,
  ecto_repos: [Choreward.Repo]

# Configures the endpoint
config :choreward, Choreward.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ANvus+vm0obDOzlMSuxq5EwFltpU8FPsXvaFLSOLb+we46rxp+qVw/yHk9g9JpOO",
  render_errors: [view: Choreward.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Choreward.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :formulator, translate_error_module: Choreward.ErrorHelpers

config :doorman,
  repo: Choreward.Repo,
  secure_with: Doorman.Auth.Bcrypt,
  user_module: Choreward.User
