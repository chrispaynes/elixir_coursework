defmodule Schizo do
  def uppercase(string) do
    transform_every_other_word(string, &uppercaser(&1))
  end
  
  def unvowel(string) do
    transform_every_other_word(string, &remove_vowels(&1))
  end

  defp transform_every_other_word(string, transformation) do
    words_with_index = string |> String.split |> Enum.with_index
    transform_words = Enum.map(words_with_index, transformation)
    Enum.join(transform_words, " ")
  end

  defp transformer({word, index}, transformation) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformation.(word)
    end
  end

  defp uppercaser(input) do
    transformer(input, &String.upcase(&1))
  end

  defp remove_vowels(input) do
    transformer(input, fn(word) -> Regex.replace(~r/[aeiou]/, word, "") end)
  end
end

