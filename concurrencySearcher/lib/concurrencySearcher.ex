defmodule ConcurrencySearcher do

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

defp walk_directory(dir \\ ".") do
  Enum.map(File.ls!(dir), fn file ->
    IO.puts fname = "#{dir}/#{file}"
      if File.dir?(fname), do: spawn fn -> walk_directory(fname) end
    end)
  end
end