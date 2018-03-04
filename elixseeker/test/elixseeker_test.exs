defmodule ElixseekerTest do
  use ExUnit.Case
  doctest Elixseeker

  test "indent" do
    test_table = [
      %{
        name: "nil_acc",
        depth: 2,
        acc: nil,
        indentation_symbol: "  ",
        output_text: "1",
        expected: "1"
      },
      %{
        name: "string_acc",
        depth: 2,
        acc: "foo",
        indentation_symbol: "  ",
        output_text: "2",
        expected: "2"
      },
      %{
        name: "neg_acc",
        depth: 2,
        acc: -10,
        indentation_symbol: "  ",
        output_text: "3",
        expected: "3"
      },
      %{
        name: "neg_depth",
        depth: -100,
        acc: 0,
        indentation_symbol: "  ",
        output_text: "4",
        expected: "4"
      },
      %{
        name: "nil_indent",
        depth: 0,
        acc: 0,
        indentation_symbol: nil,
        output_text: "5",
        expected: "5"
      },
      %{
        name: "0depth_0acc",
        depth: 0,
        acc: 0,
        indentation_symbol: "**",
        output_text: "6",
        expected: "6"
      },
      %{
        name: "1depth_0acc",
        depth: 1,
        acc: 0,
        indentation_symbol: "%%",
        output_text: "7",
        expected: "%%7"
      },
      %{
        name: "10depth_0acc",
        depth: 10,
        acc: 0,
        indentation_symbol: "**",
        output_text: "8",
        expected: "********************8"
      },
      %{
        name: "0depth_10acc",
        depth: 0,
        acc: 10,
        indentation_symbol: "++",
        output_text: "9",
        expected: "9"
      },
      %{
        name: "0depth_0acc",
        depth: 10,
        acc: 9,
        indentation_symbol: "..",
        output_text: "10",
        expected: "..10"
      },
      %{
        name: "hex_indent",
        depth: 10,
        acc: 9,
        indentation_symbol: "\x26",
        output_text: "10",
        expected: "&10"
      }
    ]

    Enum.each(test_table, fn tc ->
      assert Elixseeker.indent(tc.depth, tc.acc, tc.indentation_symbol, tc.output_text) ==
               tc.expected
    end)
  end
end

#   @tag :skip
#   test "source correctly distinguishes between a directory" do
#     assert Elixseeker.source(".") == true
#     refute Elixseeker.source("/foo/") == true
#   end

#   @tag :skip
#   test "search file retrieves a filepath if it exists" do
#     filename = "README.md"
#     fake_filename = "Foo123.md"
#     result = Elixseeker.search_filename(filename)

#     fake_result = Elixseeker.search_filename(fake_filename)
#     refute is_bitstring(fake_result)

#     assert is_bitstring(result)
#     assert String.contains?(result, "/")
#     assert String.ends_with?(result, filename)
#   end

#   @tag :skip
#   test "filter_by_extension only returns files with matching file extensions" do
#     file_name = "FOO_BAZ_BAR.hex"
#     test_file = File.touch!(file_name)

#     file_name2 = "ALPHABRAVO.txt"
#     test_file2 = File.touch!(file_name2)

#     assert Elixseeker.filter_by_extension(File.ls!(), ".hex") == [file_name]
#     assert Elixseeker.filter_by_extension(File.ls!(), ".txt") == [file_name2]
#     refute Elixseeker.filter_by_extension(File.ls!(), ".java") == [file_name2]

#     File.rm!(Path.relative_to_cwd(file_name))
#     File.rm!(Path.relative_to_cwd(file_name2))
#   end

#   @tag :skip
#   test "opener opens a file" do
#     assert Elixseeker.opener("README.md") == {"", 0}
#   end

#   @tag :skip
#   test "it recursively walks a directory" do
#     assert spawn_link(fn -> Elixseeker.walk_directory(2) end) == []
#   end

#   @tag :skip
#   test "walk_directory() spawns processes" do
#     walk = Elixseeker.walk_directory(2)
#     assert Enum.any?(walk, fn elem -> is_pid(elem) == true end) == true
#   end

# end

# # TODO
# # test that it prints the results of file found or not found
# # test it displays the amount of time to complete the search
# # test that it displays how many files where searched
# # spawn process to recursively search a directory
# # sort the collection of files alphabettical
# # binary search the collection to find the matching file(s)
# # open the results with a given program as an argument
