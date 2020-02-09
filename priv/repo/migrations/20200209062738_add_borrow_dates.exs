defmodule Uplog.Repo.Migrations.AddBorrowDates do
  use Ecto.Migration

  def change do
    alter table(:borrow_requests) do
      add :start_at, :naive_datetime
      add :end_at, :naive_datetime
    end
  end
end
