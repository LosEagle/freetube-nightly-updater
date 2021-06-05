defmodule FreeTubeUpdater.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    {status, pid} = FreeTubeUpdater.init()

    System.stop(0)
  end
end
