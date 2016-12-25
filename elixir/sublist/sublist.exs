defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a,b) when ( a == []  and b == []) or ( a == b)  ,  do: :equal
  def compare(a,b) do
    al = length(a)
    bl = length(b)
    cond do
      al < bl and _sublist(a,b) -> :sublist
      al > bl and _sublist(b,a) -> :superlist
      true                      -> :unequal
    end
  end
  
  defp _sublist(a,_b) when a == [] ,do: true
  defp _sublist(_a,b) when b == [] ,do: false
  defp _sublist(a,b) do
    [_|bt] = b
    cond do
      _sequal(a,b) -> true
      true         -> _sublist(a,bt)
    end
  end

  defp _sequal(a,_b) when a == [] , do: true
  defp _sequal(_a,b) when b == [] , do: false
  defp _sequal([ah|at],[bh|bt]) when ah === bh , do: _sequal(at,bt)
  defp _sequal(_,_) ,do: false

end
