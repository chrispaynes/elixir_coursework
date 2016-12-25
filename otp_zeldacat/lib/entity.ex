defmodule Entity do
  use GenEvent

  def init do
    GenEvent.start_link
  end

  def notify(manager, event) do
    GenEvent.notify(manager, event)
  end

  def add_component(manager, handler, args) do
    GenEvent.add_handler(manager, handler, args)
  end
end
