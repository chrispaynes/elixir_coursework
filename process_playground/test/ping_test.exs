defmodule PingTest do
  use ExUnit.Case

  @doc """
    Spawns the start function, linking it to the current process and returns its pid.
    Sends ping's process mailbox a message, along with a :pong message and self's PID.
    Asserts the message {:ping, ping} message pattern was or is going to be received.
  """
  test "it responds to a 'pong' message with a 'ping' message" do
    ping = spawn_link(Ping, :start, [])
    send ping, {:pong, self}
    assert_receive {:ping, ping}
  end

  test "it responds to two 'pong's with two 'ping's" do
    ping = spawn_link(Ping, :start, [])
    send ping, {:pong, self}
    assert_receive {:ping, ping}

    ping = spawn_link(Ping, :start, [])
    send ping, {:pong, self}
    assert_receive {:ping, ping}
  end
end
