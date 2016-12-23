defmodule FridgeServer do
  use GenServer

  def init(state) do
    {:ok, state}
  end

  def start_link(module, state, options \\ []) do
    {:ok, fridge} = :gen_server.start_link(__MODULE__, state, options)
    fridge
  end

  def store(server_ref, food_item) do
    :gen_server.call(server_ref, {:store, food_item})
  end

  def take(server_ref, food_item) do
    :gen_server.call(server_ref, {:take, food_item})
  end

  def handle_call({:store, food_item}, _, state) do
    {:reply, :ok, [food_item|state]}
  end
  
  def handle_call({:take, food_item}, _, state) do
    case Enum.member?(state, food_item) do
      true ->
        {:reply, {:ok, food_item}, List.delete(state, food_item)}
      false ->
        {:reply, :not_found, state}
    end
  end
end

defmodule FridgeServerTest do
  use ExUnit.Case, async: true

  test "the fridge accepts food" do
    fridge = FridgeServer.start_link(__MODULE__, [])
    assert :ok == FridgeServer.store(fridge, :bacon) 
  end

  test "can remove items from the fridge" do
    fridge = FridgeServer.start_link(__MODULE__, [])
    FridgeServer.store(fridge, :bacon)
    assert {:ok, :bacon} == FridgeServer.take(fridge, :bacon)
  end

  test "cannot remove items from the fridge if they are not stored in the fridge" do
    fridge = FridgeServer.start_link(__MODULE__, [])
    assert :not_found == FridgeServer.take(fridge, :bacon)
  end
end
