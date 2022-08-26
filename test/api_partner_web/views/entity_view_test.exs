defmodule ApiPartnerWeb.EntityViewTest do
  use ApiPartnerWeb.ConnCase, async: true

  import Phoenix.View
  import ApiPartner.Factory

  alias ApiPartner.Schemas.Entity.Actions.Create
  alias ApiPartner.Schemas.EntitySchema, as: Entity
  alias ApiPartnerWeb.EntityView

  test "render create_entity.json" do
    entity_params = build(:entity_json)

    {:ok, %Entity{id: id} = entity} = Create.call(entity_params)

    response = render(EntityView, "create_entity.json", entity: entity)

    assert %{
             entity: %Entity{
               name: "Escola Exemplo",
               id: ^id
             },
             message: "Entity created"
           } = response
  end
end
