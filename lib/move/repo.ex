defmodule Move.Repo do
  use Ecto.Repo,
    otp_app: :move,
    adapter: Ecto.Adapters.Postgres
end
