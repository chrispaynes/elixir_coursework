defmodule BankAccountTest do
  use ExUnit.Case
  doctest BankAccount

  @tag :skip
  test "the bank account starts with a zero balance" do
    account = spawn_link(BankAccount, :start, [])
    verify_balance_is 0, account
  end

  @tag :skip
  test "the bank account accepts a deposit" do
    account = spawn_link(BankAccount, :start, [])
    send(account, {:deposit_into_account, 25})
    verify_balance_is 25, account
  end

  @tag :skip
  test "the bank account accepts a withdrawal" do
    account = spawn_link(BankAccount, :start, [])
    send(account, {:deposit_into_account, 25})
    send(account, {:withdraw_from_account, 20})
    verify_balance_is 5, account
  end

  @tag :skip
  test "the bank account transactions persist to a database" do
    account = spawn_link(BankAccount, :start, [])
    connection = BankAccount.get_by(User, %{username: "Geo"}) 
    send(account, {:deposit_into_account, 25})
    send(account, {:persist_to_db})
    #pull_last_db_transaction connection, {:deposit_into_account, 25}
  end

  def pull_last_db_transaction() do
  end

  def verify_balance_is(expected_balance, account) do
    send(account, {:query_balance, self})
    assert_receive {:balance, ^expected_balance}
  end

end
