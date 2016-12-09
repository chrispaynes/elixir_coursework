defmodule Factorialize do
  @moduledoc """
    Module to calculate the factorial of an integer

    Returns the factorial of the provided integer.
    A factorial is the product of all positive integers
    less than or equal to n.
    For example: 5! = 1 * 2 * 3 * 4 * 5 = 120
  """

  @doc """
    Returns 1 if passed a 0, otherwise matches any value
    and recursively multiplies one less than its argument.
  """
  @spec run_case(non_neg_integer) :: pos_integer
  def run_case(number) do
    case number do
      0 -> 1
      _ -> number * run_case(number - 1)
    end
  end

  @doc """
    Calls non-recursive run_poly(0) when argument is zero.
    Calls recursive run_poly(n) when a non-zero argument is passed.
  """
  @spec run_poly(non_neg_integer) :: pos_integer
  def run_poly(0), do: 1
  def run_poly(n) when n > 0 do
    n * run_poly(n - 1)
  end

end
