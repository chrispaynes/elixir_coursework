ExUnit.start

defmodule ElixirCsvTest do
  use ExUnit.Case
  doctest ElixirCsv

  import ElixirCsv

  test "get_data does not return newline characters" do
    assert Enum.map(get_data("todos.csv"), fn(x) -> String.contains? x, "\n" end) == [false, false, false]
  end

  test "get_data returns a list" do
    assert is_list(get_data("todos.csv")) == true
  end

  test "get_data returns non empty list" do
    assert List.first(get_data("todos.csv")) != nil
  end

  test "format_date returns a tuple" do
    assert is_tuple(format_date("1234/123/12")) == true
  end

  test "format_date splits the date value into an integer tuple" do
    assert format_date("1234/123/12") == {1234, 123, 12}
  end

  test "format_date creates integer values" do
    assert format_date("1234/123/12")
    |> Tuple.to_list
    |> List.first
    |> is_integer == true
  end
end