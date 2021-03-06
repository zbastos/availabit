defmodule Availabit.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Availabit.Repo

  alias Availabit.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id) do
  Event
  |> Repo.get!(id)
  |> Repo.preload([[entries: :user], :user])
end

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end

  alias Availabit.Events.EventEntry

  @doc """
  Returns the list of events_entries.

  ## Examples

      iex> list_events_entries()
      [%EventEntry{}, ...]

  """
  def list_events_entries do
    Repo.all(EventEntry)
  end

  @doc """
  Gets a single event_entry.

  Raises `Ecto.NoResultsError` if the Event entry does not exist.

  ## Examples

      iex> get_event_entry!(123)
      %EventEntry{}

      iex> get_event_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_entry!(id), do: Repo.get!(EventEntry, id)

  @doc """
  Creates a event_entry.

  ## Examples

      iex> create_event_entry(%{field: value})
      {:ok, %EventEntry{}}

      iex> create_event_entry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event_entry(attrs \\ %{}) do
    %EventEntry{}
    |> EventEntry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event_entry.

  ## Examples

      iex> update_event_entry(event_entry, %{field: new_value})
      {:ok, %EventEntry{}}

      iex> update_event_entry(event_entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event_entry(%EventEntry{} = event_entry, attrs) do
    event_entry
    |> EventEntry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a EventEntry.

  ## Examples

      iex> delete_event_entry(event_entry)
      {:ok, %EventEntry{}}

      iex> delete_event_entry(event_entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event_entry(%EventEntry{} = event_entry) do
    Repo.delete(event_entry)
  end

  @doc """
Creates or update an event_entry.

## Examples

    iex> create_or_update_entry(%{field: value})
    {:ok, %EventEntry{}}

    iex> create_or_update_entry(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_or_update_entry(attrs) do
  case Repo.get_by(EventEntry, %{user_id: attrs.user_id, event_id: attrs.event_id}) do
    nil ->
      create_event_entry(attrs)
    event_entry ->
      update_event_entry(event_entry, attrs)
  end
end
  
  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_entry changes.

  ## Examples

      iex> change_event_entry(event_entry)
      %Ecto.Changeset{source: %EventEntry{}}

  """
  def change_event_entry(%EventEntry{} = event_entry) do
    EventEntry.changeset(event_entry, %{})
  end
end
