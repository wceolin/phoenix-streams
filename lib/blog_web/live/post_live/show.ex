defmodule BlogWeb.PostLive.Show do
  use BlogWeb, :live_view

  alias Blog.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    post = Content.get_post!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, post)
     |> stream(:comments, Content.list_post_comments(post))}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"
end
