defmodule BankAccount.Transaction do
  use Ecto.Schema

  schema "transaction" do
    @primary_key {:id, autogenerate: true}
    field :transaction_number, :integer
    field :balance, :decimal
    field :amount, :decimal
    field :transaction_type, :string

    #has_one :account_id, Account
    belongs_to :account, BankAccount.Account
  end
end
