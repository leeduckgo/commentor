defmodule Commentor.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table :comment do
      add :name, :string
      add :context, :string
      add :article_id, :string
      timestamps()
    end
  end
end
