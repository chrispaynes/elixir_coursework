defmodule EctoPersistence do
  use Application

  def start(_type, _args) do
    EctoPersistence.Supervisor.start_link
  end
end
