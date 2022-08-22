defmodule ApiPartnerWeb.FallbackController do
  use ApiPartnerWeb, :controller
  alias ApiPartner.Error
  alias ApiPartnerWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
