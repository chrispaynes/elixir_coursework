defmodule EctoPersistence.Repo do
  use Ecto.Repo, otp_app: :ecto_persistence

  Application.get_env(:ecto_persistence, :ecto_repos)
end

