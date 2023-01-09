```
echo | openssl s_client -servername "www.google.com" -connect "www.google.com":443 2>/dev/null | openssl x509 -enddate -noout
```
