defmodule EmployeeTest do
  use ExUnit
  import ApitestUtils
  import HTTPoison

  url = "https://reqres.in/api/users/2"

  test "Simple Get" do
    response = doGet(url)
    IO.puts(response)
    {:ok, data} = Jason.decode(response)
    assert data["data"]["first_name"] == "Janet"
  end
end
