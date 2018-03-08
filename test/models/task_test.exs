defmodule Choreward.TaskTest do
  use Choreward.ModelCase

  alias Choreward.Task

  @valid_attrs %{
    user_id: "884e3378-c904-4a38-9951-6cd222492311",
    name: "Task Name",
  }

  test "changeset with valid attributes" do
    user = insert(:user, hashed_password: "fdafhe4789ry4oifejr")
    changeset = Task.changeset(%Task{}, @valid_attrs, user)
    assert changeset.valid?
  end
end
