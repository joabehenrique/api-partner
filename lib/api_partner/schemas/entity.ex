defmodule ApiPartner.Schemas.Entity do
  use Ecto.Schema

  import Ecto.Changeset

  @entity_names ["network", "school", "class"]
  @required_params [:name, :entity_type, :inep]

  schema "entity" do
    field(:name, :string)
    field(:entity_type, :string)
    field(:inep, :string)
    field(:parent_id, :string)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:inep, is: 8)
    |> validate_inclusion(:entity_type, @entity_names)
  end
end
