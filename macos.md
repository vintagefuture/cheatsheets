# macos-cheatsheet

A list of very useful commands I can never remember!

## Flush DNS cache
```
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

## Check if port is open on a remote server
```
nc -vz $SERVER $PORT
```

## To List all available WIFI networks, Run:
```
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s
```

## To connect to any of these available networks, run:
```
networksetup -setairportnetwork en0 <SSID_OF_NETWORK> <PASSWORD>
```

## List ports locally in use
```
sudo lsof -i -n -P | grep TCP
```
(in Linux you could use also `sudo ss -tulpn | grep :443` or `sudo netstat -tulpn | grep :443`)

## Various hash algorithms checks
### SHA1
```
shasum /path/to/file
```
### SHA256
```
shasum -a 256 /path/to/file
```
```
openssl sha256 /path/to/file
```
### SHA512
```
shasum -a 512 /path/to/file
```
```
openssl sha512 /path/to/file
```
### MD5
```
md5 /path/to/file
```
```
openssl md5 /path/to/file
```

### Disable creationg of .DS_Store files for network drives
```
 defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```
Then reboot.

Source: https://www.techrepublic.com/article/how-to-disable-the-creation-of-dsstore-files-for-mac-users-folders/


#### Start TextEdit with new document

```bash
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
```

### Retrieve files from iBooks

```bash
cd ~/Library/Mobile\ Documents/iCloud~com~apple~iBooks/Documents/
```

### Send text to the clipboard

```bash
cat textfile-to-copy | pbcopy
```

### Replace Docker Desktop for Mac

https://dev.to/elliotalexander/how-to-use-docker-without-docker-desktop-on-macos-217m
https://smallsharpsoftwaretools.com/tutorials/use-colima-to-run-docker-containers-on-macos/

### Completely reset Safari

```bash
mv ~/Library/Safari ~/Desktop/Safari-`date +%Y%m%d%H%M%S`;
rm -Rf ~/Library/Cache/*;
rm -Rf ~/Library/Caches/Apple\ -\ Safari\ -\ Safari\ Extensions\ Gallery;
rm -Rf ~/Library/Caches/Metadata/Safari;
rm -Rf ~/Library/Caches/com.apple.Safari;
rm -Rf ~/Library/Caches/com.apple.WebKit.PluginProcess;
rm -Rf ~/Library/Cookies/*;
rm -Rf ~/Library/Cookies/Cookies.binarycookies;
rm -Rf ~/Library/Preferences/Apple\ -\ Safari\ -\ Safari\ Extensions\ Gallery;
rm -Rf ~/Library/Preferences/com.apple.Safari.LSSharedFileList.plist;
rm -Rf ~/Library/Preferences/com.apple.Safari.RSS.plist;
rm -Rf ~/Library/Preferences/com.apple.Safari.plist;
rm -Rf ~/Library/Preferences/com.apple.WebFoundation.plist;
rm -Rf ~/Library/Preferences/com.apple.WebKit.PluginHost.plist;
rm -Rf ~/Library/Preferences/com.apple.WebKit.PluginProcess.plist;
rm -Rf ~/Library/PubSub/Database;
rm -Rf ~/Library/Safari/*;
rm -Rf ~/Library/Safari/Bookmarks.plist;
rm -Rf ~/Library/Saved\ Application\ State/com.apple.Safari.savedState;
```

Source: https://www.makeuseof.com/reset-safari-default-mac/

### Remove delay for showing dock

```
defaults write com.apple.dock autohide-delay -float 0; killall Dock
```
