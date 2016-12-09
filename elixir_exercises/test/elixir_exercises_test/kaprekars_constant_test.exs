defmodule KaprekarsConstantTest do
    use ExUnit.Case, async: true
    alias KaprekarsConstant

    # @kc stores Kaprekar's Constant
    @kc '6174' |> List.to_string

    test "KaprekarsConstant.run(3524) returns 6174" do
      assert KaprekarsConstant.run(3524) == "You reached Kaprekar's Constant (" <> @kc <> ") after 3 iterations."
    end

    test "KaprekarsConstant.subtract(2111) returns 999" do
      assert KaprekarsConstant.subtract(2111, 1112) == 999
    end

    test "KaprekarsConstant.sort(3524, :asc) returns the argument split into four numerals, sorted in ascending order as 2345" do
      assert KaprekarsConstant.sort(3524, :asc) == 2345
    end

    test "KaprekarsConstant.sort(3524, :desc) returns the argument split into four numerals, sorted in descending order as 5432" do
      assert KaprekarsConstant.sort(3524, :desc) == 5432
    end  
end