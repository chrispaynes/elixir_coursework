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
