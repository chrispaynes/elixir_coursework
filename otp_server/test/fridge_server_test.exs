defmodule FridgeServer do
  use GenServer

  def init(state) do
    {:ok, state}
  end

  def handle_call({:store, food_item}, _, state) do
    {:reply, :ok, [food_item|state]}
  end

end

defmodule FridgeServerTest do
  use ExUnit.Case, async: true

  test "the fridge accepts food" do
    #{:ok, pid} = GenServer.start_link(Stack, [:hello])

    {:ok, fridge} = :gen_server.start_link(FridgeServer, [], [])
    assert :ok == :gen_server.call(fridge, {:store, :bacon})
  end

  @tag :skip
  test "can remove items from the fridge" do
    {:ok, fridge} = :gen_server.start_link(FridgeServer, [], [])
    :gen_server.call(fridge, {:store, :bacon})
    assert {:ok, :bacon} == :gen_server.call(fridge, {:take, :bacon})
  end

  @tag :skip
  test "cannot remove items from the fridge if they are not stored in the fridge" do
    {:ok, fridge} = :gen_server.start_link(FridgeServer, [], [])
    assert :not_found == :gen_server.call(fridge, {:take, :bacon})
  end
end
