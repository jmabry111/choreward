defmodule Choreward.Task do
  use Choreward.Web, :model

  schema "tasks" do
    field :name, :string
    belongs_to :user, Choreward.User, type: :binary_id

    timestamps()
  end

  defp required_fields do
    ~w(
      name
      user_id
    )
  end

  def changeset(struct, params \\ %{}, user) do
    struct
    |> cast(params, required_fields())
    |> validate_required([:name, :user_id])
  end
end
