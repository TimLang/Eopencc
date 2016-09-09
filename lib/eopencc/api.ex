
defmodule Eopencc.Api do
  alias Eopencc.Worker

  def s2t str do
    _translate(:s2t, str)
  end

  def t2s str do
    _translate(:t2s, str)
  end

  defp _translate op, str do
    worker = :poolboy.checkout(:eopencc_pool)
    {w, h} = Worker.call_ruby(worker, op, [str])
    :poolboy.checkin(:eopencc_pool, worker)
    {w, h}
  end

end
