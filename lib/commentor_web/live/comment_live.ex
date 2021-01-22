defmodule CommentorWeb.CommentLive do

  use Phoenix.LiveView
  alias CommentorWeb.CommentView
  alias Commentor.Comment

  @token_in_env System.get_env("token")

  def render(assigns) do
    CommentView.render("comment.html", assigns)
  end

  def mount(
    %{
      "article_id"=>art_id,
      "token" => token
    },
     _session, socket) do

    IO.puts @token_in_env
    if token == @token_in_env do

    comments =
      Comment.get_by_article_id(art_id)

    changeset =
      Comment.changeset(%Comment{})
    {
      :ok,
    socket
    |> assign(comments: comments)
    |> assign(changeset: changeset)
    |> assign(article_id: art_id)
    }
    else
      # token 不对 直接跳走
      {
        :ok, redirect(socket, external: "https://www.baidu.com")
      }
    end
  end



  def handle_event(
    "submit",
  %{"comment" => comment},
  %{assigns:
    %{article_id: article_id}
  } = socket) do
    {:ok, _comment} =
      comment
      |> Map.put("article_id", article_id)
      |> Comment.create()

    # get all agian
    comments =
      Comment.get_by_article_id(article_id)
    {
      :noreply,
      socket
      |> assign(comments: comments)
    }
  end

end
