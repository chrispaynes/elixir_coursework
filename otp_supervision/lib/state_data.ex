defmodule StateData do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], [])
  end

  def save_state(server, state) do
    GenServer.cast(server, {:save_state, state})
  end

  def get_state(server) do
    GenServer.call(server, :get_state)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:save_state, new_state}, state) do
    {:noreply, new_state}
  end
end
