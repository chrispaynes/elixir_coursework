defmodule ListSubSupervisor do
  import Supervisor.Spec

  def start_link(state_data_pid) do
    :supervisor.start_link(__MODULE__, state_data_pid)
  end

  def init(state_data_pid) do
    children = [worker(ListServer, [state_data_pid])]
    supervise(children, strategy: :one_for_one)
  end
end
