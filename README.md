# FreeTube nightly updater
   
An app that makes updating FreeTube from nightly build artifacts more automated.
   
There is a simple one-time setup for using this app: 
- copy `config.sample.json` to `config.json` in `/rel/freetube_updater/config`
- fill in the three values in file
   - token is your GitHub personal access token. You can easily generate one in https://github.com/settings/tokens
      - I know this is inconvenient, but it takes just a minute or two and it's necessary, because
      GitHub doesn't allow downloading artifacts for non-logged users.
   - os value accepts `win`, `linux` or `mac`
   - format value depends on your `os` type
      - `win` accepts `setup` or `portable`
      - `linux` accepts `portable` or `AppImage`
      - `mac` accepts `dmg`
   
- finally, you can start `run` script file or use command `rel/freetube_updater/bin/freetube_updater start`
from the app root directory which will give you a download link for newest release of FreeTube