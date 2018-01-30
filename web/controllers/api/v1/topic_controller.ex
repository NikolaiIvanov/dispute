defmodule Dispute.Api.V1.TopicController do
  use Dispute.Web, :controller

  alias Dispute.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, "index.json", topics: topics)
  end

  def show(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    topic = Repo.preload(topic, :comments)
    render(conn, "show.json", topic: topic)
  end
end
