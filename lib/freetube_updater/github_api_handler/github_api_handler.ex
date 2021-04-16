defmodule FreeTubeUpdater.GithubApiHandler do
  def send_request(url) do
    HTTPoison.get!(url)
  end

  def send_authenticated_request(url, token) do
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]

    HTTPoison.get!(url, headers)
  end

  def get_response_body(response) do
    Poison.decode!(response.body)
  end

  def get_response_headers(response) do
    response.headers
  end
end
