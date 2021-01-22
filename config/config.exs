# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :commentor,
  ecto_repos: [Commentor.Repo]

# Configures the endpoint
config :commentor, CommentorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d7wF+0ru0pJPaHnsswDjmIEhCrU3r2f6Vn4dZhwtCJI3+DxM2BeZ2aW2sDoho0lc",
  render_errors: [view: CommentorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Commentor.PubSub,
  live_view: [signing_salt: "l04jJ5+j"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
