defmodule SipsMatcher do
  use GenStateMachine
  
  def init(state) do
    {:ok, [:starting|state], []}
  end

  def start_link(module, state, options \\ []) do
    {:ok, fsm} = :gen_statem.start_link(module, state, options)
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
      hd(state) == :starting ->
        {:next_state, [:got_s|state], data, [{:reply, from, :got_s}]}
      hd(state) == :got_sip ->
        {:next_state, [:got_sips|state], data, [{:reply, from, :got_sips}]}
      hd(state) == :got_sips ->
        {:keep_state_and_data, [{:reply, from, hd(state)}]}
      hd(state) != :starting or hd(state) != :got_sip ->
        {:keep_state_and_data, [{:reply, from, :got_s}]}
    end
  end
  
  def handle_event({:call, from}, :i, state, data) do
    cond do
      hd(state) == :got_s ->
        {:next_state, [:got_si|state], data, [{:reply, from, :got_i}]}
      hd(state) == :got_sips ->
        {:keep_state_and_data, [{:reply, from, hd(state)}]}
      hd(state) != :got_s ->
        {:keep_state_and_data, [{:reply, from, :got_i}]}
    end
  end

  def handle_event({:call, from}, :p, state, data) do
    cond do
      hd(state) == :got_si ->
        {:next_state, [:got_sip|state], data, [{:reply, from, :got_p}]}
      hd(state) == :got_sips ->
        {:keep_state_and_data, [{:reply, from, hd(state)}]}
      hd(state) != :got_si ->
        {:keep_state_and_data, [{:reply, from, :got_p}]}
    end    
  end

  def handle_event({:call, from}, :no_match, state, _data) do
    {:keep_state_and_data, [{:reply, from, hd(state)}]}
  end

end