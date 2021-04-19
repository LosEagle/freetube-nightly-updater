defmodule FreeTubeUpdater do
  def get_download_link() do
    nightly_artifact_url = "https://api.github.com/repos/freetubeapp/freetube/actions/artifacts"

    config =
      FreeTubeUpdater.Config.get_path
        |> FreeTubeUpdater.Config.parse!;

    nightly_artifacts =
      nightly_artifact_url
        |> FreeTubeUpdater.GithubApiHandler.send_authenticated_request(config["token"])
        |> FreeTubeUpdater.GithubApiHandler.get_response_body()
        |> get_in(["artifacts"])

    download_link =
      nightly_artifacts
        |> FreeTubeUpdater.ArtifactParser.get_artifact(config["os"], config["format"])
        |> get_in(["archive_download_url"])
        |> FreeTubeUpdater.GithubApiHandler.send_authenticated_request(config["token"])
        |> FreeTubeUpdater.GithubApiHandler.get_response_headers()
        |> Enum.filter(fn {key, _value} -> key === "Location" end)
        |> Enum.at(0)
        |> Tuple.to_list()
        |> Enum.at(1)

    {":ok", download_link}
  end
end
