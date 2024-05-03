defmodule YapperWeb.YapperBlogLive do
  use Phoenix.LiveView
  alias Yapper.Repo
  alias Yapper.Post

  def render(assigns) do

  end

  def handle_event("create", %{"title" => title, "content" => content}) do
    case Repo.insert(%Post{title: title, content: content})do
      {:ok, _post} ->
        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

end
