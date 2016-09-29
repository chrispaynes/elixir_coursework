defmodule ElixirCodeNectar.KaprekarsConstant do
  @moduledoc """
  Kaprekars Constant

  6174 is known as Kaprekar's constant after the Indian mathematician
  D. R. Kaprekar. This number is notable for the following property:

  Take any four-digit number, using at least two different digits.
  (Leading zeros are allowed.) Arrange the digits in descending and then in
  ascending order to get two four-digit numbers, adding leading zeros if
  necessary. Subtract the smaller number from the bigger number.
  Go back to step 2.

  The above process, known as Kaprekar's routine, will always reach its fixed
  point, 6174, in at most 7 iterations.[4] Once 6174 is reached, the process
  will continue yielding 7641 – 1467 = 6174.

  "[1, 2, 3, 4, 5], 2" should return "[{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]"

  source: wikipedia
  """

  # @kc stores Kaprekar's Constant
  @kc '6174' |> List.to_string


  @doc """
  """
  @spec run(non_neg_integer, non_neg_integer) :: integer
  def run(n, acc \\ 0)

  @spec run(non_neg_integer, non_neg_integer) :: charlist
  def run(6174, acc) do
    "You reached Kaprekar's Constant (" <> @kc <> ") after #{acc} iterations."
  end

  @spec run(non_neg_integer, non_neg_integer) :: integer
  def run(n, acc) do
    run(subtract(sort(n, :desc), sort(n, :asc)), acc + 1)
  end

  @doc """
  Sort splits a number into a list of individual digits,
  sorts the list and joins it back together as an integer.
  """
  @spec sort(non_neg_integer, :asc | :desc) :: integer
  def sort(n, s) do
    split_int = n |> Integer.digits

    sorted_int = case s do
      :desc -> split_int |> Enum.sort(&(&1 > &2))
          _ -> split_int |> Enum.sort
    end

    sorted_int
    |> Enum.join
    |> String.to_integer
  end

  @spec subtract(integer, integer) :: integer
  def subtract(minuend, subtrahend) do
    minuend - subtrahend
  end

end
