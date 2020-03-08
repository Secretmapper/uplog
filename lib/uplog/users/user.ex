"""
Author: Arian Allenson Valdez
This is a course requirement for CS 192
Software Engineering II under the
supervision of Asst. Prof. Ma. Rowena C.
Solamo of the Department of Computer
Science, College of Engineering, University
of the Philippines, Diliman for the AY 2019-
2020
Arian Allenson Valdez - 26/01/2020 - Scaffold, Add assoc
Arian Allenson Valdez - 08/03/2020 - Add user id/name
"""

defmodule Uplog.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    field :super_user, :boolean, default: false
    field :name, :string
    field :school_id, :string
    many_to_many :organizations, Uplog.Borrowables.Organization, join_through: Uplog.Borrowables.OrganizationsUsers, where: [visible: true]

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:name, :school_id])
    |> Ecto.Changeset.validate_required([:name, :school_id])
  end
end
