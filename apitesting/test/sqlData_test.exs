defmodule SqlDataTest do
  use ExUnit.Case, async: true
  ExUnit.start()
  import  Db_Utils
  import ApitestUtils


  test "validate connection" do
    conn = setup_DB()
    #sql = query(conn, "SELECT * FROM user")
    # insert = insert_data(conn,"INSERT INTO user VALUES (9, 'bol', 'raj', 'bol@gmail.com')")
    #{:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn, "SELECT * FROM user")
    sql = query(conn, "SELECT first_name FROM user WHERE id=2")
      {:ok, sql}
      {:ok, data} = Enum.fetch(sql,0)  # fetch data from 1st list
      #{:ok, name} = Enum.fetch(data,0)  # Fetch data from Actul list
      IO.puts(data)
     # IO.puts(name)
    #get_data(conn)


  end




























 # test "it retrieves data from the users table"  do
  #  {:ok, conn} = MyXQL.start_link(username: "root", password: "12radtopK", database: "elixirtest", hostname: "localhost", port: 3306)
  #  {:ok, conn: conn}
  #  {:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn, "SELECT fist_name FROM user WHERE id=1")
  #    {:ok, rows}
  #    {:ok, data} = Enum.fetch(rows,0)  # fetch data from 1st list
  #    {:ok, name} = Enum.fetch(data,1)  # Fetch data from Actul list
  #    IO.puts(data)
  #    IO.puts(name)
    #Enum.each(result, &IO.inspect/1)
    #IO.puts(result |> elem(1) )
    #data = result
    #  |> Map.get(:rows,[])
    #  |> Enum.find_value(fn %{id: 3} -> Map.get(result, :data, nil) end)
  #end




#  doctest Apitesting.MyDataBase

#  setup do
#    {:ok, pid} = Apitesting.MyDataBase.start_link
#    :ok = Apitesting.MyDataBase.query(pid, "CREATE TABLE IF NOT EXISTS mytable (id INT, name VARCHAR(255))")
#    {:ok, pid: pid}
#  end
#
#  test "can insert and retrieve data" do
#    {:ok, _} = Apitesting.MyDataBase.insert_data(@pid, 4, "John Doe")
#    {:ok, _} = Apitesting.MyDataBase.insert_data(@pid, 5, "Jane Smith")
#    {:ok, result} = Apitesting.MyDataBase.get_data(@pid)
#    result
#  end
end
