# Lookup number of requests by IP
```
fields @timestamp, @message
  | parse @message /(?<@ip>([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})[.]*)/
  | stats count() as requestCount by @ip
  | sort requestCount desc
```
