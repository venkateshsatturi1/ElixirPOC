defmodule SqlDataTest do
  use ExUnit.Case, async: true
  ExUnit.start()
  import  Db_Utils
  import  ApitestUtils


  test "validate connection" do
    # conn = setup_DB()
    # #sql = query(conn, "SELECT * FROM user")
    # # insert = insert_data(conn,"INSERT INTO user VALUES (9, 'bol', 'raj', 'bol@gmail.com')")
    # #{:ok, %MyXQL.Result{rows: rows}} = MyXQL.query(conn, "SELECT * FROM user")
    # sql = query(conn, "select firstName from users where id=2")
    #   {:ok, sql}
    #   {:ok, data} = Enum.fetch(sql,0)  # fetch data from 1st list
    #   #{:ok, name} = Enum.fetch(data,0)  # Fetch data from Actul list
    #   IO.puts(data)
    #  # IO.puts(name)
    # #get_data(conn)
  end

  test "Test Get" do
    url = "https://reqres.in/api/users/2"
    response = doGet(url)
    IO.puts(response)
    {:ok, data} = Jason.decode(response)
    IO.puts(data["data"]["first_name"])
    conn = setup_DB()
    sql = query(conn, "select firstName from users where id=2")
    {:ok, sql}
    {:ok, sqldata} = Enum.fetch(sql,0)
    IO.puts(sqldata)
    assert data["data"]["first_name"] == hd sqldata
  end
end
