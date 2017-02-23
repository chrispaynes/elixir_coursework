# EctoPersistence

**TODO: Add description**

## Features
* Ecto Migrations
* Ecto Repos
* Ecto Schemas
* OTP Supervision
* Postgrex and Postgres DB
*

Install Postgres(Link to Instructions)

Set password in repo.ex file to match username and password for your Postgres instance

using psql create a postgres database and quit psql

```
=# CREATE DATABASE ecto_persistence;
CREATE DATABASE

=# psql
```



#########
Migrate EctoPersistence.Repo to EctoPersistence DB
```
$ mix ecto.migrate EctoPersistence.Repo

23:22:00.526 [info]  == Running EctoPersistence.Repo.Migrations.CreateTweets.up/0 forward

23:22:00.526 [info]  create table tweets

23:22:00.535 [info]  == Migrated in 0.0s
```
##########

##########
Start up iex -S mix and insert a tweet into the DB
iex(1)> jose = %EctoPersistence.Tweet{content: "No Way Jose", author: "Chris McCord", id: 0}
EctoPersistence.Repo.insert(jose)
##########

##########
open PSQL, connect to the DB and verify the "tweets" table was populated
'/Applications/Postgres.app/Contents/Versions/9.5/bin'/psql -p5432

psql 

XXX=# \connect ecto_persistence;
You are now connected to database "ecto_persistence" as user "XXX".

ecto_persistence=# select * from tweets;
 id |   content   |    author
 ----+-------------+--------------
  0 | No Way Jose | Chris McCord
(1 row)
##########

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

