# mcdapi-app-mod

## Requirements
You need to have the McDonald's app APK file. You can download it in three ways:
1. Using the [Yalp Store](https://github.com/yeriomin/YalpStore/releases) (Preferred)
2. Using an external site like [APK Mirror](https://www.apkmirror.com/apk/mcdonalds-apps/)
3. Using an external site like [Evozi APK Downloader](https://apps.evozi.com/apk-downloader/)

## Setup
### Linux
#### Requirements
* git
* openjdk

### Windows
#### Requirements
1. Enable WSL by following the guide [here](https://aka.ms/wslinstall).
2. Download Debian from the store.
3. Run Debian and run these command: `sudo apt install git default-jdk`

## Patching
Now patch using these commands: (For the URL you can use this: `http://mcdapi-mod-server.herokuapp.com/`)
```bash
git clone https://github.com/giacomoferretti/mcdapi-app-mod
cd mcdapi-app-mod/patch
./patch /mnt/c/Users/[USER]/Downloads/[APK] [URL]
```

## Disclaimer
This repository is against McDonald's ToS.

This repository is not affiliated with McDonald's Corp in any way. "McDonald's" and "McDonald's Logo" are registered trademarks of McDonald's Corp.
