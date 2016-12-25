defmodule XYComponent do
  use GenEvent

  def init(state) do
    {:ok, state}
  end

  def get_position(manager) do
    GenEvent.call(manager, XYComponent, :get_position)
  end

  def handle_call(:get_position, state) do
    {:ok, state, state}
  end

  def handle_event({:move, {:y, new_y_coord}}, {state, _} ) do
    {:ok, {state, new_y_coord}}
  end

  def handle_event({:move, {:x, new_x_coord}}, {_, state} ) do
    {:ok, {new_x_coord, state}}
  end
end
