defmodule Elixseeker do

def main do
  IO.puts "Welcome to Elixseeker!"  
  IO.puts "Starting Process"
  IO.puts "======================"
  IO.puts "Searching Root Directory:\t" <> String.trim_trailing(Path.absname("."), ".")
  IO.puts ""
  {time, _} = :timer.tc(fn() -> spawn_link(fn -> walk_directory(4) end) end)
  IO.puts("Search duration: #{IO.inspect(time)} Microseconds!")
end

def search(dir \\ ".") do
  Enum.map(walk_directory(dir), fn(x) -> IO.inspect x end)
end

def source(directory) when is_bitstring(directory) do
  IO.puts "Now searching #{IO.inspect(Path.expand(directory))}"
  File.dir?(directory)
end

def filter_by_extension(collection, ext) do
  Enum.filter(collection, fn(x) -> Path.extname(x) == ext end)
end

def search_filename(filepath) when is_bitstring(filepath) do
  if File.exists?(filepath), do: Path.expand(filepath)
end

def opener(filepath) do
  System.cmd("open", [filepath])
end

  def indenter(depth, acc, delimiter, indent \\ "") do
    result = IO.inspect indent
    if acc < depth, do: indenter(depth, acc + 1, delimiter, indent <> delimiter), else: result
  end

defp walk_directory(depth, dir \\ ".") do
  if depth != 0, do: IO.puts "Traversed #{depth} Level(s)\t#{Regex.replace(~r/\./, Path.expand(dir), "root")}"

  Enum.map(File.ls!(dir), fn file ->
  filename = "#{dir}/#{file}"
  indentation = indenter(depth, 0, "\t")
  # IO.inspect indenter(depth, 0, "\t")
    IO.puts "\t #{filename}"
    if File.dir?(filename), do: spawn_link fn -> walk_directory(depth + 1, filename) end
  end)
end


  end

# TODO
# def print_walk_list(depth, dir) do # end
# def track_search_time do end





# Elixseeker.indenter(4, 0, "\t")
Elixseeker.main