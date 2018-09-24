defmodule Neo4jPhoenixWeb.PageController do
  use Neo4jPhoenixWeb, :controller
  alias Bolt.Sips, as: Bolt

  def index(conn, _params) do
    query = """
      MATCH (p:Person)
      RETURN p.name AS name
      LIMIT 1
    """

    [result] = Bolt.query!(Bolt.conn, query)
      |> Enum.map(&(&1["name"]))

    render conn, "index.html", %{result: result}
  end
end
