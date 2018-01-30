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
    resources "/topics", TopicController
  end

  # Other scopes may use custom stacks.
  scope "/api", Dispute do
    pipe_through :api

    resources "/topics", TopicController
  end
end
