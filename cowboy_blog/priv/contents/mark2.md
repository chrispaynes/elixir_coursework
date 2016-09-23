# CowboyBlog

**Simple Elixir App using Cowboy HTTP SERVER**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `cowboy_blog` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:cowboy_blog, "~> 0.1.0"}]
    end
    ```

  2. Ensure `cowboy_blog` is started before your application:

    ```elixir
    def application do
      [applications: [:cowboy_blog]]
    end
    ```

## Start The CowboyBlog OTP App
    $ iex -S mix
    $ curl -i http://localhost:8000
    visit http://localhost:8000

    OUTPUT:
    -------------------------------------
    HTTP/1.1 200 OK
    server: Cowboy
    date: Fri, 23 Sep 2016 03:35:46 GMT
    content-length: 15
    content-type: text/plain

    Cowboy Blog 1.0%
    -------------------------------------

## Observer The BEAM Processes
    $ :observer.start()