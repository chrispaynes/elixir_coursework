defmodule BankAccount do
  def start do
    IO.puts "\n-----------------------------------------------------"
    IO.puts "EVENT#\t\tACCOUNT BALANCE\t\tEVENT TYPE"
    IO.puts "-----------------------------------------------------"
    await_events([])
  end

  def await_events(events, acc \\ 0) do
    IO.puts Integer.to_string(acc) <> "\t\t" <> Integer.to_string calculate_balance(events)

    receive do
      {:query_balance, pid} -> query_balance(events, pid)
      {:deposit_into_account, amount} -> events = deposit_into_account(amount, events)
      {:withdraw_from_account, amount} -> events = withdraw_from_account(amount, events)
    end

    await_events(events, acc + 1)
  end

  def query_balance(events, pid) do
    send(pid, {:balance, calculate_balance(events)})
  end

  defp calculate_balance(events) do
    deposits = sum(deposit_events(events))
    withdrawls = sum(withdrawal_events(events))
    deposits - withdrawls
  end

  defp filter_events(events, event_type) do
    Enum.filter(events, fn({type, _}) -> type == event_type end)
  end

  defp deposit_events(events) do
    filter_events(events, :deposit_into_account)
  end

  defp withdrawal_events(events) do
    filter_events(events, :withdraw_from_account)
  end

  defp sum(events) do
    Enum.reduce(events, 0, fn({_, amount}, acc) -> acc + amount end)
  end

  defp deposit_into_account(amount, events) do
    events ++ [{:deposit_into_account, amount}]
  end

  defp withdraw_from_account(amount, events) do
    events ++ [{:withdraw_from_account, amount}]
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
    send(account, {:query_balance, self})
    assert_receive {:balance, ^expected_balance}
  end
end
