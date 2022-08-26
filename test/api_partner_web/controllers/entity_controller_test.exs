defmodule ApiPartnerWeb.EntityControllerTest do
  use ApiPartnerWeb.ConnCase, async: true

  import ApiPartner.Factory

  alias ApiPartner.Schemas.Entity.Actions.{Create, FindById, Update}
  alias ApiPartner.Schemas.EntitySchema, as: Entity

  describe "create_entity/2" do
    test "when all params are valid, creates a entity", %{conn: conn} do
      params = build(:entity)

      response =
        conn
        |> post(Routes.entity_path(conn, :create_entity, params))
        |> json_response(:created)

      %{"entity" => %{"id" => id, "entity_type" => _entity_type}} = response

      assert %{
               "entity" => %{
                 "id" => ^id,
                 "parent_id" => "1",
                 "name" => "Escola Exemplo",
                 "entity_type" => "school",
                 "inep" => "12345678"
               },
               "message" => "Entity created"
             } = response
    end

    test "when there are empty params, returns an error", %{conn: conn} do
      params = build(:entity_empty_error)

      expected_response = %{
        "message" => %{
          "entity_type" => ["can't be blank"],
          "inep" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.entity_path(conn, :create_entity, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end

    test "when there is a school without parents, returns an error", %{conn: conn} do
      params = build(:entity_school_error)

      expected_response = %{
        "message" => "Parent_id is allowed null if it is network or school"
      }

      response =
        conn
        |> post(Routes.entity_path(conn, :create_entity, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "find_entity_by_id/2" do
    test "when id exist, return the entity", %{conn: conn} do
      params = build(:entity_json)

      {:ok, %Entity{id: id} = entity} = Create.call(params)

      response =
        conn
        |> get(Routes.entity_path(conn, :find_entity_by_id, id))
        |> json_response(:ok)

      %{"entity" => %{"id" => id}} = response

      assert %{
               "entity" => %{
                 "entity_type" => "school",
                 "id" => ^id,
                 "inep" => "12345678",
                 "name" => "Escola Exemplo",
                 "parent_id" => "1"
               },
               "message" => "Entity found",
               "subtree_ids" => []
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "1"

      response =
        conn
        |> get(Routes.entity_path(conn, :find_entity_by_id, id))
        |> json_response(:not_found)

      assert %{"message" => "Entity not found"} = response
    end
  end

  describe "update/2" do
    test "when id exist, update the entity", %{conn: conn} do
      params = build(:entity_json)

      {:ok, %Entity{id: id} = entity} = Create.call(params)

      updated_params = %{
        name: "Escola Exemplo 2",
        inep: "87654321"
      }

      response =
        conn
        |> put(Routes.entity_path(conn, :update_entity, id, updated_params))
        |> json_response(:ok)

      %{"entity" => %{"id" => id}} = response

      assert %{
               "entity" => %{
                 "entity_type" => "school",
                 "id" => ^id,
                 "inep" => "87654321",
                 "name" => "Escola Exemplo 2",
                 "parent_id" => "1"
               },
               "message" => "Entity updated"
             } = response
    end
  end
end
