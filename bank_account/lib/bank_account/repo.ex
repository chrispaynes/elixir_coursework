defmodule BankAccount.Repo do
  use Ecto.Repo, otp_app: :bank_account

  Application.get_env(:bank_account, :ecto_repos)
end
