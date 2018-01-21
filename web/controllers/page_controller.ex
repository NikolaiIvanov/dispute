defmodule Dispute.PageController do
  use Dispute.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
