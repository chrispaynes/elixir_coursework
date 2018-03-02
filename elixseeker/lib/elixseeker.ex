defmodule Elixseeker do
  def start() do
    IO.puts("Welcome to Elixseeker!")
    IO.puts("Starting Process")
    IO.puts("======================")
    IO.puts("Searching Root Directory:\t" <> String.trim_trailing(Path.absname("."), "."))
    IO.puts("")
    {time, _} = :timer.tc(fn -> search end)
    IO.puts("Search duration: #{IO.inspect(time)} Microseconds!")
  end

  def search() do
    # add pattern matching for specific directories
    filematch = Mix.Shell.IO.prompt("Which file are you looking for?")
    max_depth = Mix.Shell.IO.prompt("How many directories deep do you wish to search?")
    search_location = Mix.Shell.IO.prompt("Which directory would you like to search?")

    spawn_link(fn ->
      Enum.map(
        walk_directory(
          String.to_integer(String.trim(max_depth)),
          0,
          ("" <> search_location) |> String.trim(),
          String.trim(filematch)
        ),
        fn x -> IO.inspect(x) end
      )
    end)
  end

  def source(directory) when is_bitstring(directory) do
    IO.puts("Now searching #{IO.inspect(Path.expand(directory))}")
    File.dir?(directory)
  end

  def filter_by_extension(collection, ext) do
    Enum.filter(collection, fn x -> Path.extname(x) == ext end)
  end

  def search_filename(filepath) when is_bitstring(filepath) do
    if File.exists?(filepath), do: Path.expand(filepath)
  end

  def open(filepath) do
    System.cmd("xdg-open", [filepath])
  end

  def indent(depth, acc, delimiter, value \\ "") do
    if acc < depth, do: indent(depth, acc + 1, delimiter, delimiter <> value), else: value
  end

  def walk_directory(max_depth, depth \\ 0, dir \\ ".", match) do
    IO.puts(
      "\nTRAVERSED #{depth} LEVEL(S) WITHIN #{
        Regex.replace(~r/\./, Path.relative_to_cwd(dir), "")
      }" <> "\n-------------------------------------------------------------"
    )

    Enum.map(File.ls!(dir), fn file ->
      filename = "#{dir}/#{file}"
      IO.puts(indent(depth, 0, "..") <> Regex.replace(~r/^\./, Path.absname(filename), ""))
      if String.contains?(filename, match), do: open(filename)

      if File.dir?(filename) and depth < max_depth,
        do: walk_directory(max_depth, depth + 1, filename, match)
    end)
  end
end

Elixseeker.start()
