defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    _abb(String.split(string,[" ",",","-"],trim: true))
  end

  defp _abb([]) , do: ""
  defp _abb([h|t]) do
    ( _first_upcase(h) |> to_charlist |> _abb2  ) <> _abb(t)
  end

  defp _abb2([]) , do: ""
  defp _abb2([h|t]) when h > 64 and h < 91 , do: << h >> <> _abb2(t)
  defp _abb2([_|t]), do: _abb2(t)

  defp _first_upcase(word) do
    [f|r] = to_charlist(word)
    String.upcase( << f >> ) <> to_string(r)
  end
  
  
end
