defmodule Pong do
  @moduledoc """
    A module to send ':pong' messages to and receive  ':ping' messages from a PID mailbox. 
  """
  
  @doc """
    Initiates a send and receive message loop
    and sets the await's count state to 0.
  """
  def start do
    await(0)
  end

  @doc """
    Waits for a `{:ping, pid}` message then sends the process' mailbox
    a `{:pong, self}` message. Tracks how many messages were received.
    Recursively calls itself to maintain a send/receive message loop.
  """
  def await(count) do
    receive do
      {:ping, pid} -> send pid, {:pong, self}
    end
    IO.puts "Pong received a ping #{count + 1} times"
    await(count + 1)
  end
end
