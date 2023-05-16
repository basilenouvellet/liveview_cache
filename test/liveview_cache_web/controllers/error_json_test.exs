defmodule LiveviewCacheWeb.ErrorJSONTest do
  use LiveviewCacheWeb.ConnCase, async: true

  test "renders 404" do
    assert LiveviewCacheWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LiveviewCacheWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
