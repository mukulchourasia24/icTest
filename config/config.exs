# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :icTest,
  ecto_repos: [IcTest.Repo]

# Configures the endpoint
config :icTest, IcTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K7wsu6i5M4KPr8dj0I4QEDos1PooCPHNinFSVHp0LuCYmPphjvE9XV7opWP4HX0J",
  render_errors: [view: IcTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IcTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
