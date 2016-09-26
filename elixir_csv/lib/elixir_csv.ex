defmodule ElixirCsv do
  use Application

  # start begins the supervision tree
  def start(_type, _args) do
    import Supervisor.Spec, warn: true

    # children stores the workers and child supervisors to be supervised.
    children = [
      worker(ElixirCsv, [], []),
    ]

    # opts stores OTP supervision options.
    opts = [strategy: :one_for_one, name: ElixirCsv.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # get_data opens a file and splits it into a list at each each newline.
  def get_data(f) do
    File.stream!(f)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.to_list
  end

  # split_record splits each record into separate fields.
  def split_record(data) do
    Stream.map(data, fn(x) -> String.split(x, ",") end)
    |> Enum.to_list
  end

  # format_date splits the date value into an integer tuple.
  def format_date(date) do
    String.split(date, "/")
    |> Enum.map(fn(x) -> String.to_integer(x) end)
    |> List.to_tuple
  end

  # create_record transforms csv source file into tuple records.
  def create_record(source) do
    source
    |> get_data
    |> split_record
    |> Enum.map(fn(x) -> %{:date => format_date(List.first(x)),
                           :title => List.last(x)}
                         end)
    # Other ways to write the function
    # Enum.map(input, fn(x) -> %{:date => List.first(x), :title => List.last(x)} end)
    # Enum.map(input, &(%{:date => List.first(&1), :title => List.last(&1)}))
  end

  def new(file) do
    create_record(file)
  end
end