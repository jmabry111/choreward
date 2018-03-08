defmodule Choreward.Router do
  use Choreward.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Doorman.Login.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Choreward do
    pipe_through [:browser]

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create, :delete]
  end
  
  scope "/", Choreward do
    pipe_through [:browser]
    resources "/users", UserController, only: [:show, :edit, :update] do
      resources "/tasks", TaskController, only: [:new, :create, :index, :delete]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Choreward do
  #   pipe_through :api
  # end
end
