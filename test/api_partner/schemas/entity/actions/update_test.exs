defmodule ApiPartner.Schemas.Entity.Actions.UpdateTest do
  use ApiPartner.DataCase, async: true

  import ApiPartner.Factory

  alias ApiPartner.Schemas.Entity.Actions.{Create, Update}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  describe "Update entity" do
    test "when a valid id is given, returns the entity" do
      entity_params = build(:entity_json)

      {:ok, %Entity{id: id} = entity} = Create.call(entity_params)

      response = Update.call(%{"id" => id, "name" => "Escola Exemplo 90"})

      assert {:ok,
              %Entity{
                name: "Escola Exemplo 90",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = 1
      response = Update.call(%{"id" => id})

      assert {:error, %ApiPartner.Error{result: "Entity not found", status: :not_found}} =
               response
    end
  end
end
