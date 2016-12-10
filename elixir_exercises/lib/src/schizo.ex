defmodule Schizo do
  def uppercase(string) do
    words_with_index = string |> String.split |> Enum.with_index


    transform_words = Enum.map(words_with_index, &uppercase_every_other_word(&1))
    Enum.join(transform_words, " ")
  end

  def uppercase_every_other_word({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> String.upcase(word)
    end
  end
end

