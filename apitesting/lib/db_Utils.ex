defmodule Db_Utils do

  # This function makes the connection with the database
  # To establish connection we need to set all paramenter manually
  # Parameters:
  #           - username, password of DB, database, Hostname, Port number
  # Returns:
  #         PID(conn)
  def setup_DB() do
    {:ok, conn} = MyXQL.start_link(username: "root", password: "12radtopK", database: "elixirtest", hostname: "localhost", port: 3306)
      {:ok, conn: conn}
      conn
  end


  # This function takes the PID(conn) and SQL query as an argument
  # Parameters:
  #           - PID(conn)
  #           - SQL query to fetch data
  # Return:
  #         -  data from database in String
  def query(conn, sql) do
    {:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn, sql)
      {:ok, rows: rows}
      rows
  end

  # This function takes PID(conn) as an argument
  # Parameters:
  #            - PID(conn)
  # Return:
  #         - print all data from database
  def get_data(conn) do
    {:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn,  "SELECT * FROM user")
      {:ok, rows: rows}
      IO.puts(rows)
  end


 # This function takes PID(conn) and SQL query as an arguments
 # Parameters:
 #            - PID(conn)
 #            - Insert sql query in database
 # Return:
 #        - Number of rows affacted
  def insert_data(conn, sql) do
    {:ok, %MyXQL.Result{num_rows: num_rows}} = MyXQL.query(conn, sql)
    IO.puts("Number of rows affcted:#{num_rows}")

  end

end
