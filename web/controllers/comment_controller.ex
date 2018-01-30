defmodule Dispute.CommentController do
  use Dispute.Web, :controller

  alias Dispute.{Topic, Comment}

  def create(conn, %{"comment" => comment_params, "topic_id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    comment_changeset = Ecto.build_assoc(topic, :comments, body: comment_params["body"])

    case Repo.insert(comment_changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Post comment successful.")
        |> redirect(to: topic_path(conn, :show, topic))
      {:error, comment_changeset} ->
        render(conn, "show.html", comment_changeset: comment_changeset)
    end
  end

  def delete(conn, %{"topic_id" => topic_id, "id" => id}) do
    comment = Repo.get!(Comment, id)
    topic = Repo.get(Topic, topic_id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(comment)

    conn
    |> put_flash(:info, "Comment deleted successfully.")
    |> redirect(to: topic_path(conn, :show, topic))
  end
end
