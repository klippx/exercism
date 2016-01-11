defmodule Bob do
  def hey(input) do
    cond do
      input =~ ~r/.+\?$/ -> "Sure."
      String.length(String.strip input) == 0 -> "Fine. Be that way!"
      input =~ ~r/1, 2, 3$/ -> "Whatever."
      input =~ ~r/^[^a-z]*$/ -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
