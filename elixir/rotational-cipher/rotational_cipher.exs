defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_string text
    |> String.to_charlist()
    |> Enum.map(&(_pick(&1,shift)))
  end

  defp _pick(c,s) when (c >= ?a and c <= ?z) do
    ?a + rem( (c - ?a) + s, 26 )
  end

  defp _pick(c,s) when (c >= ?A and c <= ?Z) do
    ?A + rem( (c - ?A) + s, 26 )
  end

  defp _pick(c,_s) do
    c
  end
end
