defmodule Dispute.Api.V1.TopicView do
  use Dispute.Web, :view

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, Dispute.Api.V1.TopicView, "topics.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic,  Dispute.Api.V1.TopicView, "topic.json")}
  end

  def render("topics.json", %{topic: topic}) do
    %{id: topic.id,
      title: topic.title,
      description: topic.description
    }
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id,
      title: topic.title,
      description: topic.description,
      comments: render_many(topic.comments, __MODULE__, "comment.json", as: :comment)
    }
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      body: comment.body
    }
  end
end
