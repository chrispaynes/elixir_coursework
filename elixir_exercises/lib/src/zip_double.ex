defmodule ZipDouble do
  @moduledoc """
  Module to Zip and Double Enum values into key-value pairs.

  Multiplies each enumerable by an integer argument. Returns a list of
  the original enumerables and the doubled results as key-value pairs
  within an tuple.

      ZipDouble.run_enum([1, 2, 3, 4, 5], 2)
      [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]

      ZipDouble.run_stream([1, 2, 3, 4, 5], 2)
      [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]

      ZipDouble.run_flat_map([1, 2, 3, 4, 5], 2)
      [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]
  """

  @doc """
    Multiplies each enumerable by an integer. Zips the original list and
    the multiplied list into a list of merged tuples with key/value pairs.
  """
  @spec run_enum(list, integer) :: list
  def run_enum(list, multiplier) do
    multiplied_list =
      list |> Enum.map(&(&1 * multiplier))
    Enum.zip(list, multiplied_list)
  end

  @doc """
    Multiplies each Stream enumerable by an integer. Zips the original list
    and the multiplied list into a list of merged tuples with key/value pairs.
    Converts the Stream enumerable into a list.
  """
  @spec run_stream(list, integer) :: list
  def run_stream(list, multiplier) do
    multiplied_list = Stream.map(list, fn(x) -> x * multiplier end)
    Stream.zip(list, multiplied_list) |> Enum.to_list
  end

  @doc """
  Creates a new list with the original list values values followed by
  the original value multipled by the integer value. Subdivides list
  into sublists with 2 items. Maps over each enumerable transforming
  each chunk of 2 into a key/value tuple.
  """
  @spec run_flat_map(list, integer) :: list
  def run_flat_map(list, multiplier) do
    list
    |> Enum.flat_map(fn(x) -> [x, x * multiplier] end)
    |> Enum.chunk(2)
    |> Enum.map(fn(y) -> y |> List.to_tuple end)
  end
end
