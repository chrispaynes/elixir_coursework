defmodule ListSupervisor do
  import Supervisor.Spec

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init(state) do
    children = [worker(ListServer, state)]
    supervise(children, strategy: :one_for_one)
  end

end
