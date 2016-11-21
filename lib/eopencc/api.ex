
defmodule Eopencc.Api do
  alias Eopencc.Worker

  def s2t str do
    _translate(:s2t, str)
  end

  def t2s str do
    _translate(:t2s, str)
  end

  def s2twp str do
    _translate(:s2twp, str)
  end

  def tw2sp str do
    _translate(:tw2sp, str)
  end

  defp _translate op, str do
    worker = :poolboy.checkout(:eopencc_pool)
    {w, h} = Worker.call_ruby(worker, op, [str])
    :poolboy.checkin(:eopencc_pool, worker)
    case {w, h} do
      {:ok, result} ->
        result
      {:error, _} ->
        str
    end
  end

end
