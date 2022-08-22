defmodule ApiPartner.Schemas.Entity.Actions.Create do
  alias ApiPartner.{Error, Repo}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  def call(%{"parent_id" => parent_id} = params) do
    case is_nil(parent_id) do
      true -> validate_hierarchy(params)
      _other_cases -> create(params)
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
      {:error,
       Error.build(:bad_request, "Entity type is allowed null if it is network or school")}

  defp validate_hierarchy(%{"entity_type" => _entity_type} = params), do: create(params)

  defp handle_insert({:ok, %Entity{}} = result), do: result

  defp handle_insert({:error, result}) do
    IO.inspect(result, label: "\n\nAQUIIIs\n\n")
    {:error, Error.build(:bad_request, result)}
  end
end
