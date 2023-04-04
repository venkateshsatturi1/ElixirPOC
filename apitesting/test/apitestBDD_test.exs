defmodule ApiTestBDDTest do
  use ExSpec
  import HTTPoison

  describe "fetching a user from the API" do
    it "should return the user's first name" do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} =
        HTTPoison.get("https://reqres.in/api/users/2")
      {:ok, data} = Jason.decode(body)
      assert data["data"]["first_name"] == "Janet"
      # expect(data["data"]["first_name"]).to(equal("Janet"))
    end
  end
end
