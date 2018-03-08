defmodule Choreward.Factory do
  use ExMachina.Ecto, repo: Choreward.Repo

  def user_factory do
    %Choreward.User{
      name: sequence(:name, &"Luke Skywalker the #{&1}"),
      email: sequence(:email, &"user#{&1}@example.com"),
      password: "password",
    }
  end

  def task_factory do
    %Choreward.Task{
      name: "Sweep the floor",
      user: build(:user),
    }
  end

  def save(struct) do
    module_name = struct.__struct__
    params = Map.from_struct(struct)

    module_name
    |> struct(%{})
    |> module_name.changeset(params)
    |> Choreward.Repo.insert!
  end
end
