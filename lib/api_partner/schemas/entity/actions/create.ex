defmodule ApiPartner.Schemas.Entity.Actions.Create do
  alias ApiPartner.{Error, Repo}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  def call(%{"parent_id" => parent_id} = params) do
    if Blankable.blank?(parent_id) or is_nil(parent_id) do
      validate_hierarchy(params)
    else
      create(params)
    end
  end

  defp create(params) do
    params
    |> Entity.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp validate_hierarchy(%{"entity_type" => "class"} = _params),
    do:
      {:error, Error.build(:bad_request, "Parent_id is allowed null if it is network or school")}

  defp validate_hierarchy(params), do: create(params)

  defp handle_insert({:ok, %Entity{}} = result), do: result

  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
