# Motivation

The homebridge-dacp issue:
https://github.com/grover/homebridge-dacp/issues/51

Prevents AppleTV 3rd generation or ealier from being configured. This script creates a standlone switch to control AppleTV using postlund/pyatv atvremote via Homebridge.

I liked the simplicity of this solution, so I updated it to support AppleTV 4th+ generation too.

# Example config.json using DMAP (2nd generation AppleTV)
```
...
    {
        "platform": "Cmd4",
        "name": "Cmd4",
        "accessories": [
            {
                "type": "Switch",
                "displayName": "play",
                "on": "FALSE",
                "name": "AppleTv_play",
                "state_cmd": "/root/.homebridge/Cmd4Scripts/AppleTVRemote.sh",
                "polling": true,
                "interval": 5,
                "timeout": 60000
            }
        ]
   }
...
```

# Example AppleTVRemote.sh

```
./send_atv_commands.py "10.0.0.1" "$2"
```
