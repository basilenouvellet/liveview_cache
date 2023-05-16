defmodule LiveviewCacheWeb.HomeLive do
  use LiveviewCacheWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col space-y-16">
      <div class="mx-auto flex flex-col items-center gap-2">
        <h1 class="font-semibold">Top Github Repos</h1>
        <p class="text-dark-400 text-xs">refreshed at <%= @refreshed_at %></p>
      </div>

      <div id="repos_container" class="flex flex-col items-stretch">
        <div :for={repo <- @repos} class="flex justify-between items-baseline gap-4">
          <a
            target="_blank"
            href={repo["url"]}
            class="flex-1 hover:bg-primary-400/10 py-4 px-4 rounded transition-colors"
          >
            <%= repo["name"] %>
          </a>

          <p class="flex items-center space-x-1.5 font-semibold tabular-nums">
            <span class="select-all"><%= repo["stargazerCount"] %></span>
            <.icon name="hero-star-solid" class="h-4 w-4" />
          </p>
        </div>
      </div>
    </div>
    """
  end

  ### Server

  @impl true
  def mount(_params, _session, socket) do
    {:ok, repos} = LiveviewCache.Github.fetch_top_repos()

    socket =
      assign(socket,
        refreshed_at: DateTime.utc_now() |> DateTime.truncate(:second) |> DateTime.to_string(),
        repos: repos |> Enum.sort_by(& &1["stargazerCount"], :desc),
        page_title: "LiveView Cache"
      )

    {:ok, socket}
  end
end
