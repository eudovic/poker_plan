defmodule PokerPlan.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias PokerPlan.Repo

  alias PokerPlan.Games.PokerSession

  @doc """
  Returns the list of poker_sessions.

  ## Examples

      iex> list_poker_sessions()
      [%PokerSession{}, ...]

  """
  def list_poker_sessions do
    Repo.all(PokerSession)
  end

  @doc """
  Gets a single poker_session.

  Raises `Ecto.NoResultsError` if the Poker session does not exist.

  ## Examples

      iex> get_poker_session!(123)
      %PokerSession{}

      iex> get_poker_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poker_session!(id), do: Repo.get!(PokerSession, id)

  @doc """
  Creates a poker_session.

  ## Examples

      iex> create_poker_session(%{field: value})
      {:ok, %PokerSession{}}

      iex> create_poker_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poker_session(attrs \\ %{}) do
    %PokerSession{}
    |> PokerSession.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poker_session.

  ## Examples

      iex> update_poker_session(poker_session, %{field: new_value})
      {:ok, %PokerSession{}}

      iex> update_poker_session(poker_session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poker_session(%PokerSession{} = poker_session, attrs) do
    poker_session
    |> PokerSession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a poker_session.

  ## Examples

      iex> delete_poker_session(poker_session)
      {:ok, %PokerSession{}}

      iex> delete_poker_session(poker_session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poker_session(%PokerSession{} = poker_session) do
    Repo.delete(poker_session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poker_session changes.

  ## Examples

      iex> change_poker_session(poker_session)
      %Ecto.Changeset{data: %PokerSession{}}

  """
  def change_poker_session(%PokerSession{} = poker_session, attrs \\ %{}) do
    PokerSession.changeset(poker_session, attrs)
  end
end
