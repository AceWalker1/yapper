defmodule Yapper.Repo do
  use Ecto.Repo,
    otp_app: :yapper,
    adapter: Ecto.Adapters.Postgres
end
