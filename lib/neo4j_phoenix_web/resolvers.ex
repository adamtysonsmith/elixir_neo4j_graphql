# GraphQL Resolvers
defmodule Neo4jPhoenixWeb.Resolvers do
  alias Bolt.Sips, as: Bolt
  
  def get_people(_parent, _args, _resolution) do
    run_list_query """
      MATCH (p:Person)
      RETURN p.name AS name, p.born AS born
    """
  end
  
  def get_movies(_parent, _args, _resolution) do
    run_list_query """
      MATCH (m:Movie)
      RETURN m.title AS title, m.tagline AS tagline, m.released AS released
    """
  end
  
  def create_person(_root, args, _info) do
    # create query using BOLT
    IO.inspect args
    run_single_query"""
      CREATE (newPerson:Person{ name: "#{args.name}", born: #{args.born} })
      RETURN newPerson.name as name, newPerson.born as born
    """
  end

  defp run_list_query(query) do
    result = Bolt.query!(Bolt.conn, query) |> Enum.map(&convert_map/1)
    {:ok, result}
  end

  defp run_single_query(query) do
    {status, [result]} = run_list_query(query)
    {:ok, result}
  end

  # Converts string map to atom map
  defp convert_map(strmap) do
    Map.new(strmap, fn {k, v} -> {String.to_atom(k), v} end)
  end
end