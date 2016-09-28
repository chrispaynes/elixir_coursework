defmodule ElixirCodeNectar.KaprekarsConstant do
  @moduledoc """
  Kaprekars Constant

  6174 is known as Kaprekar's constant after the Indian mathematician D. R. Kaprekar.
  This number is notable for the following property:

  Take any four-digit number, using at least two different digits. (Leading zeros are allowed.)
  Arrange the digits in descending and then in ascending order to get two four-digit numbers, adding leading zeros if necessary.
  Subtract the smaller number from the bigger number.
  Go back to step 2.

  The above process, known as Kaprekar's routine, will always reach its fixed point, 6174,
  in at most 7 iterations.[4] Once 6174 is reached, the process will continue yielding 7641 – 1467 = 6174.

  "[1, 2, 3, 4, 5], 2" should return "[{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]"

  source: wikipedia
  """

  # @kc stores Kaprekar's Constant
  @kc '6174' |> List.to_string


  @doc """
  """
  def run(n, acc \\ 0) when n == 6174 do
      "You reached Kaprekar's Constant (" <> @kc <> ") after #{acc} iterations."
  end

  def run(n, acc) do
      run(subtract(sortMinuend(n),sortSubtrahend(n)), acc + 1)
  end

  @doc """
  Sort splits a number into a list of individual digits,
  sorts the list and joins it back together as an integer.
  """
  def sortSubtrahend(n) do
    n
    |> Integer.digits
    |> Enum.sort
    |> Enum.join
    |> String.to_integer
  end

  def sortMinuend(n) do
    n
    |> Integer.digits
    # Enum.sorts sorts in descending order.
    |> Enum.sort(&(&1 > &2))
    |> Enum.join
    |> String.to_integer
  end  

  def subtract(minuend, subtrahend) do
    minuend - subtrahend
  end

end