defmodule EctoPersistence.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def up do
    create table(:tweets) do
      add :content, :string, size: 140
      add :author,  :string, size: 50
    
    end
  end

  def down do
    drop table(:tweets)
  end
end
