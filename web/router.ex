defmodule Dispute.Router do
  use Dispute.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Dispute do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/topics", TopicController do
      resources "/comments", CommentController
    end
  end

  # Other scopes may use custom stacks.
  scope "/api", Dispute, as: :api do
    pipe_through :api

    scope "/v1", Api.V1, as: :v1 do
      resources "/topics", TopicController, only: [:index, :show]
    end
  end
end
