defmodule PingTest do
  use ExUnit.Case

  test "it responds to a 'pong' message with a 'ping' message" do
    # create spawn a process to run the ping module
    # starts with :start fn
    # spawns new process and links it to the current process
    # when ping process dies, current process will be notified
    # returns the PID of the spawn process
    ping = spawn_link(Ping, :start, [])

    # send the module a :pong message, and self's PID
    # process goes into ping processes mailbox
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
