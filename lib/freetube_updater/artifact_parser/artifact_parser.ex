defmodule FreeTubeUpdater.ArtifactParser do
  def get_artifact(artifacts, os, format) do
    patterns = %{
      win: %{
        setup: ~r/setup-x64.exe/,
        portable: ~r/portable-x64.exe/
      },
      linux: %{
        portable: ~r/linux_portable_x64/,
        appimage: ~r/amd64.AppImage/
      },
      mac: %{
        dmg: ~r/mac.dmg/
      }
    }

    Enum.find(
      artifacts,
      &String.match?(
        &1["name"],
        get_in(patterns, [
          os
          |> String.downcase()
          |> String.to_atom(),
          format
          |> String.downcase()
          |> String.to_atom()
        ])
      )
    )
  end
end
