# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_partner,
  ecto_repos: [ApiPartner.Repo]

# Configures the endpoint
config :api_partner, ApiPartnerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D8SpUdKLkwS/OnQXGoqvE9UBROQlpZcYqbNYf4V2RRmuf1BogeeDtqD/ApxUu/hH",
  render_errors: [view: ApiPartnerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ApiPartner.PubSub,
  live_view: [signing_salt: "HpXZVzep"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
