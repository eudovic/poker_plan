defmodule PokerPlanWeb.PokerSessionLive.Index do
  use PokerPlanWeb, :live_view

  alias PokerPlan.Games
  alias PokerPlan.Games.PokerSession

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :poker_sessions, list_poker_sessions())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Poker session")
    |> assign(:poker_session, Games.get_poker_session!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Poker session")
    |> assign(:poker_session, %PokerSession{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Poker sessions")
    |> assign(:poker_session, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    poker_session = Games.get_poker_session!(id)
    {:ok, _} = Games.delete_poker_session(poker_session)

    {:noreply, assign(socket, :poker_sessions, list_poker_sessions())}
  end

  defp list_poker_sessions do
    Games.list_poker_sessions()
  end
end
