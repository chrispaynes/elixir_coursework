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
  
  test "unvowel does not change the first word" do
    assert(Schizo.unvowel("foo") == "foo")
  end

  test "unvowel removes the seconds word's vowels" do
    assert(Schizo.unvowel("baz bar") == "baz br")
  end

  test "unvowel removes every other word's vowels" do
    assert(Schizo.unvowel("alpha bravo charlie delta") == "alpha brv charlie dlt")
  end
  
end
