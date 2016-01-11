defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> split_into_normalized_words
    |> histogram
    |> Map.delete("")
  end

  defp split_into_normalized_words(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[\s_]+/u)
    |> Enum.map(&normalize/1)
  end

  defp normalize(word), do: String.replace(word, ~r/[^\w-]+/u, "")

  defp histogram(words) do
    Enum.reduce(words, %{}, fn(word, result) ->
      Map.put result, word, (result[word] || 0) + 1
    end)
  end
end
