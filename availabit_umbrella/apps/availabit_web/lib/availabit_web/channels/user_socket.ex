defmodule AvailabitWeb.UserSocket do
  use Phoenix.Socket

  channel "event:*", AvailabitWeb.EventChannel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(%{"token" => token}, socket) do
    # max_age: 1209600 is equivalent to two weeks in seconds
    case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
     {:ok, user_id} ->
       user = Availabit.Accounts.get_user!(user_id)
       {:ok, assign(socket, :user, user)}
     {:error, _reason} ->
       :error
    end
  end

  def id(_socket), do: nil
end
