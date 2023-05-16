defmodule LiveviewCache.Github do
  @endpoint "https://api.github.com/graphql"
  @n_of_repos 5

  def fetch_top_repos do
    query = """
      query {
        search(query: "stars:>1", type: REPOSITORY, first: #{@n_of_repos}) {
          nodes {
            ... on Repository {
              name
              url
              stargazerCount
            }
          }
        }
      }
    """

    case Req.post(@endpoint,
           json: %{query: query},
           auth: {:bearer, System.get_env("GITHUB_TOKEN")}
         ) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        data =
          body
          |> Map.get("data")
          |> Map.get("search")
          |> Map.get("nodes")

        # Process.sleep(:timer.seconds(2))

        {:ok, data}

      e ->
        {:error, {"Failed to fetch top repos", e}}
    end
  end
end
