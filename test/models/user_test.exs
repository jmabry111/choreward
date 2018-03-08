defmodule Choreward.UserTest do
  use Choreward.ModelCase

  alias Choreward.User

  @valid_attrs %{name: "My Name", email: "myname@example.com", password: "somepass"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
