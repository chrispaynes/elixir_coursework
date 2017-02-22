defmodule BankAccount.User do
  use Ecto.Schema

  schema "user" do
    @primary_key {:id, autogenerate: true}
    field :first_name, :string
    field :middle_init, :string
    field :last_name, :string

    timestamps
  end

end
