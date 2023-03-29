# defmodule ApitestingTest do
#   use ExUnit.Case
#   import HTTPoison
#   doctest Apitesting

#   test "Test Get" do
#     url = "https://reqres.in/api/users/2"
#     response = HTTPoison.get(url)
#     case response do
#       {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
#         case Jason.decode(body) do
#           {:ok, data} ->
#             first_name = data["data"]["first_name"]
#             assert status_code ==200
#             assert first_name == "Janet"

#           {:error, reason} ->
#             IO.puts("Error decoding JSON response: #{reason}")
#         end
#       {:ok, %HTTPoison.Response{status_code: status}} ->
#         IO.puts("Unexpected response status code: #{status}")
#       {:error, reason} ->
#         IO.puts("HTTP request failed: #{reason}")
#     end
#   end
# end
