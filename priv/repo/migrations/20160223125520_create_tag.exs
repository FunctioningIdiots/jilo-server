defmodule Jilosrv.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag, :string
      add :note, :string

      timestamps
    end

  end
end
