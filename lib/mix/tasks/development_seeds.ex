defmodule Mix.Tasks.DevelopmentSeeds do
  use Mix.Task
  import Choreward.Factory
  
  def run(_args) do
    Mix.Task.run "app.start", []
  
  for table_name <- tables_to_truncate() do
    Ecto.Adapters.SQL.query!(Choreward.Repo, "TRUNCATE TABLE #{table_name} CASCADE")
  end

  build(:user, name: "Admin", email: "admin@example.com", password: "password")
  |> save
  |> print_user
  end

  defp print_user(user) do
    IO.puts "User: #{user.email}, #{user.password}"
  end
 
  def tables_to_truncate do
    ~w(
      users
      tasks
    )
  end
end
