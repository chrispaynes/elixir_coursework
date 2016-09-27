defmodule ElixirCodeNectar.ZipDouble do
  @moduledoc """
  Zip Doubler

  Store an array of numbers to a variable and create a function to multiply each number in the array by a given integer argument. Return an array with the original numbers and the doubled results as key-value pairs in an object.

  "[1, 2, 3, 4, 5], 2" should return "[{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]"

  """

  @doc """
  Each run function merges a list with a copy of the list multiplied by a multiplier argument.
  Returns a list of tuples where the key is the original list number and the
  value is the number's multiplied value.
  """
  def run(list, multiplier) do
    # Multiplied_list stores the list array with each value multiplied by a multiplier.
    multiplied_list =
      list |> Enum.map(&(&1 * multiplier))

    # Enum.zip joins the list and the multiplied list into a list of merged tuples with key/value pairs.
    Enum.zip(list, multiplied_list)
  end

  def run2(list, multiplier) do
    # Multiplied_list stores the list array with each value multiplied by a multiplier.
    multiplied_list = Stream.map(list, fn(x) -> x * multiplier end)

    # Stream.zip joins the list and the multiplied list into a list of merged tuples with key/value pairs.
    Stream.zip(list, multiplied_list)

    # Enum.lo_list evaluates the stream into a list.
    |> Enum.to_list
  end

  def run3(list, multiplier) do
    list
    # Enum.flat_map multiplies each list value creating a new list
    # with the multiplied value merged after it's original value.
    |> Enum.flat_map(fn(x) -> [x, x * multiplier] end)

    # Enum.chunk subdivides the parent list into sublists with 2 items.
    |> Enum.chunk(2)

    # Enum.map transforms each list chunk into a tuple
    |> Enum.map(fn(y) -> y |> List.to_tuple end)
  end
end