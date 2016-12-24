defmodule SipsMatcher do
  use GenStateMachine
  
  def init(state) do
    {:ok, [:starting|state], []}
  end

  def start_link(module, state, options \\ []) do
    {:ok, fsm} = :gen_statem.start_link(__MODULE__, state, options)
    fsm
  end

  def consume(fsm, letter) do
    case letter do
      letter when letter == :s or letter == :i or letter == :p ->
        :gen_statem.call(fsm, letter)
      _ -> :gen_statem.call(fsm, :no_match)
    end
  end

  def handle_event({:call, from}, :s, state, data) do
    cond do
      state == [:starting] ->
        {:next_state, [:got_s|state], data, [{:reply, from, :got_s}]}
      Enum.member?(state, :got_sip) ->
        {:next_state, [:got_sips|state], data, [{:reply, from, :got_sips}]}
      Enum.member(state, :got_sip) == false ->
        {:keep_state_and_data, [{:reply, from, state}]}
    end
  end
  
  def handle_event({:call, from}, :i, state, data) do
    case Enum.member?(state, :got_s) do
      true ->
        {:next_state, [:got_si|state], data, [{:reply, from, hd(state)}]}
      false ->
        {:keep_state_and_data, [{:reply, from, :got_i}]}
      end
  end

  def handle_event({:call, from}, :p, state, data) do
    case Enum.member?(state, :got_si) do
      true ->
        {:next_state, [:got_sip|state], data, [{:reply, from, hd(state)}]}
      false ->
        {:keep_state_and_data, [{:reply, from, :got_p}]}
    end
  end

  def handle_event({:call, from}, :no_match, state, data) do
    {:keep_state_and_data, [{:reply, from, hd(state)}]}
  end

end

defmodule SipsMatcherTest do
  use ExUnit.Case, async: true

  test "[:starting] successfully consumes the string 's'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    assert SipsMatcher.consume(fsm, :s) == :got_s
  end

  test "it successfully consumes the string 'i'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    assert SipsMatcher.consume(fsm, :i) == :got_i
  end

  test "it successfully consumes the string 'p'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    assert SipsMatcher.consume(fsm, :p) == :got_p
  end
  
  test "[:starting] successfully consumes strings other than 's'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    assert SipsMatcher.consume(fsm, :j) == :starting
  end

  test "it successfully consumes string without a match" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    SipsMatcher.consume(fsm, :s)
    SipsMatcher.consume(fsm, :i)
    SipsMatcher.consume(fsm, :p)
    assert SipsMatcher.consume(fsm, :k) == :got_sip
  end

  test "it successfully consumes the string 'sips'" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    SipsMatcher.consume(fsm, :s)
    SipsMatcher.consume(fsm, :i)
    SipsMatcher.consume(fsm, :p)
    assert SipsMatcher.consume(fsm, :s) == :got_sips
  end

  test "it cannot fall out of 'got_sips' state" do
    fsm = SipsMatcher.start_link(SipsMatcher, [])
    SipsMatcher.consume(fsm, :s)
    SipsMatcher.consume(fsm, :i)
    SipsMatcher.consume(fsm, :p)
    SipsMatcher.consume(fsm, :s)
    assert SipsMatcher.consume(fsm, :k) == :got_sips
    assert SipsMatcher.consume(fsm, :i) == :got_sips
  end
end
