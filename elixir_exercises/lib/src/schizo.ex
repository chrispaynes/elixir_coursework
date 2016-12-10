defmodule Schizo do
  def uppercase(string) do
    string |> uppercase_every_other_word 
  end

  def uppercase_every_other_word(string) do
    words_with_index = string |> String.split |> Enum.with_index
    transform_words = Enum.map(words_with_index, &uppercaser(&1))
    Enum.join(transform_words, " ")
  end

  def uppercaser({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> String.upcase(word)
    end
  end

  def unvowel(string) do
    string
  end
end

