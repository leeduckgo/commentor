defmodule Commentor.Comment do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias Commentor.{Repo, Comment}

  schema "comment" do
    field :name, :string
    field :context, :string
    field :article_id, :string
    timestamps()
  end

  def get_by_article_id(ele) do
    Comment
    |> where([c], c.article_id == ^ele)
    |> Repo.all()
  end

  def get_all(), do: Repo.all(Comment)

  def create(attrs \\ %{}) do
    %Comment{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def changeset(%Comment{} = ele) do
    changeset(ele, %{})
  end

  def changeset(%Comment{} = ele, attrs) do
    cast(ele, attrs, [:name, :context, :article_id])
  end
end
