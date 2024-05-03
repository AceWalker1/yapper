defmodule Yapper.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post" do
    field :title, :string
    field :content, :string

    timestamps()
  end

  def changeset(post, params) do
    post
    |>cast(params, [:title, :content])
    |>validate_required([:title, :content])
  end
end
