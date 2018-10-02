# GraphQL Schema
defmodule Neo4jPhoenixWeb.Schema do
  use Absinthe.Schema
  import_types Neo4jPhoenixWeb.Schema.DataTypes
  alias Neo4jPhoenixWeb.Resolvers

  # Queries
  query do
    @desc "Get all people"
    field :people, list_of(:person) do
      resolve &Resolvers.get_people/3
    end

    @desc "Get all movies"
    field :movies, list_of(:movie) do
      resolve &Resolvers.get_movies/3
    end
  end

  #Mutations
  mutation do
    field :create_person, :person do
      arg :name, non_null(:string)
      arg :born, non_null(:integer)
  
      resolve &Resolvers.create_person/3
    end
  end

end