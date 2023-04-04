defmodule Db_Utils do
  def setup_DB() do
    {:ok, conn} = MyXQL.start_link(username: "root", password: "@dmin1234#", database: "testmysql", hostname: "localhost", port: 3306)
      {:ok, conn: conn}
      conn
  end

  def query(conn, sql) do
    {:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn, sql)
      {:ok, rows: rows}
      rows
  end

  def get_data(conn) do
    {:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn,  "SELECT * FROM user")
      {:ok, rows: rows}
      IO.puts(rows)
  end

  def insert_data(conn, sql) do
    {:ok, %MyXQL.Result{num_rows: num_rows}} = MyXQL.query(conn, sql)
    IO.puts("Number of rows affcted:#{num_rows}")

  end

end
