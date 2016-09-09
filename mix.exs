defmodule Eopencc.Mixfile do
  use Mix.Project

  def project do
    [app: :eopencc,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    dev_packages = Mix.env == :dev && [:apex, :exsync] || []
    [
      mod: {Eopencc, []},
      applications: [
        :logger,
        :poolboy,
        :erlport,
        :runtime_tools
      ] ++ dev_packages
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:apex, "~> 0.4.0", only: [:dev]},
      {:exsync, "~> 0.1.2", only: [:dev]},
      {:erlport, github: "hdima/erlport", manager: :make},
      {:exrm, "~> 1.0.5"},
      {:poolboy, "~> 1.5"}
    ]
  end
end
