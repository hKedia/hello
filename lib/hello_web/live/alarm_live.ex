defmodule HelloWeb.AlarmLive do

  use Phoenix.LiveView, layout: {HelloWeb.LayoutView, "live.html"}


  def mount(_params, _session, socket) do
    socket = assign(socket, count: 0)


    {:ok, socket}
  end


  def render(assigns) do
    ~H"""
    <h1>Counter</h1>
    <h2>
      <%= @count %>
    </h2>
    <button phx-click="increment">Increment</button>
    <button phx-click="decrement">Decrement</button>
    <button phx-click="restart">Restart</button>

    """
  end

  def handle_event("increment", _, socket) do
    old_count = socket.assigns.count

    new_count = old_count + 1

    socket = assign(socket, count: new_count)


    {:noreply, socket}
  end

  def handle_event("decrement", _, socket) do
    old_count = socket.assigns.count
    new_count = old_count - 1
    socket = assign(socket, count: new_count)

    {:noreply, socket}
  end

  def handle_event("restart", _, socket) do


    new_count = 0

    socket = assign(socket, count: new_count)


    {:noreply, socket}
  end
end
