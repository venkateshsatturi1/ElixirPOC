defmodule   ApitestUtils do
  import HTTPoison
  require HTTPoison


  def doGet(url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
    body
  end


  @spec get(String.t()) :: {:ok, integer, String.t()}
  def get(url) do
    {:ok, %HTTPoison.Response{status_code: status_code, body: body}} = HTTPoison.get(url)
      {:ok, status_code, body}
  end



  @spec get(String.t()) :: {:ok, integer, String.t()}
  def get(url, params \\ {} ) do
    {:ok, %HTTPoison.Response{status_code: status_code, body: body}} = HTTPoison.get(url, params)
      {:ok, status_code, body}
  end



 # @spec get(String.t()) :: {:ok, integer, String.t(),String.t()}
  def get_req(url, headers \\ [] , params \\ {}) do
    {:ok, %HTTPoison.Response{status_code: status_code, body: body, headers: headers}} = HTTPoison.get(url, headers, params)
      {:ok, status_code, body, headers}
  end

  def doPost_with_payload(url, payload) do
    headers = [{"Content-Type", "application/json"}]
    response =
      HTTPoison.post(
        url,
        Poison.encode!(payload),
        headers,
        [:body_format, :json]
      )
    case response do
      {:ok, %{status_code: 201, body: body}} ->
        IO.puts("POST request successful!")
        body
    end
  end

  def doPost_with_file(url, file_path) do
    {:ok, file} = File.read(file_path)
    headers = %{"Content-Type" => "application/json"}
    response = HTTPoison.post(url, file, headers)
    case response do
      {:ok, %{status_code: 201, body: body}} ->
        IO.puts("POST request successful!")
        body
      end
  end
end
