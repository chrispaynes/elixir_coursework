defmodule ListSupervisor do
  import Supervisor.Spec

  def start_link do
    result = {:ok, sup} = :supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(supervisor) do
    {:ok, state} = :supervisor.start_child(supervisor, worker(StateData, []))
    :supervisor.start_child(supervisor, worker(ListSubSupervisor, [state]))
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end

end
