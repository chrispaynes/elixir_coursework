defmodule ZipDoubleTest do
    use ExUnit.Case, async: true
    alias ZipDouble

    test "ZipDouble.run_enum([1, 2, 3, 4, 5], 2) doubles each number" do
      assert ZipDouble.run_enum([1, 2, 3, 4, 5], 2)
             |> Enum.unzip
             |> Tuple.to_list
             |> List.last == [2, 4, 6, 8, 10]
    end

    test "ZipDouble.run_enum([1, 2, 3, 4, 5], 2) maintains the original array" do
      assert ZipDouble.run_enum([1, 2, 3, 4, 5], 2)
             |> Enum.unzip
             |> Tuple.to_list
             |> List.first == [1, 2, 3, 4, 5]
    end

    test "ZipDouble.run_enum([1, 2, 3, 4, 5], 2) returns an array with 5 tuples" do
      assert ZipDouble.run_enum([1, 2, 3, 4, 5], 2) |> is_list == true

      assert ZipDouble.run_enum([1, 2, 3, 4, 5], 2)
      |> Enum.map(&Kernel.is_tuple/1) == [true, true, true, true, true]
    end

    test "ZipDouble.run_enum([1, 2, 3, 4, 5], 2) returns [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]" do
      assert ZipDouble.run_enum([1, 2, 3, 4, 5], 2) == [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]
    end

    test "ZipDouble.run_enum([-1, -2, -3, -4, -5], 2) returns [{-1, -2}, {-2, -4}, {-3, -6}, {-4, -8}, {-5, -10}]" do
      assert ZipDouble.run_enum([-1, -2, -3, -4, -5], 2) == [{-1, -2}, {-2, -4}, {-3, -6}, {-4, -8}, {-5, -10}]
    end

    test "ZipDouble.run_stream(1..5, 2) doubles each number" do
      assert ZipDouble.run_stream(1..5, 2)
             |> Enum.unzip
             |> Tuple.to_list
             |> List.last == [2, 4, 6, 8, 10]
    end

    test "ZipDouble.run_stream(1..5, 2) maintains the original array" do
      assert ZipDouble.run_stream(1..5, 2)
             |> Enum.unzip
             |> Tuple.to_list
             |> List.first == [1, 2, 3, 4, 5]
    end

    test "ZipDouble.run_stream(1..5, 2) returns an array with 5 tuples" do
      assert ZipDouble.run_stream(1..5, 2) |> is_list == true

      assert ZipDouble.run_stream(1..5, 2)
      |> Enum.map(&Kernel.is_tuple/1) == [true, true, true, true, true]
    end

    test "ZipDouble.run_stream(1..5, 2) returns [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]" do
      assert ZipDouble.run_stream(1..5, 2) == [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]
    end

    test "ZipDouble.run_stream([-1, -2, -3, -4, -5], 2) returns [{-1, -2}, {-2, -4}, {-3, -6}, {-4, -8}, {-5, -10}]" do
      assert ZipDouble.run_stream([-1, -2, -3, -4, -5], 2) == [{-1, -2}, {-2, -4}, {-3, -6}, {-4, -8}, {-5, -10}]
    end

    test "ZipDouble.run_flat_map(1..5, 2) doubles each number" do
      assert ZipDouble.run_flat_map(1..5, 2)
             |> Enum.unzip
             |> Tuple.to_list
             |> List.last == [2, 4, 6, 8, 10]
    end

    test "ZipDouble.run_flat_map(1..5, 2) maintains the original array" do
      assert ZipDouble.run_flat_map(1..5, 2)
             |> Enum.unzip
             |> Tuple.to_list
             |> List.first == [1, 2, 3, 4, 5]
    end

    test "ZipDouble.run_flat_map(1..5, 2) returns an array with 5 tuples" do
      assert ZipDouble.run_flat_map(1..5, 2) |> is_list == true

      assert ZipDouble.run_flat_map(1..5, 2)
      |> Enum.map(&Kernel.is_tuple/1) == [true, true, true, true, true]
    end

    test "ZipDouble.run_flat_map(1..5, 2) returns [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]" do
      assert ZipDouble.run_flat_map(1..5, 2) == [{1, 2}, {2, 4}, {3, 6}, {4, 8}, {5, 10}]
    end

    test "ZipDouble.run_flat_map([-1, -2, -3, -4, -5], 2) returns [{-1, -2}, {-2, -4}, {-3, -6}, {-4, -8}, {-5, -10}]" do
      assert ZipDouble.run_flat_map([-1, -2, -3, -4, -5], 2) == [{-1, -2}, {-2, -4}, {-3, -6}, {-4, -8}, {-5, -10}]
    end    

end