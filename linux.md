# Linux commands cheatsheet

## Reload a service configuration without restarting the service

```
sudo killall -HUP <service>
```

## Check your public IP address
```
curl checkip.amazonaws.com
curl ifconfig.me
curl icanhazip.com
curl ipecho.net/plain
curl ifconfig.co
```

## Iptables

#### Flush all the rules:
```
sudo iptables -F
sudo iptables -t nat -F
```
#### Port forwarding
```
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2375 -j DNAT --to-destination 127.0.0.1:2375
```
