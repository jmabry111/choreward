defmodule Choreward.TaskController do
  use Choreward.Web, :controller
  alias Choreward.Task
  alias Choreward.User
  alias Choreward.UserQuery
  
  def index(conn, %{"user_id" => user_id}) do
    user = UserQuery.find_user(user_id)
    changeset = Task.changeset(%Task{}, user)

    conn
    |> render_index(user, changeset)
  end

  def create(conn, %{"user_id" => user_id, "task" => task_params}) do
    params = Map.merge(task_params, %{"user_id" => user_id})
    user = UserQuery.find_user(user_id)
    changeset = Task.changeset(%Task{}, params, user)

    case Repo.insert(changeset) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task successfully created")
        |> redirect(to: user_task_path(conn, :index, task))
      {:error, changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> render(:new)
    end
  end

  defp render_index(conn, %User{}=user, changeset) do
    conn
    |> assign(:user, user)
    |> assign(:tasks, user.tasks)
    |> assign(:changeset, changeset)
    |> render(:index)
  end
end
