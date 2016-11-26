defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.downcase(sentence) 
    |> String.split([" ",",","_",":","!","@","#","$","%","&","^"], trim: true) 
    |>  _count
  end

  defp _count([]) , do: %{}

  defp _count([h|t]) do
    m = _count(t) 
    i = Map.get(m,h,0) 
    Map.put(m, h, i + 1)
  end

end
