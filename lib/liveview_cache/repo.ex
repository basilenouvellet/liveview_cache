defmodule LiveviewCache.Repo do
  use Ecto.Repo,
    otp_app: :liveview_cache,
    adapter: Ecto.Adapters.Postgres
end
