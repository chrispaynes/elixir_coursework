defmodule BankAccount do
  def start do
    await
  end

  def await do
    receive do
      {:check_balance, pid} -> get_balance(pid)
    end
    await
  end

  def get_balance(pid) do
    send(pid, {:balance, 0})
  end
end

defmodule BankAccountTest do
  use ExUnit.Case
  doctest BankAccount

  test "the bank account starts with a zero balance" do
    account = spawn_link(BankAccount, :start, [])
    verify_balance_is 0, account
  end

  def verify_balance_is(expected_balance, account) do
    send(account, {:check_balance, self})
    assert_receive {:balance, ^expected_balance}
  end
end
