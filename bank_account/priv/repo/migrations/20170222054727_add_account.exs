defmodule BankAccount.Repo.Migrations.AddAccount do
  use Ecto.Migration

  def change do
    create table(:account) do
      add :balance, :decimal
      add :type, :string, size: 8
      add :transaction_id, :integer

      timestamps
    end
  end
end
