defmodule ConcurrencySearcherTest do
  use ExUnit.Case
  doctest ConcurrencySearcher

  test "source correctly distinguishes between a directory" do
    assert ConcurrencySearcher.source(".") == true
    refute ConcurrencySearcher.source("/foo/") == true
  end

  test "search file retrieves a filepath if it exists" do
    filename = "README.md"
    fake_filename = "Foo123.md"
    result = ConcurrencySearcher.search_filename(filename)

    fake_result = ConcurrencySearcher.search_filename(fake_filename)
    refute is_bitstring(fake_result)

    assert is_bitstring(result)
    assert String.contains?(result, "/")
    assert String.ends_with?(result, filename)
  end

  test "filter_by_extension only returns files with matching file extensions" do
    assert ConcurrencySearcher.filter_by_extension(File.ls!, ".md") == ["README.md"]
    refute ConcurrencySearcher.filter_by_extension(File.ls!, ".go") == ["README.md"]
  end

  test "opener opens a file" do
    assert ConcurrencySearcher.opener("README.md") == {"", 0}
  end

@tag :skip
  test "it recursively walks a directory" do
    assert ConcurrencySearcher.walk_directory == []
  end

@tag :skip
  test "it spawns new process" do
    # assert ConcurrencySearcher
  end

end

TODO
# test that it prints the results of file found or not found
# test it displays the amount of time to complete the search
# test that it displays how many files where searched
# spawn process to recursively search a directory
# sort the collection of files alphabettical
# binary search the collection to find the matching file(s)
# open the results with a given program as an argument