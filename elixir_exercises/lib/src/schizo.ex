defmodule Schizo do
  def uppercase(string) do
    transform_every_other_word(string, &uppercaser(&1))
  end
  
  def unvowel(string) do
    transform_every_other_word(string, &remove_vowels(&1))
  end

  def transform_every_other_word(string, transformation) do
    words_with_index = string |> String.split |> Enum.with_index
    transform_words = Enum.map(words_with_index, transformation)
    Enum.join(transform_words, " ")
  end

  def uppercaser({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> String.upcase(word)
    end
  end

  def remove_vowels({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> Regex.replace(~r/a|e|i|o|i|y/, word, "")
    end
  end
end

