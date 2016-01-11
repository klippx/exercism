defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> downcase
    |> split
    |> normalize
    |> render_histogram
    |> remove_empty_keys
  end

  defp downcase(sentence), do: String.downcase(sentence)
  defp split(sentence), do: String.split(sentence, ~r/[\s_]+/u)
  defp normalize(sentence), do: Enum.map(sentence, &normalize_word/1)
  defp normalize_word(word), do: String.replace(word, ~r/[^\w-]+/u, "")
  defp remove_empty_keys(map), do: Map.delete(map, "")

  defp render_histogram(words) do
    Enum.reduce(words, %{}, fn(word, result) ->
      Map.put result, word, (result[word] || 0) + 1
    end)
  end
end
