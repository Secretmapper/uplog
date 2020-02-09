"""
Author: Arian Allenson Valdez
This is a course requirement for CS 192
Software Engineering II under the
supervision of Asst. Prof. Ma. Rowena C.
Solamo of the Department of Computer
Science, College of Engineering, University
of the Philippines, Diliman for the AY 2019-
2020
Arian Allenson Valdez - 26/01/2020 - Scaffold, Add assoc, remove 
Arian Allenson Valdez - 28/01/2020 - Remove :visible to required changeset
Arian Allenson Valdez - 09/02/2020 - Add quantity to item
"""

defmodule Uplog.Borrowables.BorrowableItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "borrowable_items" do
    field :description, :string
    field :name, :string
    field :quantity, :integer
    field :visible, :boolean, default: true
    has_many :borrow_requests, Uplog.Borrowables.BorrowRequest
    belongs_to :organization, Uplog.Borrowables.Organization

    timestamps()
  end

  @doc false
  def changeset(borrowable_item, attrs) do
    borrowable_item
    |> cast(attrs, [:name, :description, :visible, :quantity])
    |> validate_required([:name, :description, :quantity])
    |> validate_number(:quantity, [greater_than: 0])
  end
end
