defmodule EmployeeTest do
  use ExUnit.Case, async: true
  import  ApitestUtils
  #import HTTPoison

  _url = "https://reqres.in/api/users/2"

  test "Simple Get" do
    url = "https://reqres.in/api/users/2"
    response = doGet(url)
    IO.puts(response)
    {:ok, data} = Jason.decode(response)
    assert data["data"]["first_name"] == "Janet"
  end
end
