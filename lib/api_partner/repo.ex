defmodule ApiPartner.Repo do
  use Ecto.Repo,
    otp_app: :api_partner,
    adapter: Ecto.Adapters.MyXQL
end
