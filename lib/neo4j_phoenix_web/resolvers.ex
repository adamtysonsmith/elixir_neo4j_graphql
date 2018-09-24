# GraphQL Resolvers
defmodule Neo4jPhoenixWeb.Resolvers do
  alias Bolt.Sips, as: Bolt
  
  def get_people(_parent, _args, _resolution) do
    run_query """
      MATCH (p:Person)
      RETURN p.name AS name, p.born AS born
    """
  end
  
  def get_movies(_parent, _args, _resolution) do
    run_query """
      MATCH (m:Movie)
      RETURN m.title AS title, m.tagline AS tagline, m.released AS released
    """
  end
  
  defp run_query(query) do
    result = Bolt.query!(Bolt.conn, query) |> Enum.map(&convert_map/1)
    {:ok, result}
  end

  # Converts string map to atom map
  defp convert_map(strmap) do
    Map.new(strmap, fn {k, v} -> {String.to_atom(k), v} end)
  end
end