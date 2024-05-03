defmodule YapperWeb.YapperLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
      <h1>Welcome to Yapper</h1>
      <div><%= @count %></div>
      <button phx-click = "increment">+</button>
      <button phx-click = "decrement">-</button>
      <div><%= @message %></div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0, message: "")}
  end

  def handle_event("increment", _params, socket) do
    new_count = socket.assigns.count + 1
    update_count(socket, new_count)

  end

  def handle_event("decrement", _params, socket) do
    new_count = socket.assigns.count - 1
    update_count(socket, new_count)
  end

  def update_count(socket, arg) do
    {:noreply, assign(socket, count: arg)}

  end
end
