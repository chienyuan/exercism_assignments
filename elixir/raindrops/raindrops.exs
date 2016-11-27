defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    x = Enum.filter(1..number, &( rem(number,&1) == 0 ) ) 
    |> Enum.map(&( _convert(&1)))  
    |> Enum.join
    cond do
      x == "" -> to_string(number)
      true -> x
    end
  end

  defp _convert(number) when number == 7 , do: "Plong"
  defp _convert(number) when number == 5 , do: "Plang"
  defp _convert(number) when number == 3 , do: "Pling"
  defp _convert(_number)                 , do: ""
end
