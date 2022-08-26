defmodule ApiPartner.Factory do
  use ExMachina.Ecto, repo: ApiPartner.Repo

  alias ApiPartner.Schemas.EntitySchema, as: Entity

  def entity_factory do
    %{
      name: "Escola Exemplo",
      entity_type: "school",
      inep: "12345678",
      parent_id: "1"
    }
  end

  def entity_json_factory do
    %{
      "name" => "Escola Exemplo",
      "entity_type" => "school",
      "inep" => "12345678",
      "parent_id" => "1"
    }
  end

  def entity_empty_error_factory do
    %{
      name: "Escola Exemplo",
      parent_id: "1"
    }
  end

  def entity_school_error_factory do
    %{
      name: "Escola Exemplo",
      entity_type: "class",
      inep: "12345678",
      parent_id: nil
    }
  end
end
