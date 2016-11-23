# Elixseeker

Elixseeker is a small Elixir/Erlang command line app the finds files and folders by name.


## Goals

Elixseeker aims to speed up file search time by searching concurrently.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `elixseeker` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:elixseeker, "~> 0.1.0"}]
    end
    ```

  2. Ensure `elixseeker` is started before your application:

    ```elixir
    def application do
      [applications: [:elixseeker]]
    end
    ```

