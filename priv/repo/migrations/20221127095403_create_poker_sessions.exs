defmodule PokerPlan.Repo.Migrations.CreatePokerSessions do
  use Ecto.Migration

  def change do
    create table(:poker_sessions) do
      add :guid, :string
      add :name, :string

      timestamps()
    end
  end
end
