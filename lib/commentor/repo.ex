defmodule Commentor.Repo do
  use Ecto.Repo,
    otp_app: :commentor,
    adapter: Ecto.Adapters.Postgres
end
