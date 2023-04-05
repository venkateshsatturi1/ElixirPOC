defmodule CommonUtils do
  import Xlsxir

  def read_excel_file(path, index) do
    {:ok, sheet} = Xlsxir.extract(path,0)
      all_list = Xlsxir.get_list(sheet)
      {:ok, list} = Enum.fetch(all_list, index)
      list
  end
end
