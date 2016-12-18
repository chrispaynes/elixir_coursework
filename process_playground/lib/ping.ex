defmodule Ping do
  @moduledoc """
    A module to send ':ping' messages to and receive  ':pong' messages from a PID mailbox. 
  """
  
  @doc """
    Initiates a send and receive message loop.
  """
  def start do
    await
  end

  @doc """
    Waits for a `{:pong, pid}` message then sends the process' mailbox a `{:ping, self}` message.
    Recursively calls itself to maintain a send/receive message loop.
  """
  def await do
    receive do
      {:pong, pid} -> send pid, {:ping, self}
    end
    await
  end
end
