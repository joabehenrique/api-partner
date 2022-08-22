defmodule ApiPartnerWeb.EntityView do
  use ApiPartnerWeb, :view

  alias ApiPartner.Schemas.EntitySchema, as: Entity

  def render("create_entity.json", %{entity: %Entity{} = entity}) do
    %{
      message: "Entity created",
      entity: entity
    }
  end

  def render("find_entity_by_id.json", %{entity: %Entity{} = entity, subtree_ids: list_subtree}) do
    %{
      message: "Entity found",
      entity: entity,
      subtree_ids: list_subtree
    }
  end

  def render("update_entity.json", %{entity: %Entity{} = entity}) do
    %{
      message: "Entity updated",
      entity: entity
    }
  end
end
