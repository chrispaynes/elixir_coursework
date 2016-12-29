# EctoPersistence

**TODO: Add description**

Install Postgres(Link to Instructions)

Set password in repo.ex file to match username and password for your Postgres instance

using psql create a postgres database and quit psql

```
=# CREATE DATABASE ecto_persistence;
CREATE DATABASE

=# psql
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `ecto_persistence` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ecto_persistence, "~> 0.1.0"}]
    end
    ```

  2. Ensure `ecto_persistence` is started before your application:

    ```elixir
    def application do
      [applications: [:ecto_persistence]]
    end
    ```

