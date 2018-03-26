defmodule Availabit.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset


@derive {Poison.Encoder, only: [:id, :location, :name, :user, :entries]}
schema "events" do
  field :location, :string
  field :name, :string
  belongs_to :user, Availabit.Accounts.User
  has_many :entries, Availabit.Events.EventEntry

  timestamps()
end

@doc false
def changeset(event, attrs) do
  event
  |> cast(attrs, [:name, :location, :user_id])
  |> validate_required([:name, :location, :user_id])
end
end