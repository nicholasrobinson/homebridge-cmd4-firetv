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
                "name": "DmapAppleTv_play",
                "state_cmd": "/root/.homebridge/Cmd4Scripts/DmapAppleTVRemote.sh",
                "polling": true,
                "interval": 5,
                "timeout": 60000
            }
        ]
   }
...
```

# Example DmapAppleTVRemote.sh

```
./send_dmap_or_mrp_commands.py "Master Bedroom TV" "192.168.1.37" "00000000-1070-b195-9885-070543684b54" "$2"
```

# Example config.json using MRP (4th+ generation AppleTV)
```
...
    {
        "platform": "Cmd4",
        "name": "Cmd4",
        "accessories": [
            {
                "type": "Switch",
                "displayName": "select",
                "on": "FALSE",
                "name": "MrpAppleTv_select",
                "state_cmd": "/root/.homebridge/Cmd4Scripts/MrpAppleTVRemote.sh",
                "polling": true,
                "interval": 5,
                "timeout": 60000
            }
        ]
   }
...
```

# Example MrpAppleTVRemote.sh

```
./send_dmap_or_mrp_commands.py "Master Bedroom TV" "192.168.1.37" "" "$2" --port 49831
```
