# FreeTube nightly updater
   
An app that makes updating FreeTube from nightly build artifacts more automated by giving you a direct download link to the newest artifact.
   
There is a simple one-time setup for using this app: 
- open `/rel/freetube_updater/config.json`
- fill in the three values in file
   - **token** is your GitHub personal access token. You can easily generate one in https://github.com/settings/tokens
      - I know this is inconvenient, but it takes just a minute or two and it's necessary, because
      GitHub doesn't allow downloading artifacts for non-logged users.
   - **os** value accepts `win`, `linux` or `mac`
   - **format** value depends on your `os` type
      - `win` accepts `setup` or `portable`
      - `linux` accepts `portable` or `AppImage`
      - `mac` accepts `dmg`
   - **command** (optional) fill this if you want to pass download link to some command line utility or perhaps browser that can be called from terminal.
   You can fill in `chromium` for example and it will automatically download FreeTube with Chromium without you needing to copy paste link to it manually. It also works with command line downloaders such as `wget`. It doesn't support flags yet.
   
- finally, you can start `run` script file or use command `rel/freetube_updater/bin/freetube_updater start`
from the app root directory which will give you a download link for newest release of FreeTube
