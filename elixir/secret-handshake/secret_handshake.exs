defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    
    m = %{0b1=>"wink",0b10=>"double blink",0b100=>"close your eyes",0b1000=>"jump"}

    [0b1,0b10,0b100,0b1000,0b10000]
    |> Enum.reduce( [], fn (x,acc) ->
       if( (code &&& x )> 0 ) do
         if( x == 0b10000) do
            Enum.reverse(acc)
         else
            acc ++ [m[x]]
         end
       else
        acc
       end
     end )
  end

end
