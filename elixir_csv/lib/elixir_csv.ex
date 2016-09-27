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

  # get_data opens a file and splits the text into a list at each newline.
  def get_data(f) do
    File.stream!(f)
    |> Stream.map(&(String.trim(&1, "\n")))
    |> Enum.to_list
  end

  # split_record splits each record into separate fields.
  def split_record(data) do
    data
    |> Stream.map(&(String.split(&1, ",")))
    |> Enum.to_list
  end

  # format_date splits the date value into a tuple of integers.
  def format_date(date) do
    # Regex.split splits the date string by non-digit values.
    Regex.split(~r/\D/, date)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list
    |> List.to_tuple
  end

  # create_record transforms csv source file into tuple records.
  def create_record(source) do
    source
    |> get_data
    |> split_record
    |> Enum.map(&(%{"date" => format_date(List.first(&1)), "title" => List.last(&1)}))
    # Other ways to write the function
    # Enum.map(input, fn(x) -> %{:date => List.first(x), :title => List.last(x)} end)
    # Enum.map(input, &(%{:date => List.first(&1), :title => List.last(&1)}))
  end

  def new(file) do
    create_record(file)
  end
end
