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
