defmodule PokerPlanWeb.AboutItController do
  use PokerPlanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end