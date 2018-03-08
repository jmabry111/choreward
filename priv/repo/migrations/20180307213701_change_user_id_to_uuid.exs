defmodule Choreward.Repo.Migrations.ChangeUserIdToUUID do
  use Ecto.Migration

  def change do 

    alter table(:users) do
      remove :id
      add :id, :binary_id, primary_key: true
    end
  end
end
