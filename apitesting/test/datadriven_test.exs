# defmodule DataDrivenTest do
#   use ExUnit.Case
#   import HTTPoison

#   def data do
#     [
#       %{
#         url: "https://reqres.in/api/users/2",
#         expected_status: 200,
#         expected_firstname: "Janet"
#       },
#       %{
#         url: "https://reqres.in/api/users/3",
#         expected_status: 200,
#         expected_firstname: "Emma"
#       }
#     ]
#   end

#   defp run_test(data) do
#     for %{url: url, expected_status: expected_status, expected_firstname: expected_firstname} <- data do
#       response = HTTPoison.get(url)
#       case response do
#         {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
#           case Jason.decode(body) do
#             {:ok, data} ->
#               first_name = data["data"]["first_name"]
#               assert status_code == expected_status
#               assert first_name == expected_firstname

#             {:error, reason} ->
#               IO.puts("Error decoding JSON response: #{reason}")
#           end
#       end
#     end
#   end

#   @tag :with_data
#   test "API test" do
#     run_test(data())
#   end
# end
