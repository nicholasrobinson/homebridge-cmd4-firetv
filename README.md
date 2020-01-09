# Motivation

The homebridge-dacp issue:
https://github.com/grover/homebridge-dacp/issues/51

Prevents AppleTV 3rd generation or ealier from being configured. This script creates a standlone switch to control AppleTV using postlund/pyatv atvremote via Homebridge.

# Example config.json
```
...
    {
        "platform": "Cmd4",
        "name": "Cmd4",
        "accessories": [
            {
                "type": "Switch",
                "displayName": "<TV_COMMAND>",
                "on": "FALSE",
                "name": "MasterBedroomAppleTv_<TV_COMMAND>",
                "state_cmd": "<PATH_TO>/AppleTVRemote.sh",
                "polling": true,
                "interval": 5,
                "timeout": 4000
            }
        ]
   }
...
```
