defmodule PongTest do
  use ExUnit.Case

  test "it responds to a 'ping' message with a 'pong' message" do
    # create spawn a process to run the pong module
    # starts with :start fn
    # spawns new process and links it to the current process
    # when pong process dies, current process will be notified
    # returns the PID of the spawn process
    pong = spawn_link(Pong, :start, [])

    # send the module a :pong message, and self's PID
    # process goes into pong processes mailbox
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
