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
                "displayName": "left,left,left,sleep,sleep,sleep,sleep,sleep,sleep,top_menu,sleep,menu,sleep,menu,sleep,sleep,down,down,left,left,left,left,right,right,select,sleep,sleep,down,down,select,sleep,select,sleep,select",
                "on": "FALSE",
                "name": "AppleTv_favorite",
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

You will need to change the following line:
```
./send_atv_commands.py "<IP_ADDRESS>" "$2"
```
to:
```
./send_atv_commands.py "10.0.0.1" "$2"
```
