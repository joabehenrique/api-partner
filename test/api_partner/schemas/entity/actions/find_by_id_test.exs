defmodule ApiPartner.Schemas.Entity.Actions.FindByIdTest do
  use ApiPartner.DataCase, async: true

  import ApiPartner.Factory

  alias ApiPartner.Schemas.Entity.Actions.{Create, FindById}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  describe "Get Entity" do
    test "when a valid id is given, returns the entity" do
      entity_params = build(:entity_json)

      {:ok, %Entity{id: id} = entity} = Create.call(entity_params)

      response = FindById.call(id)

      assert {:ok,
              %Entity{
                name: "Escola Exemplo",
                id: ^id
              }, []} = response
    end

    test "when an invalid id is given, returns an error" do
      id = 1
      response = FindById.call(id)

      assert {:error, %ApiPartner.Error{result: "Entity not found", status: :not_found}} =
               response
    end
  end
end
