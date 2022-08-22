defmodule ApiPartner.Schemas.Entity.Actions.Update do
  alias ApiPartner.{Error, Repo}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  def call(%{"id" => id} = params) do
    case Repo.get(Entity, id) do
      nil -> {:error, Error.build_entity_not_found_error()}
      entity -> update(entity, params)
    end
  end

  defp update(entity, params) do
    entity
    |> Entity.changeset(params)
    |> Repo.update!()
  end
end
