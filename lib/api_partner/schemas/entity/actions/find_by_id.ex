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
    list_subtree =
      get_list_subtree(id)
      |> Enum.map(fn {value} -> value end)

    {:ok, entity, list_subtree}
  end

  defp get_list_subtree(id) do
    entity_tree_initial_query = from(parents in Entity, where: parents.id == ^id)

    Entity
    |> where([c], c.id == ^id)

    entity_tree_recursion_query =
      Entity
      |> join(:inner, [c], ct in "entity_tree", on: c.parent_id == ct.id)

    entity_tree_query =
      entity_tree_initial_query
      |> union_all(^entity_tree_recursion_query)

    Entity
    |> recursive_ctes(true)
    |> with_cte("entity_tree", as: ^entity_tree_query)
    |> join(:inner, [p], c in "entity_tree", on: c.id == p.parent_id)
    |> select([p], {p.id})
    |> Repo.all()
  end
end
