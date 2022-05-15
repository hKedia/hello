defmodule HelloWeb.CounterLive do
  @moduledoc """
  The module is responsive for /counter
  """
  use Phoenix.LiveView, layout: {HelloWeb.LayoutView, "live.html"}

  @doc """
  mount gets called whenever the module loads
  """
  def mount(_params, _session, socket) do
    socket = assign(socket, count: 0)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>A Simple Counter</h1>
    <h2>
      <%= @count %>
    </h2>
    <button phx-click="increment">+</button>
    <button>-</button>
    """
  end

  def handle_event("increment", _, socket) do
    old_count = socket.assigns.count
    new_count = old_count + 1
    socket = assign(socket, count: new_count)

    {:noreply, socket}
  end
end
