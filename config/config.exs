# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :neo4j_phoenix, Neo4jPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1s+6OrGVr5nreYeTz3vu+yLyMEC5vfxjQ14jq1tNIgGYGJTmKeVEUQQG+CAr7pjm",
  render_errors: [view: Neo4jPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Neo4jPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configure Bolt.Sips for Neo4j
config :bolt_sips, Bolt,
  hostname: 'localhost',
  basic_auth: [username: "neo4j", password: "cvdg"],
  port: 7687,
  pool_size: 5,
  max_overflow: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
