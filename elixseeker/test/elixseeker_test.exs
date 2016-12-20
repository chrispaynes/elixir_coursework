defmodule ElixseekerTest do
  use ExUnit.Case
  doctest Elixseeker

@tag :skip
  test "source correctly distinguishes between a directory" do
    assert Elixseeker.source(".") == true
    refute Elixseeker.source("/foo/") == true
  end

@tag :skip
  test "search file retrieves a filepath if it exists" do
    filename = "README.md"
    fake_filename = "Foo123.md"
    result = Elixseeker.search_filename(filename)

    fake_result = Elixseeker.search_filename(fake_filename)
    refute is_bitstring(fake_result)

    assert is_bitstring(result)
    assert String.contains?(result, "/")
    assert String.ends_with?(result, filename)
  end

@tag :skip
  test "filter_by_extension only returns files with matching file extensions" do
    assert Elixseeker.filter_by_extension(File.ls!, ".md") == ["README.md"]
    refute Elixseeker.filter_by_extension(File.ls!, ".go") == ["README.md"]
  end

@tag :skip
  test "opener opens a file" do
    assert Elixseeker.opener("README.md") == {"", 0}
  end

@tag :skip
  test "it recursively walks a directory" do
    assert Elixseeker.walk_directory(2) == []
  end
  
# @tag :skip
  test "indenter inputs the requested amount" do
    assert Elixseeker.indenter(1, 0, "  ", "hello.txt") == "  hello.txt"
    assert Elixseeker.indenter(4, 0, "..", "world.txt") == "........world.txt"
    assert Elixseeker.indenter(3, 1, "\x26 ", "foobaz.txt") == "& & foobaz.txt"
  end

end

# TODO
# test that it prints the results of file found or not found
# test it displays the amount of time to complete the search
# test that it displays how many files where searched
# spawn process to recursively search a directory
# sort the collection of files alphabettical
# binary search the collection to find the matching file(s)
# open the results with a given program as an argument