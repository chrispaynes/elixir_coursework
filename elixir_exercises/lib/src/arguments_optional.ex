defmodule ArgumentsOptional do

  @moduledoc """
    Module to sum two arguments

    Create a function that sums two arguments together.
    If only one argument is provided, then return a function
    that expects one argument and returns the sum.

    For example, addTogether(2, 3) should return 5, and addTogether(2) should
    return a function. Calling this returned function with a single argument
    will then return the sum: var sumTwoAnd = addTogether(2); sumTwoAnd(3)
    returns 5.

    If either argument isn't a valid number, return undefined.
  """

  @doc """
    Sums all integer values from the variable binding keyword list
  """
  def addTogether(a, b) when is_integer(a) and is_integer(b) do
    binding |> Keyword.values |> Enum.sum
  end

  @doc """
    Sums all floats values from the variable binding keyword list
  """
  def addTogether(a, b) when is_float(a) and is_float(b) do
    binding |> Keyword.values |> Enum.sum
  end

  @doc """
    Returns nil for all non_integer and non_float arguments
  """
  def addTogether(_, _) do
      nil
  end

  @doc """
    Returns nil for all non_integer and non_float arguments
  """
  def addTogether(_) do
      nil
  end
end
