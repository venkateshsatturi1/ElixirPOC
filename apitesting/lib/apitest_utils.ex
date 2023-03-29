defmodule ApitestUtils do
 import HTTPoison

 def doGet(url) do
  {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
  body
 end
end
