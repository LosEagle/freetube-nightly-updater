# FreeTube nightly updater
   
An app that makes updating FreeTube from nightly build artifacts more automated.
   
Usage: 
```
FreeTubeUpdater.get_download_link(personal_access_token, os, format)
```

Supported parameters are as follows:    
os: win, linux, mac   
format:
   - for win:
     - setup, portable   
  - for linux:
     - portable, AppImage
  - for mac:
     - dmg