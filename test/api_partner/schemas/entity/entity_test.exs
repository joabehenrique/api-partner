defmodule ApiPartner.Schemas.Entity.EntityTest do
  use ApiPartner.DataCase

  import ApiPartner.Factory

  alias Ecto.Changeset
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:entity)

      response = Entity.changeset(params)

      assert %Changeset{
               changes: %{
                 entity_type: "school",
                 inep: "12345678",
                 name: "Escola Exemplo",
                 parent_id: "1"
               },
               valid?: true
             } = response
    end
  end
end
