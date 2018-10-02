defmodule Neo4jPhoenixWeb.Router do
  use Neo4jPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Neo4jPhoenixWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Neo4jPhoenixWeb.Schema, interface: :simple
    forward "/", Absinthe.Plug, schema: Neo4jPhoenixWeb.Schema
  end
end
