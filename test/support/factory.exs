defmodule ApiPartner.Factory do
  use ExMachina.Ecto, repo: ApiPartner.Repo

  alias ApiPartner.Schemas.EntitySchema, as: Entity

  def entity_factory do
    %Entity{
      name: "Escola Exemplo",
      entity_type: "school",
      inep: "12345678",
      parent_id: "1"
    }
  end
end
