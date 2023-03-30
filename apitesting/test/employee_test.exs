defmodule EmployeeTest do
  use ExUnit.Case, async: true
  import  ApitestUtils
  #import HTTPoison

  _url = "https://reqres.in/api/users/2"
  @tag content: false
  test "Simple Get" do
    url = "https://reqres.in/api/users/2"
    response = doGet(url)
    IO.puts(response)
    {:ok, data} = Jason.decode(response)
    assert data["data"]["first_name"] == "Janet"
  end

  @tag content: false
  test "get body and status code" do
    url = "https://reqres.in/api/users/2"
    responce1 = get(url)
    IO.puts(responce1 |> elem(1))
    IO.puts(responce1 |> elem(2))
    #{:ok, data} = Jason.decode(responce1)
  end

  @tag  content: true
  test "send url with query parms" do
    url = "https://reqres.in/api/users"
    params =  %{page: 2}
    res1 = get(url, params)
    IO.puts(res1 |>  elem(1))
    IO.puts(res1 |>  elem(2))
  end

  @tag content: true
  test "send url,query parameter, headers" do
    url = "https://reqres.in/api/users"
    params =  %{page: 2}
    header =  [{"Content-Type", "application/json;charset=utf-8"}]
    res1 = get_req(url, params, header)
    IO.puts(res1 |>  elem(1))
    IO.puts(res1 |>  elem(2))
  end

end
