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
    response1 = get(url)
    status_code = response1 |> elem(1)
    datas = response1 |> elem(2)
    IO.puts(status_code)
    IO.puts(datas)
    {:ok, data} = Jason.decode(datas)
    IO.puts(data["data"]["first_name"])
    assert status_code == 200
    assert data["data"]["first_name"] == "Janet"
  end

  @tag  content: false
  test "send url with query parms" do
    url = "https://reqres.in/api/users/1"
    params =  %{page: 2}
    response = get(url, params)
    status_code = response |>  elem(1)
    body_content = response |> elem(2)
    IO.puts(status_code)
    IO.puts(body_content)
    {:ok, data} = Jason.decode(body_content)
    IO.puts(data["data"]["first_name"])
    assert status_code == 200
    assert data["data"]["first_name"] == "George"
  end

  @tag content: false
  test "send url,query parameter, headers" do
    url = "https://reqres.in/api/users/3"
    params =  %{page: 2}
    header =  [{"Content-Type", "application/json;charset=utf-8"}]
    response = get_req(url, params, header)
    status_code = response |>  elem(1)
    body_content = response |> elem(2)
    headers = response |> elem(3)
    IO.puts(status_code)
    IO.puts(body_content)
    IO.inspect(headers)
    {:ok, data} = Jason.decode(body_content)
    IO.puts(data["data"]["first_name"])
    assert status_code == 200
    assert data["data"]["first_name"] == "Emma"

  end

  @tag content: false
  test "Simple POST" do
    url = "https://thetestingworldapi.com/api/studentsDetails"
    payload = %{id: "5", first_name: "DeepikaD", middle_name: "D", last_name: "Hegde", date_of_birth: "05-Oct"}
    response = doPost_with_payload(url, payload)
    IO.puts(response)
    end

  @tag content: true
  test "Post with data from file" do
      url = "https://thetestingworldapi.com/api/studentsDetails"
      response = doPost_with_file("https://thetestingworldapi.com/api/studentsDetails", "./data/samplePOST.json")
      IO.puts(response)
    end
end
