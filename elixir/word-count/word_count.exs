defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    split = Enum.map String.split(sentence, ~r/[ _]/), fn(x) -> String.downcase Regex.replace(~r/[^\w-]/u, x, "", global: true) end
    {words, count_hash} = Enum.map_reduce split, %{}, fn(word, count_hash) ->
      count_hash = cond do
        String.length(word) == 0 -> count_hash
        Map.has_key?(count_hash, word) -> Map.merge(count_hash, Map.put(count_hash, word, count_hash[word]+1))
        true -> Map.put(count_hash, word, 1)
      end
      {word, count_hash}
    end
    count_hash
  end
end
