
require Logger

defmodule Eopencc.Worker do
  use GenServer

  @config Application.get_env(:eopencc, :settings)

  def start_link(ruby_module) do
    GenServer.start_link(__MODULE__, ruby_module, [])
  end

  def call_ruby(worker, function, args) do
    GenServer.call(worker, {:call_ruby, function, args}, 10_000)
  end

  def init(ruby_module) do
    ruby_path = Application.app_dir(:eopencc, "/priv") |> to_char_list
    Logger.debug "ruby path: #{ruby_path}"
    {:ok, pid} = :ruby.start_link([
      {:ruby_lib, ruby_path},
      {:ruby, @config[:ruby]}
    ])
  state = {ruby_module, pid}
  {:ok, state}
  end

  def pool_name do

  end

  def handle_call({:call_ruby, function, args}, _from, state) do
    {module, pid} = state
    result = :ruby.call(pid, module, function, args)
    reply = {:ok, result}
    {:reply, reply, state}
  end

  def handle_call(_request, _from, state) do
    {:stop, :error, :bad_call, state}
  end

  def handle_info(_msg, {module,py_pid}) do
    {:stop, :error, {module,py_pid}}
  end

  def terminate(_reason, {_, py_pid}) do
    :ruby.stop(py_pid)
    :ok
  end

end
