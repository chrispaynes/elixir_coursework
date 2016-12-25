defmodule HealthComponent do
  use GenEvent

  def get_hp(entity) do
    GenEvent.call(entity, HealthComponent, :get_hp)
  end

  def init(hp) do
    {:ok, hp}
  end

  #def handle_call(request, state) do
  def handle_call(:get_hp, hp) do
    #{:ok, reply, new_state}
    {:ok, hp, hp}
  end

end
