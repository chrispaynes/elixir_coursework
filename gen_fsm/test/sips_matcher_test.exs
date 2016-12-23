defmodule SipsMatcher do
  use GenStateMachine
  
  def init(state) do
    {:ok, :starting, []}
  end

  def start_link(module, state, options \\ []) do
    {:ok, fsm} = :gen_statem.start_link(__MODULE__, state, options)
    fsm
  end

  def consume_s(fsm) do
    :gen_statem.call(fsm, :s)
  end

  def consume_not_s(fsm) do
    :gen_statem.call(fsm, :not_s)
  end
  
  def handle_event({:call, from}, :s, state, data) do
    {:next_state, [:got_s|state], data, [{:reply, from, :got_s}]}
  end

  def handle_event({:call, from}, :not_s, state, data) do
    {:next_state, state, data, [{:reply, from, :starting}]}
  end

  def starting(:s, from, state_data) do
    {:reply, :got_s, :got_s, state_data}
  end

end

defmodule SipsMatcherTest do
  use ExUnit.Case, async: true

  test "[:starting] successfully consumes the string 's'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    assert SipsMatcher.consume_s(fsm) == :got_s
  end

  test "[:starting] successfully consumes strings other than 's'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    assert SipsMatcher.consume_not_s(fsm) == :starting
  end
end
