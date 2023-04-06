defmodule SqlDataTest do
  use ExUnit.Case, async: true
  ExUnit.start()
  Code.require_file("test_helper.exs", __DIR__)
  import  Db_Utils
  import  ApitestUtils


  test "Get Method with validation against database" do
    url = "https://reqres.in/api/users/2"
    response = doGet(url)
    # IO.puts(response)
    {:ok, data} = Jason.decode(response)
    IO.puts(data["data"]["first_name"])
    conn = setup_DB()
    sql = query(conn, "select first_name from user where id=2")
    {:ok, sql}
    IO.puts(sql)
    {:ok, sqldata} = Enum.fetch(sql,0)  #Here we fetching only first_name from DB. So it will store it in 0th index. fetch from 0th index
    # IO.puts(sqldata)
    assert data["data"]["first_name"] == "Janet"
  end
end
