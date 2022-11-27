defmodule PokerPlan.Games.PokerSession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poker_sessions" do
    field :guid, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(poker_session, attrs) do
    poker_session
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
