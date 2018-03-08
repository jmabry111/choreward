defmodule Choreward.UserQuery do
  alias Choreward.Repo
  alias Choreward.User

  def find_user(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload(:tasks)
  end
end
