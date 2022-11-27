defmodule PokerPlanWeb.PokerSessionLiveTest do
  use PokerPlanWeb.ConnCase

  import Phoenix.LiveViewTest
  import PokerPlan.GamesFixtures

  @create_attrs %{guid: "some guid", name: "some name"}
  @update_attrs %{guid: "some updated guid", name: "some updated name"}
  @invalid_attrs %{guid: nil, name: nil}

  defp create_poker_session(_) do
    poker_session = poker_session_fixture()
    %{poker_session: poker_session}
  end

  describe "Index" do
    setup [:create_poker_session]

    test "lists all poker_sessions", %{conn: conn, poker_session: poker_session} do
      {:ok, _index_live, html} = live(conn, Routes.poker_session_index_path(conn, :index))

      assert html =~ "Listing Poker sessions"
      assert html =~ poker_session.guid
    end

    test "saves new poker_session", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.poker_session_index_path(conn, :index))

      assert index_live |> element("a", "New Poker session") |> render_click() =~
               "New Poker session"

      assert_patch(index_live, Routes.poker_session_index_path(conn, :new))

      assert index_live
             |> form("#poker_session-form", poker_session: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#poker_session-form", poker_session: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.poker_session_index_path(conn, :index))

      assert html =~ "Poker session created successfully"
      assert html =~ "some guid"
    end

    test "updates poker_session in listing", %{conn: conn, poker_session: poker_session} do
      {:ok, index_live, _html} = live(conn, Routes.poker_session_index_path(conn, :index))

      assert index_live |> element("#poker_session-#{poker_session.id} a", "Edit") |> render_click() =~
               "Edit Poker session"

      assert_patch(index_live, Routes.poker_session_index_path(conn, :edit, poker_session))

      assert index_live
             |> form("#poker_session-form", poker_session: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#poker_session-form", poker_session: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.poker_session_index_path(conn, :index))

      assert html =~ "Poker session updated successfully"
      assert html =~ "some updated guid"
    end

    test "deletes poker_session in listing", %{conn: conn, poker_session: poker_session} do
      {:ok, index_live, _html} = live(conn, Routes.poker_session_index_path(conn, :index))

      assert index_live |> element("#poker_session-#{poker_session.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#poker_session-#{poker_session.id}")
    end
  end

  describe "Show" do
    setup [:create_poker_session]

    test "displays poker_session", %{conn: conn, poker_session: poker_session} do
      {:ok, _show_live, html} = live(conn, Routes.poker_session_show_path(conn, :show, poker_session))

      assert html =~ "Show Poker session"
      assert html =~ poker_session.guid
    end

    test "updates poker_session within modal", %{conn: conn, poker_session: poker_session} do
      {:ok, show_live, _html} = live(conn, Routes.poker_session_show_path(conn, :show, poker_session))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Poker session"

      assert_patch(show_live, Routes.poker_session_show_path(conn, :edit, poker_session))

      assert show_live
             |> form("#poker_session-form", poker_session: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#poker_session-form", poker_session: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.poker_session_show_path(conn, :show, poker_session))

      assert html =~ "Poker session updated successfully"
      assert html =~ "some updated guid"
    end
  end
end
