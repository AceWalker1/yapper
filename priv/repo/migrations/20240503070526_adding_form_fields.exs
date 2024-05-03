defmodule Yapper.Repo.Migrations.AddingFormFields do
  use Ecto.Migration

  def change do
    create table("post") do
      add :title, :string
      add :content, :string

      timestamps()
    end
  end
end
