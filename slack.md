# Use python to send a message via webhook (legacy custom integrations)
```
#!/usr/bin/env python3

import requests
# put here your webhook_url obtained from the steps above
webhook_url = "https://hooks.slack.com/services/T01ERXXXXXX/B020XXXXXXX/rzrCkTvsXXXXXXXXXX"

payload = {
    "channel": "#random",
    "username": "I AM A BOT",
    "text": "This is test message.",
    "icon_emoji": ":monkey:"
}
requests.post(webhook_url, data=json.dumps(payload))
```
