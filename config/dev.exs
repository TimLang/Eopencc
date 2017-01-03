
use Mix.Config

config :eopencc, settings: [
  # Shoud not be the system ruby in OSX
  {:ruby, 'ruby'},
  {:module_name, :ropencc_wrapper},
  # Poolboy configurations
  {:poolboy, [
    name: {:local, :eopencc_pool},
    worker_module: Eopencc.Worker,
    size: 2,
    max_overflow: 4
  ]}
]

