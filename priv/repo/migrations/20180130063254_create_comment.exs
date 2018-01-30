defmodule Dispute.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      add :topic_id, references(:topics, on_delete: :delete_all)

      timestamps()
    end
    create index(:comments, [:topic_id])

  end
end
