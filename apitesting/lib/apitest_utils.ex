defmodule   ApitestUtils do
  import HTTPoison
  require HTTPoison

  # This function makes a GET request to the API endpoint
  # Parameters:
  #       - url(String) - The URL of the API endpoint to make the request to
  #Returns:
  #         respose body content
  def doGet(url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
    body
  end

# This function makes a GET request to the API endpoint
  # Parameters:
  #       - url(String) - The URL of the API endpoint to make the request to
  #Returns:
  #         status_code is in interger
  #         respose body content
  @spec get(String.t()) :: {:ok, integer, String.t()}
  def get(url) do
    {:ok, %HTTPoison.Response{status_code: status_code, body: body}} = HTTPoison.get(url)
      {:ok, status_code, body}
  end


# This function makes a GET request to the API endpoint
  # Parameters:
  #       - url(String) - The URL of the API endpoint to make the request to
  #       - Query_Parameters
  #Returns:
  #         status_code is in interger
  #         respose body content
  @spec get(String.t()) :: {:ok, integer, String.t()}
  def get(url, params \\ {} ) do
    {:ok, %HTTPoison.Response{status_code: status_code, body: body}} = HTTPoison.get(url, params)
      {:ok, status_code, body}
  end


# This function makes a GET request to the API endpoint
  # Parameters:
  #       - url(String) - The URL of the API endpoint to make the request to
  #       - Header
  #       - Query_Parameters
  #Returns:
  #         status_code is in interger
  #         respose body content
  #         response headers
 # @spec get(String.t()) :: {:ok, integer, String.t(),String.t()}
  def get_req(url, headers \\ [] , params \\ {}) do
    {:ok, %HTTPoison.Response{status_code: status_code, body: body, headers: headers}} = HTTPoison.get(url, headers, params)
      {:ok, status_code, body, headers}
  end


  # This function makes a POST request to the API endpoint
  # Parameters:
  #       - url(String) - The URL of the API endpoint to make the request to
  #       - payload
  #Returns:
  #         Success message
  #         respose body content
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


  # This function makes a POST request to the API endpoint
  # Parameters:
  #       - url(String) - The URL of the API endpoint to make the request to
  #       - path of file(file is in jason format)
  #Returns:
  #         Success message
  #         respose body content
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
