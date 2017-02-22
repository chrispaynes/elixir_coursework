defmodule BankAccount.Account do
  use Ecto.Schema

  schema "account" do
    @primary_key {:id, autogenerate: true}
    field :balance, :decimal, default: 0
    field :type, :string
    
    belongs_to :user_id, BankAccount.User
    has_many :transactions, BankAccount.Transaction

    timestamps
  end

end
