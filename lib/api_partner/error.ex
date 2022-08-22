defmodule ApiPartner.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_entity_not_found_error, do: build(:not_found, "Entity not found")
end
