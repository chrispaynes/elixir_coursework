defmodule BankAccount.User do
  use Ecto.Schema

  schema "user" do
    #field :id, primary_key: true
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string

    #@primary_key {:user_id, autogenerate: true}
    #@foreign_key_type :user_id
    #has_many :accounts, BankAccount.Account
  end

end
