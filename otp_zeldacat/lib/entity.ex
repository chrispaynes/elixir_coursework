defmodule Entity do
  use GenEvent

  def init do
    GenEvent.start_link
  end

  def notify(pid, event) do
  end

  def add_component(manager, handler, args) do
    GenEvent.add_handler(manager, handler, args)
  end
end
