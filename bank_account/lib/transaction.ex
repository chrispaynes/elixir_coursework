defmodule BankAccount.Transaction do
  use Ecto.Schema

  schema "transaction" do
    field :transaction_number, :integer
    field :balance, :float
    field :amount, :float
    field :transaction_type
  end
end