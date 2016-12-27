defmodule ListServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :state)
    #GenServer.start_link(__MODULE__, [])
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

  def init(state) do
    {:ok, state}
  end
  
  def handle_cast(:clear, _state) do
    {:noreply, []}
  end

  def handle_cast({:add, item}, state) do
    {:noreply, state ++ [item]}
  end

  def handle_cast({:remove, item}, state) do
    {:noreply, List.delete(state, item)}
  end

  def handle_cast(:crash, state) do
    1 == 3 
  end

  def handle_call(:items, _from, state) do
    {:reply, state, state}
  end
end
