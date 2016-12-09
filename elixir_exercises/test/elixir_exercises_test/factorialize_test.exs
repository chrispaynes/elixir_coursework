defmodule FactorializeTest do
    use ExUnit.Case, async: true
    alias Factorialize

    test "factorialize.run(0) returns 1" do
      assert Factorialize.run(0) == 1
    end

    test "factorialize.run(5) returns 120" do
      assert Factorialize.run(5) == 120
    end

    # :rand.uniform(100) returns a random integer less than 100.
    test "factorialize.run(:rand.uniform(100)) returns a number" do
      assert Factorialize.run(:rand.uniform(100)) |> is_number == true
    end

    test "factorialize.run(10) returns 3628800" do
      assert Factorialize.run(10) == 3628800
    end

    test "factorialize.run(20) returns 2432902008176640000" do
      assert Factorialize.run(20) == 2432902008176640000
    end

    test "factorialize.run2(0) returns 1" do
      assert Factorialize.run2(0) == 1
    end

    test "factorialize.run2(5) returns 120" do
      assert Factorialize.run2(5) == 120
    end

    # :rand.uniform(100) returns a random integer less than 100.
    test "factorialize.run2(:rand.uniform(100)) returns a number" do
      assert Factorialize.run2(:rand.uniform(100)) |> is_number == true
    end

    test "factorialize.run2(10) returns 3628800" do
      assert Factorialize.run2(10) == 3628800
    end

    test "factorialize.run2(20) returns 2432902008176640000" do
      assert Factorialize.run2(20) == 2432902008176640000
    end    

end