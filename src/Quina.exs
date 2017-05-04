defmodule Quina do
  def new(), do: new(5)

  def new(n), do: _new(n, [])

  defp _new(0, q) do
    :shell.strings(true)
    :lists.sort(q)
  end

  defp _new(n, q) do
    e = :rand.uniform(80)
    is_member = :lists.member(e, q)
    if  is_member == false do
        _new(n - 1, [e | q])
    else
        _new(n, q)
    end
  end

  # Probability according to the sum
  # of the quina members.
  # 167 =< 54,3% <= 242
  def sum(q), do: _sum(q, 0)

  defp _sum([], s), do: s
  defp _sum([q|qs], s), do: _sum(qs, s+q)

  # Probability according to the column
  # of the quina members.
  # Maximum 2
  def columns(q) do
    f = fn(e) -> :erlang.round((e/10 - trunc(e/10)) * 10) end
    :lists.map(f, q)
  end
end
