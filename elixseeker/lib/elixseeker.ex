defmodule Elixseeker do
  @root String.trim_trailing(Path.absname("."), ".")
  # allow for testing private functions
  @compile if Mix.env() == :test, do: :export_all

  @doc """
  start starts the search process
  """
  def start() do
    System.cmd("clear", [])

    IO.puts("""
    ==============================
            ElixSeeker CLI
    ==============================
    """)

    task = Task.async(fn -> :timer.tc(fn -> search() end) end)

    case Task.yield(task, 30000) || Task.shutdown(task) do
      {:ok, {time, _}} ->
        IO.puts("\nSearch Duration: #{Float.round(time * 0.001, 2)} Milliseconds!")

      _ ->
        nil
    end
  end

  # get_search_root determines where to begin the file search
  defp get_search_root() do
    Mix.Shell.IO.prompt("\nWhich directory would you like to search?\n(Default:#{@root}")
    |> String.trim()
    |> Path.expand()
  end

  # set_search_depth determines how many directories deep to conduct the search
  defp set_search_depth(default_depth) do
    depth =
      Mix.Shell.IO.prompt("How many directories deep do you wish to search? ")
      |> String.trim()

    try do
      depth_int = depth |> String.to_integer()

      if depth_int > 0, do: depth_int, else: default_depth
    rescue
      ArgumentError -> default_depth
    end
  end

  # set_query determines which file to search for
  defp set_query() do
    Mix.Shell.IO.prompt("\nWhich file are you looking for?")
    |> String.trim()
  end

  # search searches a directory structure for a file
  defp search() do
    max_depth = set_search_depth(1)
    current_depth = 0
    root = get_search_root()
    query = set_query()

    IO.puts("Searching #{root} #{max_depth} level(s) deep for #{query}")

    spawn_link(fn ->
      Enum.map(
        walk_directory(
          max_depth,
          current_depth,
          root,
          query
        ),
        fn x -> x end
      )
    end)
  end

  # open opens a file
  defp open(filepath) do
    case :os.type() do
      {:unix, :linux} ->
        System.cmd("xdg-open", [filepath])

      {:unix, :darwin} ->
        System.cmd("open", [filepath])

      {:win32, :nt} ->
        System.cmd(filepath, [])
    end
  end

  # indent indents the stdout text
  defp indent(depth, acc, indentation_symbol, output_text) do
    if is_number(acc) and acc > -1 and acc < depth,
      do: indent(depth, acc + 1, indentation_symbol, "#{indentation_symbol}#{output_text}"),
      else: output_text
  end

  defp strip_path_prefix(prefixs, filepath) do
    filepath
    |> Path.relative_to_cwd()
    |> Path.split()
    |> Enum.drop(prefixs)
  end

  # format_filename prints a filename to stdout
  defp format_filename(current_depth, filepath) do
    try do
      filepath = strip_path_prefix(current_depth, filepath) |> Path.join()

      indent = indent(current_depth, 0, "  ", "")

      filename_output =
        if filepath |> File.dir?(), do: "#{indent}#{filepath}/", else: "#{indent}#{filepath}"

      IO.puts(filename_output)
    rescue
      FunctionClauseError -> nil
    end
  end

  # walk_directory walks a directory structure
  defp walk_directory(max_depth, current_depth, dir, match) do
    Enum.map(File.ls!(dir), fn file ->
      filepath = "#{dir}/#{file}" |> Path.expand()

      format_filename(current_depth, filepath)

      if String.contains?(file |> String.downcase(), match |> String.downcase()) and
           File.exists?(match),
         do: open(match)

      if File.dir?(filepath) and current_depth < max_depth,
        do: walk_directory(max_depth, current_depth + 1, filepath, match)
    end)
  end
end
