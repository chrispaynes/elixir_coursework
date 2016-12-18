defmodule Pong do
  @moduledoc """
    A module to send ':pong' messages to and receive  ':ping' messages from a PID mailbox. 
  """
  
  @doc """
    Initiates a send and receive message loop.
  """
  def start do
    await
  end

  @doc """
    Waits for a `{:ping, pid}` message then sends the process' mailbox a `{:pong, self}` message.
    Recursively calls itself to maintain a send/receive message loop.
  """
  def await do
    receive do
      {:ping, pid} -> send pid, {:pong, self}
    end
    await
  end
end
