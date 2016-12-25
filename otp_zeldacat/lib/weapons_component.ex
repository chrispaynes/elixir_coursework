defmodule WeaponsComponent do
  use GenEvent

  def init(state) do
    {:ok, [state]}
  end

  def list_weapons(manager) do
    GenEvent.call(manager, WeaponsComponent, :list_weapons)
  end

  def handle_call(:list_weapons, state) do
    {:ok, state, state}
  end

  def handle_event({:add_weapon, new_weapon}, state) do
    {:ok, state ++ [new_weapon]}
  end

end
