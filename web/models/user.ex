defmodule Choreward.User do
  use Choreward.Web, :model
  use Timex.Ecto.Timestamps
  import Doorman.Auth.Bcrypt, only: [hash_password: 1]

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :name, :string
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true

    has_many :tasks, Choreward.Task, on_delete: :delete_all

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :password])
    |> validate_required([:email, :password])
    |> hash_password
    |> unique_constraint(:email)
  end
end
