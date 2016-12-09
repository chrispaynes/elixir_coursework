defmodule KaprekarsConstant do
  @moduledoc """
  Module to calculate the iterations required to reach Kaprekars Constant

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

  source: wikipedia
  """

  # @kc stores Kaprekar's Constant
  @kc '6174' |> List.to_string

  @doc """
    Starts iteration count at 0.
  """
  @spec run_poly(non_neg_integer, non_neg_integer) :: integer
  def run_poly(n, acc \\ 0)

  @doc """
    Halts recursion when n reaches 6174.
  """
  @spec run_poly(non_neg_integer, non_neg_integer) :: charlist
  def run_poly(6174, acc) do
    "You reached Kaprekar's Constant (" <> @kc <> ") after #{acc} iterations."
  end

  @spec run_poly(non_neg_integer, non_neg_integer) :: integer
  def run_poly(n, acc) do
    run_poly((split_sort_join(n, :desc) - split_sort_join(n, :asc)), acc + 1)
  end

  @doc """
  Splits a number into a list of individual digits,
  sorts the list and joins it back together as an integer.
  """
  @spec split_sort_join(non_neg_integer, :asc | :desc) :: integer
  def split_sort_join(n, s) do
    split_int = n |> Integer.digits

    sorted_int = case s do
      :desc -> split_int |> Enum.sort(&(&1 > &2))
          _ -> split_int |> Enum.sort
    end

    sorted_int
    |> Enum.join
    |> String.to_integer
  end

end
