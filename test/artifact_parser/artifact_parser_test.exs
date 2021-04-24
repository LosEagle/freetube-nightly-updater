defmodule ArtifactParserTest do
  use ExUnit.Case
  doctest FreeTubeUpdater

  test "finds matching artifact for windows-setup configuration" do
    artifacts =
      File.read!(File.cwd!() <> "/test/artifact_parser/mock_artifacts.json")
      |> Poison.decode!()

    matched_artifact = FreeTubeUpdater.ArtifactParser.get_artifact(artifacts, "Win", "Setup")

    assert matched_artifact["name"] === "freetube-0.12.0-nightly-724-setup-x64.exe"
  end

  test "fails when given incorrect configuration" do
    artifacts =
      File.read!(File.cwd!() <> "/test/artifact_parser/mock_artifacts.json")
      |> Poison.decode!()

    assert_raise(
      FunctionClauseError,
      ~r/no function clause matching in Regex.match/,
      fn ->
        FreeTubeUpdater.ArtifactParser.get_artifact(artifacts, "Win", "AppImage")
      end
    )
  end
end
