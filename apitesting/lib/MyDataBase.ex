defmodule Apitesting.MyDataBase do
  #def start_link do
  #  {:ok, pid} = :mysql.start_link(hostname: "localhost:3306", username: "root", password: "12radtopK", database: "elixirtest")
  #  pid
  #end

  #def query(pid, sql) do
  #  :mysql.query(pid, sql)
  #end

  def insert_data(pid, id, name) do
    :mysql.query(pid, "INSERT INTO user (id, name) VALUES (?, ?)", [id, name])
  end

  def get_data(pid) do
    :mysql.query(pid, "SELECT * FROM user")
  end
end
