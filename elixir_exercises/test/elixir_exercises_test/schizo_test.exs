defmodule SchizoTest do
  use ExUnit.Case, async: true

  test "uppercase does not change the first word" do
    assert(Schizo.uppercase("foo") == "foo")
  end

  test "uppercase converts the second word to uppercase" do
    assert(Schizo.uppercase("baz bar") == "baz BAR")
  end

  test "uppercase converts every other to uppercase" do
    assert(Schizo.uppercase("alpha bravo charlie delta") == "alpha BRAVO charlie DELTA")
  end
  
end
