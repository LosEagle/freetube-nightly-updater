defmodule FreeTubeUpdater.Config do
  @env Mix.env()

  def env, do: @env

  def get_path do
    case FreeTubeUpdater.Config.env() do
      :dev -> File.cwd!() <> "/config/config.json"
      :prod -> File.cwd!() <> "/rel/freetube_updater/config/config.json"
    end
  end

  def parse!(path) do
    File.read!(path)
    |> Poison.decode!()
  end
end
