defmodule Uplog.Repo.Migrations.AddUserData do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :string
      add :school_id, :string
    end
  end
end
