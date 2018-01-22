defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    _keep(list,fun,[])
  end

  defp _keep(list,_fun,a) when length(list) == 0 do
    a
  end

  defp _keep([h|t],fun,a) do
    a = if( apply(fun,[h]) ) do
        a ++ [h]
      else
        a
    end
    _keep(t,fun,a)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    _discard(list,fun,[])
  end

  defp _discard(list,_fun,a) when length(list) == 0 do
    a
  end

  defp _discard([h|t],fun,a) do
    a = if( not apply(fun,[h])) do
       a ++ [h]
     else
       a
    end
    _discard(t,fun,a)
  end
end
