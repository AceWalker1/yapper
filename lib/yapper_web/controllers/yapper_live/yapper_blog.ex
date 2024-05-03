defmodule YapperWeb.YapperBlogLive do
  use Phoenix.LiveView
  alias Yapper.Repo
  alias Yapper.Post

  def render(assigns) do
    posts = Repo.all(Post)

    ~H"""
      <div>
        <%= for post <- posts do %>
          <div>
            <h1><%= post.title %></h1>
            <p><%= post.content %></p>
          </div>
          <br>
        <% end %>
      </div>
    """
  end

  def handle_event("create", %{"title" => title, "content" => content}, socket) do
    case Repo.insert(%Post{title: title, content: content})do
      {:ok, _post} ->
        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

end
