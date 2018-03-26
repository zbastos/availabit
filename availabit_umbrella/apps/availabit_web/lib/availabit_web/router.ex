defmodule AvailabitWeb.Router do
  use AvailabitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authorization do
  plug AvailabitWeb.Plugs.Authorization
end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AvailabitWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/events", EventController
  end

  scope "/", AvailabitWeb do
  pipe_through :browser # Use the default browser stack

  get "/", PageController, :index
  # Events routes removed from here
end

scope "/", AvailabitWeb do
  pipe_through [:browser, :authorization]

  resources "/events", EventController # Events routes now here
end
  
  scope "/auth", AvailabitWeb do
  pipe_through :browser

  get "/:provider", AuthController, :request
  get "/:provider/callback", AuthController, :callback
  delete "/logout", AuthController, :logout
end

  # Other scopes may use custom stacks.
  # scope "/api", AvailabitWeb do
  #   pipe_through :api
  # end
end
