defmodule ElixirCodeNectar.KaprekarsConstantTest do
    use ExUnit.Case, async: true
    alias ElixirCodeNectar.KaprekarsConstant

    # @kc stores Kaprekar's Constant
    @kc '6174' |> List.to_string

    test "KaprekarsConstant.run(3524) returns 6174" do
      assert KaprekarsConstant.run(3524) == "You reached Kaprekar's Constant (" <> @kc <> ") after 4 iterations."
    end

    test "KaprekarsConstant.subtract(2111) returns 999" do
      assert KaprekarsConstant.subtract(2111, 1112) == 999
    end

    test "KaprekarsConstant.sortSubtrahend(3524) returns the argument split into four numerals, sorted in ascending order as 2345" do
      assert KaprekarsConstant.sortSubtrahend(3524) == 2345
    end

    test "KaprekarsConstant.sortMinuend(3524) returns the argument split into four numerals, sorted in descending order as 5432" do
      assert KaprekarsConstant.sortMinuend(3524) == 5432
    end  
end