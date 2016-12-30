defmodule KillaBees do
  use GenServer

  def start_link(_module, state) do
    {:ok, state} = GenServer.start_link(__MODULE__, state)
    state 
  end

  def init(state) do
    {:ok, state}
  end

  def awake(server, {:bee, swarm_size}) do
    GenServer.call(server, {:bee, swarm_size})
  end

  def handle_call({:bee, swarm_size}, _from, state) do
    buzz = buzz(swarm_size)
    {:reply, buzz, [buzz] ++ state }
  end

  defp buzz(swarm_size) when swarm_size < 1, do: ""

  defp buzz(1), do: "Buzz"

  defp buzz(swarm_size) when swarm_size > 1 do
    Enum.map_join(1..swarm_size, fn(_x) -> ["Buzz"] ++ [] end)
  end

end

defmodule BeeTest do
  use ExUnit.Case, async: true

  test "remains quiet when no bees are awakened" do
    swarm = KillaBees.start_link(__MODULE__, [])
    assert KillaBees.awake(swarm, {:bee, 0}) == ""
  end

  test "outputs message when a bee is awakened" do
    swarm = KillaBees.start_link(__MODULE__, [])
    assert KillaBees.awake(swarm, {:bee, 1}) == "Buzz"
  end
  
  test "outputs a different message when multiple bees are awakened" do
    swarm = KillaBees.start_link(__MODULE__, [])
    assert KillaBees.awake(swarm, {:bee, 5}) == "BuzzBuzzBuzzBuzzBuzz"
  end
end
