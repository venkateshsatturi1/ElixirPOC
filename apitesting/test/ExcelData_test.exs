defmodule ExcelDataTest do
    use ExUnit.Case
    ExUnit.start()
    import ApitestUtils
    import  CommonUtils

    test "Get data from excel" do
      data_list = read_excel_file("./data/Book1.xlsx", 2)
      {:ok, expectedname} = IO.inspect(Enum.fetch(data_list,1))
      {:ok, id} = IO.inspect(Enum.fetch(data_list,0))
      IO.inspect(data_list)
      IO.puts("The Emp FistName is:#{expectedname}")
      IO.puts("The EMPID is:#{id}")

      url= "https://reqres.in/api/users/#{id}"
      response = doGet(url)
      {:ok, data} = Jason.decode(response)
      IO.puts(data["data"]["first_name"])

      assert expectedname == data["data"]["first_name"]
    end
end
