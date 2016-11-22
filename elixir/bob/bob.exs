
defmodule Teenager do
  @moduledoc """
  Elixir Teenager module 
  For instance; 
      def hey(input) do
      end
  """

  @doc """
  Greets the user by name, or by saying "Hello, World!"
  if no name is given.
  """
  @spec hey(String.t) :: String.t
  def hey(input) do
    cond do
      input =~ ~r/^\s*$/ ->  "Fine. Be that way!"
      input =~ ~r/^[A-Z0-9 %^*@#$(!]+$/ -> "Woah, chill out!"
      input =~ ~r/\?$/ -> "Sure."
      true -> "Whatever."
    end
  end
end
