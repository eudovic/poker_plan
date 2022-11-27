defmodule PokerPlan.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokerPlan.Games` context.
  """

  @doc """
  Generate a poker_session.
  """
  def poker_session_fixture(attrs \\ %{}) do
    {:ok, poker_session} =
      attrs
      |> Enum.into(%{
        guid: "some guid",
        name: "some name"
      })
      |> PokerPlan.Games.create_poker_session()

    poker_session
  end
end
