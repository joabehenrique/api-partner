defmodule ApiPartnerWeb.EntityController do
  use ApiPartnerWeb, :controller

  alias ApiPartnerWeb.FallbackController
  alias ApiPartner.Schemas.Entity.Actions.{Create, FindById, Update}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  action_fallback(FallbackController)

  def create_entity(conn, params) do
    with {:ok, %Entity{} = entity} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create_entity.json", entity: entity)
    end
  end

  def find_entity_by_id(conn, %{"id" => id}) do
    with {:ok, %Entity{} = entity, list_subtree} <- FindById.call(id) do
      conn
      |> put_status(:ok)
      |> render("find_entity_by_id.json", entity: entity, subtree_ids: list_subtree)
    end
  end

  def update_entity(conn, params) do
    with {:ok, %Entity{} = entity} <- Update.call(params) do
      conn
      |> put_status(:ok)
      |> render("update_entity.json", entity: entity)
    end
  end
end
