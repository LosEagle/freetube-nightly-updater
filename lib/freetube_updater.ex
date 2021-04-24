defmodule FreeTubeUpdater do
  def init() do
    config =
      FreeTubeUpdater.Config.get_path
        |> FreeTubeUpdater.Config.parse!

    config
      |> FreeTubeUpdater.DownloadLink.fetch!
      |> FreeTubeUpdater.DownloadLink.pass_to_command(config)
      |> IO.inspect
  end
end
