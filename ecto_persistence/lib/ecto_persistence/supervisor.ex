defmodule EctoPersistence.Supervisor do
  import Supervisor.Spec

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [ worker(EctoPersistence.Repo, []) ]
    {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end

end
