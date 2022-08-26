defmodule ApiPartner.Schemas.Entity.Actions.CreateTest do
  use ApiPartner.DataCase, async: true

  import ApiPartner.Factory

  alias ApiPartner.Schemas.Entity.Actions.Create
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  describe "Create entity" do
    test "when all params are valid, returns the entity" do
      entity_params = build(:entity_json)

      {:ok, %Entity{id: id} = entity} = Create.call(entity_params)

      assert %Entity{
               name: "Escola Exemplo",
               inep: "12345678",
               parent_id: "1",
               id: ^id
             } = entity
    end

    test "when there are invalid params, returns an error" do
      entity_params = %{"name" => "", "parent_id" => ""}

      response = Create.call(entity_params)

      assert {:error, %ApiPartner.Error{}} = response
    end
  end
end
