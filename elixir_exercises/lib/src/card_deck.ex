defmodule CardDeck do
  @moduledoc """
    Module to create a custom deck of cards.

  ### Example:

    Can output a standard deck of 52 cards with 4 of each card rank
    (:a, :2, :3, :4, :5, :6, :7, :8, :9, :10, :j, :k, :q) combined with 1 of
    each card suit (:spades, :cubes, :diamonds, :hearts). Places each combination
    into tuple and places the tuple into a list.
  """

  @doc """
    Uses a Comprehension to return the Cartesian product of each Card Set.
    Returns a list of all possible playing cards nested within individual tuples.

      iex(1)> CardDeck.create_deck([:a, :b], [1, 2])
      [{:card, :a, 1}, {:card, :a, 2}, {:card, :b, 1}, {:card, :b, 2}]
  """
  @spec create_deck(list, list) :: list
  def create_deck(set_1, set_2) do
      for i <- set_1, j <- set_2, do:  {:card, i, j}
  end

end