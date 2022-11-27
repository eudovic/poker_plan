defmodule PokerPlan.GamesTest do
  use PokerPlan.DataCase

  alias PokerPlan.Games

  describe "poker_sessions" do
    alias PokerPlan.Games.PokerSession

    import PokerPlan.GamesFixtures

    @invalid_attrs %{guid: nil, name: nil}

    test "list_poker_sessions/0 returns all poker_sessions" do
      poker_session = poker_session_fixture()
      assert Games.list_poker_sessions() == [poker_session]
    end

    test "get_poker_session!/1 returns the poker_session with given id" do
      poker_session = poker_session_fixture()
      assert Games.get_poker_session!(poker_session.id) == poker_session
    end

    test "create_poker_session/1 with valid data creates a poker_session" do
      valid_attrs = %{guid: "some guid", name: "some name"}

      assert {:ok, %PokerSession{} = poker_session} = Games.create_poker_session(valid_attrs)
      assert poker_session.guid == "some guid"
      assert poker_session.name == "some name"
    end

    test "create_poker_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_poker_session(@invalid_attrs)
    end

    test "update_poker_session/2 with valid data updates the poker_session" do
      poker_session = poker_session_fixture()
      update_attrs = %{guid: "some updated guid", name: "some updated name"}

      assert {:ok, %PokerSession{} = poker_session} = Games.update_poker_session(poker_session, update_attrs)
      assert poker_session.guid == "some updated guid"
      assert poker_session.name == "some updated name"
    end

    test "update_poker_session/2 with invalid data returns error changeset" do
      poker_session = poker_session_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_poker_session(poker_session, @invalid_attrs)
      assert poker_session == Games.get_poker_session!(poker_session.id)
    end

    test "delete_poker_session/1 deletes the poker_session" do
      poker_session = poker_session_fixture()
      assert {:ok, %PokerSession{}} = Games.delete_poker_session(poker_session)
      assert_raise Ecto.NoResultsError, fn -> Games.get_poker_session!(poker_session.id) end
    end

    test "change_poker_session/1 returns a poker_session changeset" do
      poker_session = poker_session_fixture()
      assert %Ecto.Changeset{} = Games.change_poker_session(poker_session)
    end
  end
end
