defmodule FreeTubeUpdater.Config do
  def parse!(path) do
    File.read!(path)
    |> Poison.decode!
  end
end
