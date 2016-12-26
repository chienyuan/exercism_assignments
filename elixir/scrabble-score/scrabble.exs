defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  @scores = %{A , E , I , O, U, L, N, R, S, T       1 D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) when word == "" ,do: 0
  def score(word) do
    cond do
      String.match?(word, ~r/ \t\n/) ->  0
      true -> _count(to_charlist(String.upcase(word)))
    end
  end

  defp _count(word) when word == [] , do: 0
  defp _count([wh|wt]) do
    scores = %{ "A" => 1, "E" => 1, "I" => 1 , "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1 ,
                "D" => 2, "G" => 2,
                "B" => 3, "C" => 3, "M" => 3, "P" => 3,
                "F" => 4, "H" => 4, "V" => 4 ,"W" => 4, "Y" => 4,
                "K" => 5,
                "J" => 8, "X" => 8,
                "Q" => 10,"Z" => 10}
    scores[<<wh>>] + _count(wt)  
  end
end
