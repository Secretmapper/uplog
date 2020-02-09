defmodule Uplog.Repo.Migrations.AddNameDescriptionUniqueness do
  use Ecto.Migration

  def change do
    create unique_index(:borrowable_items, [:name, :description, :organization_id])
  end
end
