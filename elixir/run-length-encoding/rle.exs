defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    [h|t] = to_charlist(string)
    _encode(t,h,1)
  end

  defp _encode([],_,0)                       , do: ""
  defp _encode([],prev,num)    when num > 0  , do: to_string(num) <>  << prev >>
  defp _encode([h|t],prev,num) when h == prev, do: _encode(t,h,num + 1)
  defp _encode([h|t],prev,num)               , do: to_string(num) <> << prev >> <> _encode(t,h,1)


  @spec decode(String.t) :: String.t
  def decode(string) do
    [h|t] = to_charlist(string)
    _decode(t,<< h >>)
  end

  defp _decode([h|t],num) when t == []   do
    {n,_} = Integer.parse(num)
    Enum.join(Enum.map(1..n, fn(_x) -> << h >> end  ))
  end

  defp _decode([h|t],num) when h >= ?0 and h <= ?9  do
     _decode(t, num  <> << h >>)
  end

  defp _decode([h|t],num) do
    {n,_} = Integer.parse(num)
    r = Enum.join(Enum.map(1..n, fn(_x) -> << h >> end  ))
    [h|tt] = t
    r  <> _decode(tt, << h >> )
  end
end
