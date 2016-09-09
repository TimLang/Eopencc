
require Logger
defmodule Eopencc do

  use Application

  def start(_type, _args) do
    Logger.info "Starting ropencc server"
    # :erlang.set_cookie(node, :"&!CQMYY$_123+_-*%#ELIXIR.APPLICATION")
    Eopencc.Supervisor.start_link()
  end
end
