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
end


#require Logger

#@spec get(String.t) :: {:ok, integer, String.t} | {:error, String.t}
#def get(url) do
#  case HTTPoison.get(url) do
 #   {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
 #     {:ok, status_code, body}
 #   {:error, %HTTPoison.Error{reason: reason}} ->
 #     Logger.error("Error performing HTTP GET request: #{reason}")
  #    {:error, reason}
 # end
#end
#end
