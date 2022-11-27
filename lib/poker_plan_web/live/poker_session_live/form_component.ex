defmodule PokerPlanWeb.PokerSessionLive.FormComponent do
  use PokerPlanWeb, :live_component

  alias PokerPlan.Games

  @impl true
  def update(%{poker_session: poker_session} = assigns, socket) do
    changeset = Games.change_poker_session(poker_session)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"poker_session" => poker_session_params}, socket) do
    changeset =
      socket.assigns.poker_session
      |> Games.change_poker_session(poker_session_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"poker_session" => poker_session_params}, socket) do
    save_poker_session(socket, socket.assigns.action, poker_session_params)
  end

  defp save_poker_session(socket, :edit, poker_session_params) do
    case Games.update_poker_session(socket.assigns.poker_session, poker_session_params) do
      {:ok, _poker_session} ->
        {:noreply,
         socket
         |> put_flash(:info, "Poker session updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_poker_session(socket, :new, poker_session_params) do
    case Games.create_poker_session(poker_session_params) do
      {:ok, _poker_session} ->
        {:noreply,
         socket
         |> put_flash(:info, "Poker session created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
