# ElixirCsv

## About
Exercise challenge from Saša Jurić's, "[Elixir in Action](https://www.manning.com/books/elixir-in-action)" book.

Create a TodoList instance from a CSV file.
Assume that you have a file todos.csv in the current folder.
Each line in the file describes a single to-do entry:

```
2016/12/19,Dentist
2016/12/20,Shopping
2016/12/19,Movies
```

## Pseudocode Steps
  1. Open the file removing each "\n".
  2. Parse each line into a {{year, month, date}, title} tuple.
  3. Convert each date item into an integer.
  4. Create an enumerable of maps that represents each entry.
  5. Pass the enumerable to a MODULE.new/1 function.

## Featured Language Syntax
 * Anonymous Functions
   * fn(x) -> x + 1 end
 * Capture Operator
   * &(&1 + &2)
 * Enum Module / Eager Evaluation
 * Maps
   * %{a: 1, b: 2}
 * Pipe Operator
   * "hello" |> String.capitalize
 * Stream Module / Lazy Evaluation
 * Strings Module

## Start the App
 ```
 1. $ iex
 2. iex(1)> c "lib/elixir_csv.ex"
 3. iex(2)> ElixirCsv.new("todos.csv")

 output:
    [%{date: {2016, 12, 19}, title: "Dentist"},
     %{date: {2016, 12, 20}, title: "Shopping"},
     %{date: {2016, 12, 19}, title: "Movies"}]
 ```