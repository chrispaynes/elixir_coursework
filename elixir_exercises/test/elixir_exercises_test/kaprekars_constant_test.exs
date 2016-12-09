defmodule KaprekarsConstantTest do
    use ExUnit.Case, async: true
    alias KaprekarsConstant

    # @kc stores Kaprekar's Constant
    @kc '6174' |> List.to_string

    test "KaprekarsConstant.run_poly properly identifies when iteration it reached" do
      assert KaprekarsConstant.run_poly(3524) == "You reached Kaprekar's Constant (" <> @kc <> ") after 3 iterations."
      assert KaprekarsConstant.run_poly(4371) == "You reached Kaprekar's Constant (" <> @kc <> ") after 7 iterations."
      assert KaprekarsConstant.run_poly(9381) == "You reached Kaprekar's Constant (" <> @kc <> ") after 7 iterations."
      assert KaprekarsConstant.run_poly(8747) == "You reached Kaprekar's Constant (" <> @kc <> ") after 4 iterations."
    end

    test "KaprekarsConstant.sort(3524, :asc) returns the argument split into four numerals, sorted in ascending order as 2345" do
      assert KaprekarsConstant.split_sort_join(3524, :asc) == 2345
    end

    test "KaprekarsConstant.split_sort_join(3524, :desc) returns the argument split into four numerals, sorted in descending order as 5432" do
      assert KaprekarsConstant.split_sort_join(3524, :desc) == 5432
    end  
end