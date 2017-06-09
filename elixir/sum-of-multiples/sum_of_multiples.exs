defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    #pass? = &( 0 < length (factors |> Enum.filter( fn(x) -> rem(&1,x) == 0 end )))
    pass? = fn(y) ->  0 < length (factors |> Enum.filter( fn(x) -> rem(y,x) == 0 end )) end
    1..(limit-1) |> Enum.filter(pass?) |> Enum.sum
  end
end
