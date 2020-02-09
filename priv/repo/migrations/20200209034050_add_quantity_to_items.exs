defmodule Uplog.Repo.Migrations.AddQuantityToItems do
  use Ecto.Migration

  def change do
    alter table(:borrowable_items) do
      add :quantity, :integer
    end
  end
end
