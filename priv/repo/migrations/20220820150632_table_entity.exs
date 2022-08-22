defmodule ApiPartner.Repo.Migrations.TableEntity do
  use Ecto.Migration

  def change do
    create table(:entity) do
      add(:name, :string)
      add(:entity_type, :string)
      add(:inep, :string)
      add(:parent_id, :string)

      timestamps()
    end
  end
end
