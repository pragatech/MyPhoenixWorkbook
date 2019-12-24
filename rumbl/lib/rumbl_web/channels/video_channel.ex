defmodule RumblWeb.VideoChannel do
  use RumblWeb, :channel

  def join("videos:" <> _video_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_annotation", params, socket) do
    broadcast!(socket, "new_annotation", %{
      user: %{username: "anan"},
      body: params["body"],
      at: params["at"]
    })

    {:reply, :ok, socket}
  end
end
