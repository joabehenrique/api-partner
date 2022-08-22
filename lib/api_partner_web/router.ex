defmodule ApiPartnerWeb.Router do
  use ApiPartnerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v2/partners", ApiPartnerWeb do
    pipe_through(:api)

    post("/entities", EntityController, :create_entity)
    get("/entities/:id", EntityController, :find_entity_by_id)
    put("/entities/:id", EntityController, :update_entity)
  end
end
