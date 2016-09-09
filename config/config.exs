
use Mix.Config

config :logger, :console,
  level: :debug,
  format: "$date $time $metadata[$level] $message\n",
  handle_sasl_reports: true,
  handle_otp_reports: true

config :eopencc, settings: [
  # Shoud not be the system ruby in OSX
  {:ruby, 'ruby'},
  {:module_name, :ropencc_wrapper},
  # Poolboy configurations
  {:poolboy, [
    name: {:local, :eopencc_pool},
    worker_module: Eopencc.Worker,
    size: 10,
    max_overflow: 20
  ]}
]

import_config "#{Mix.env}.exs"
