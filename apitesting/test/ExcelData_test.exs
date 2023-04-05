defmodule ExcelDataTest do
    use ExUnit.Case
    ExUnit.start()
    import ApitestUtils
    import  CommonUtils




    test "Get data from excel" do
      # read_excel_file(path, index of id)
      data_list = read_excel_file("./Book1.xlsx", 2)
      {:ok, name} = IO.inspect(Enum.fetch(data_list,1))
      {:ok, id} = IO.inspect(Enum.fetch(data_list,0))
      IO.inspect(data_list)
      IO.puts("The Emp FistName is:#{name}")
      IO.puts("The EMPID is:#{id}")

      url= "https://reqres.in/api/users/#{id}"
      responce = doGet(url)
      {:ok, data} = Jason.decode(responce)
      IO.puts(data["data"]["first_name"])

      assert name == data["data"]["first_name"]
    end









     #def read_test_Data(file_path, sheet_name) do
    #  workbook = open(file_path)
    #  sheet = workbook |> Elixlsx.Workbook.sheet_by_name(sheet_name)
    #  headers = sheet |> Elixlsx.Sheet.extract_headers()
    #  data = sheet |> Elixlsx.Sheet.to_map(headers: headers)
    #  Elixlsx.Workbook.close(workbook)
    #  data
    #end

    #test "Excel data validation" do
    #  workbook = open("D:/Elixir_api_testing/New folder/ElixirPOC/apitesting/Book1.xlsx")
    #  sheet = workbook |> Elixlsx.Workbook.sheet_by_name("Sheet1")
    #  headers = sheet |> Elixlsx.Sheet.extract_headers()
    # data = sheet |> Elixlsx.Sheet.to_map(headers: headers)
    #  Elixlsx.Workbook.close(workbook)
    #  data
     # test_data = read_test_Data("D:/Elixir_api_testing/New folder/ElixirPOC/apitesting/Book1.xlsx","Sheet1")
    #IO.puts([headers1][0])
    # IO.inspect(data)
    #end

    #test "test" do
    #  {:ok, sheet_data} = Xlsxir.extract("./Book.xlsx",0)    # This find sheet
    #  data = Xlsxir.get_list(sheet_data)

    #end
end
