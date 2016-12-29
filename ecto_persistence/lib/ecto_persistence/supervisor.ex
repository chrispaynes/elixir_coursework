defmodule EctoPersistence.Supervisor do
  import Supervisor.Spec

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [ worker(EctoPersistence.Repo, []) ]
    supervise(children, strategy: :one_for_one)
  end

end
