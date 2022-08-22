defmodule ApiPartnerWeb.EntityControllerTest do
  use ApiPartnerWeb.ConnCase, async: true

  alias ApiPartner.Schemas.EntitySchema, as: Entity

  describe "create_entity/2" do
    test "when all params are valid, creates a entity", %{conn: conn} do
      params = build(:entity_params)

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      assert %{} = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{}

      expected_response = %{}

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
