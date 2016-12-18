defmodule PongTest do
  use ExUnit.Case

  @doc """
    Spawns the start function, linking it to the current process and returns its pid.
    Sends pong's process mailbox a message, along with a :ping message and self's PID.
    Asserts the message {:pong, pong} message pattern was or is going to be received.
  """
  test "it responds to a 'ping' message with a 'pong' message" do
    pong = spawn_link(Pong, :start, [])
    send pong, {:ping, self}
    assert_receive {:pong, pong}
  end

  test "it responds to two 'ping's with two 'pong's" do
    pong = spawn_link(Pong, :start, [])
    send pong, {:ping, self}
    assert_receive {:pong, pong}

    pong = spawn_link(Pong, :start, [])
    send pong, {:ping, self}
    assert_receive {:pong, pong}
  end
end
