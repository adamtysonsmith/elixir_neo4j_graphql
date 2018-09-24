# GraphQL Types
defmodule Neo4jPhoenixWeb.Schema.DataTypes do
  use Absinthe.Schema.Notation
  
  object :person do
    field :name, :string
    field :born, :integer
  end
  
  object :movie do
    field :title, :string
    field :tagline, :string
    field :released, :integer
  end
end