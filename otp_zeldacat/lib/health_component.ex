defmodule HealthComponent do
  use GenEvent

  def init(hp) do
    {:ok, hp}
  end

  def get_hp(manager) do
    GenEvent.call(manager, HealthComponent, :get_hp)
  end

  def alive?(manager) do
    IO.inspect manager
    GenEvent.call(manager, HealthComponent, :alive?)
  end

  def handle_call(:get_hp, hp) do
    #{:ok, reply, new_state}
    {:ok, hp, hp}
  end

  def handle_call(:alive?, hp) do
    {:ok, hp > 0, hp}
  end

end
