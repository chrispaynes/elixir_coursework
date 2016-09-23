defmodule CowboyBlog do
  use Application

  # start begins the supervision tree
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # chilren stores the workers and child supervisors to be supervised.
    children = [
      # Starts a worker by calling: CowboyBlog.Worker.start_link(arg1, arg2, arg3)
      worker(CowboyBlog, [], function: :run),
    ]

    # opts stores OTP supervision options.
    opts = [strategy: :one_for_one, name: CowboyBlog.Supervisor]
    Supervisor.start_link(children, opts)
  end

   # Run starts the cowboy httpwebserver.
  def run do
    # routes stores routes and route handler functions
    routes = [
      {"/", CowboyBlog.Handler, []}
    ]

    # Cowboy_router.compile compile the routes for use by Cowboy.
    dispatch = :cowboy_router.compile([{:_, routes}])

    # opts stores the connection port
    opts = [port: 8000]
    env = [dispatch: dispatch]

    # Cowboy.start_http start listening for HTTP connections.
    # Returns the pid for this listener’s supervisor.
    {:ok, _pid} = :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
