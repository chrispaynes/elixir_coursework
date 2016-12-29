defmodule EctoPersistence.Tweet do
  use Ecto.Schema

  schema "tweets" do
    field :content, :string
    field :author, :string
  end
end
