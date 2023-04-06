defmodule ExcelDataTest do
    use ExUnit.Case
    ExUnit.start()
    import ApitestUtils
    import  CommonUtils

    test "Get data from excel" do
      data_list = read_excel_file("./data/Book1.xlsx", 2)
      {:ok, expected_name} = IO.inspect(Enum.fetch(data_list,1)) # get the value from list fetch 1st index data eg. fisrt_name
      {:ok, id} = IO.inspect(Enum.fetch(data_list,0)) # from list fetch 0th index data eg. ID
      IO.inspect(data_list)
      IO.puts("The Emp FistName is:#{expected_name}")
      IO.puts("The EMPID is:#{id}")

      url= "https://reqres.in/api/users/#{id}"
      response = doGet(url)
      {:ok, data} = Jason.decode(response)   # Convert to json format
      IO.puts(data["data"]["first_name"])

      # Validate first_name
      assert expected_name == data["data"]["first_name"]
    end
end
