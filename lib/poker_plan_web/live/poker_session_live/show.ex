defmodule PokerPlanWeb.PokerSessionLive.Show do
  use PokerPlanWeb, :live_view

  alias PokerPlan.Games

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:poker_session, Games.get_poker_session!(id))}
  end

  defp page_title(:show), do: "Show Poker session"
  defp page_title(:edit), do: "Edit Poker session"
end
