# Factorialize a Number

# Return the factorial of the provided integer.
# If the integer is represented with the letter n.
# A factorial is the product of all positive integers less than or equal to n.
# Factorials are often represented with the shorthand notation n!
# For example: 5! = 1 * 2 * 3 * 4 * 5 = 120

# factorialize(5) should return a number.
# factorialize(5) should return 120.
# factorialize(10) should return 3628800.
# factorialize(20) should return 2432902008176640000.
# factorialize(0) should return 1.

defmodule ElixirCodeNectar.Factorialize do
  @moduledoc """

  Factorialize
  """
  @spec run(non_neg_integer) :: pos_integer
  def run(number) do
    case number do
      # Outputs returns 1 when 0 is passed as an argument.
      0 -> 1
      # _ matches any value and recursively multiplies one
      # less than the number argument.
      _ -> number * run(number - 1)
    end
  end


  # Calls non-recursive run2(0) when argument is zero.
  # Calls recursive run2(n) when a non-zero argument is passed.
  @spec run2(non_neg_integer) :: pos_integer
  def run2(0), do: 1
  def run2(n) when n > 0 do
    n * run2(n - 1)
  end

end
