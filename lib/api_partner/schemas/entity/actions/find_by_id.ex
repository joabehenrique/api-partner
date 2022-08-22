defmodule ApiPartner.Schemas.Entity.Actions.FindById do
  alias ApiPartner.{Error, Repo}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  import Ecto.Query

  def call(id) do
    case Repo.get(Entity, id) do
      nil -> {:error, Error.build_entity_not_found_error()}
      entity -> get_subtree(entity, id)
    end
  end

  defp get_subtree(entity, id) do
    query = from(parents in Entity, where: parents.parent_id == ^id, select: parents.id)

    list_subtree = Repo.all(query)

    {:ok, entity, list_subtree}
  end
end
