defmodule Availabit.Events.EventEntry do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events_entries" do
    field :slots, :string
    field :event_id, :id
    belongs_to :user, Availabit.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(event_entry, attrs) do
    event_entry
    |> cast(attrs, [:slots, :user_id, :event_id])
    |> validate_required([:slots])
  end

  defimpl Poison.Encoder, for: Availabit.Events.EventEntry do
    def encode(entry, options) do
      entry
      |> Map.take([:slots, :user])
      |> Map.update!(:slots, fn slots -> Poison.decode!(slots) end)
      |> Poison.Encoder.encode(options)
    end
  end
end