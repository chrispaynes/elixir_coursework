defmodule BankAccount do
  def start do
    await([])
  end

  def await(events) do
    receive do
      {:check_balance, pid} -> get_balance(events, pid)
      {:deposit_into_account, amount} -> events = deposit_into_account(amount, events)
      {:withdraw_from_account, amount} -> events = withdraw_from_account(amount, events)
    end
    await(events)
  end

  def get_balance(events, pid) do
    send(pid, {:balance, calculate_balance(events)})
  end

  defp calculate_balance(events) do
    deposits = sum(just_deposits(events))
    withdrawls = sum(just_withdrawals(events))
    deposits - withdrawls
  end

  defp just_type(events, expected_type) do
    Enum.filter(events, fn({type, _}) -> type == expected_type end)
  end

  defp just_deposits(events) do
    just_type(events, :deposit_into_account)
  end

  defp just_withdrawals(events) do
    just_type(events, :withdraw_from_account)
  end

  defp sum(events) do
    Enum.reduce(events, 0, fn({_, amount}, acc) -> acc + amount end)
  end

  defp deposit_into_account(amount, events) do
    IO.inspect events ++ [{:deposit_into_account, amount}]
  end

  defp withdraw_from_account(amount, events) do
    IO.inspect events ++ [{:withdraw_from_account, amount}]
  end
end

defmodule BankAccountTest do
  use ExUnit.Case
  doctest BankAccount

  test "the bank account starts with a zero balance" do
    account = spawn_link(BankAccount, :start, [])
    verify_balance_is 0, account
  end

  test "the bank account accepts a deposit" do
    account = spawn_link(BankAccount, :start, [])
    send(account, {:deposit_into_account, 25})
    verify_balance_is 25, account
  end

  test "the bank account accepts a withdrawal" do
    account = spawn_link(BankAccount, :start, [])
    send(account, {:deposit_into_account, 25})
    send(account, {:withdraw_from_account, 20})
    verify_balance_is 5, account
  end

  def verify_balance_is(expected_balance, account) do
    send(account, {:check_balance, self})
    assert_receive {:balance, ^expected_balance}
  end
end
