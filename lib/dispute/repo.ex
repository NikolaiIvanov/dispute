defmodule Dispute.Repo do
  use Ecto.Repo, otp_app: :dispute
  use Scrivener, page_size: 2
end
