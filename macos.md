# macos-cheatsheet

A list of very useful commands I can never remember!

## Flush DNS cache
```
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

## Check if port is open on a remote server
```
nc -vz SERVER PORT
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
