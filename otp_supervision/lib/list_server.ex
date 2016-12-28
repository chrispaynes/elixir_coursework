defmodule ListServer do
  use GenServer

  def start_link(state_data_pid) do
    GenServer.start_link(__MODULE__, state_data_pid, name: :state)
  end

  def clear do
    GenServer.cast(:state, :clear)
  end

  def add(item) do
    GenServer.cast(:state, {:add, item})
  end

  def remove(item) do
    GenServer.cast(:state, {:remove, item})
  end

  def items do
    GenServer.call(:state, :items)
  end

  def crash do
    GenServer.cast(:state, :crash)
  end

  def init(state_data_pid) do
    state = StateData.get_state(state_data_pid)
    {:ok, {state, state_data_pid}}
  end
  
  def handle_cast(:clear, {_state, state_data_pid}) do
    {:noreply, {[], state_data_pid}}
  end

  def handle_cast({:add, item}, {state, state_data_pid}) do
    {:noreply, {state ++ [item], state_data_pid}}
  end

  def handle_cast({:remove, item}, {state, state_data_pid}) do
    {:noreply, {List.delete(state, item), state_data_pid}}
  end

  def handle_cast(:crash, _state) do
    1 == 3 
  end

  def handle_call(:items, _from, {state, state_data_pid}) do
    {:reply, state, {state, state_data_pid}}
  end

  def terminate(_reason, {state, state_data_pid}) do
    StateData.save_state(state_data_pid, state)
  end
end
