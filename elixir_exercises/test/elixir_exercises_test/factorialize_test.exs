defmodule FactorializeTest do
    use ExUnit.Case, async: true
    alias Factorialize

    test "factorialize.run_case(0) returns 1" do
      assert Factorialize.run_case(0) == 1
    end

    test "factorialize.run_case(5) returns 120" do
      assert Factorialize.run_case(5) == 120
    end

    # :rand.uniform(100) returns a random integer less than 100.
    test "factorialize.run_case(:rand.uniform(100)) returns a number" do
      assert Factorialize.run_case(:rand.uniform(100)) |> is_number == true
    end

    test "factorialize.run_case(10) returns 3628800" do
      assert Factorialize.run_case(10) == 3628800
    end

    test "factorialize.run_case(20) returns 2432902008176640000" do
      assert Factorialize.run_case(20) == 2432902008176640000
    end

    test "factorialize.run_poly(0) returns 1" do
      assert Factorialize.run_poly(0) == 1
    end

    test "factorialize.run_poly(5) returns 120" do
      assert Factorialize.run_poly(5) == 120
    end

    # :rand.uniform(100) returns a random integer less than 100.
    test "factorialize.run_poly(:rand.uniform(100)) returns a number" do
      assert Factorialize.run_poly(:rand.uniform(100)) |> is_number == true
    end

    test "factorialize.run_poly(10) returns 3628800" do
      assert Factorialize.run_poly(10) == 3628800
    end

    test "factorialize.run_poly(20) returns 2432902008176640000" do
      assert Factorialize.run_poly(20) == 2432902008176640000
    end    

end