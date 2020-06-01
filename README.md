# Motivation

I haven't seen a good solution for integrating Amazon FireTV with Homebridge. I decided to adapt https://github.com/nicholasrobinson/homebridge-cmd4-atvremote to send commands using Android Debug Bridge (ADB).

# Example config.json

Note: `26` in the `displayName` field below indicates `POWER`.

```
...
    {
        "platform": "Cmd4",
        "name": "Cmd4",
        "accessories": [
            {
                "type": "Switch",
                "displayName": "26",
                "on": "FALSE",
                "name": "FireTV_power",
                "state_cmd": "/root/.homebridge/Cmd4Scripts/FireTVRemote.sh",
                "polling": true,
                "interval": 5,
                "timeout": 60000
            }
        ]
   }
...
```

# Example FireTVRemote.sh

You will need to specify the location of your ADB executable:
```
ADB_COMMAND="<PATH_TO_ADB>"
```
to:
```
ADB_COMMAND="/Users/nicholasrobinson/Downloads/platform-tools/adb"
```

You will need to change the following line:
```
$ADB_COMMAND connect "<IP_ADDRESS>:<PORT>"
```
to:
```
./send_atv_commands.py "192.168.1.231:5555"
```

# Useful key codes

```
HOME = 3
CENTER = 23
VOLUME_UP = 24
VOLUME_DOWN = 25
POWER = 26
SLEEP = 223
PLAY_PAUSE = 85
NEXT = 87
PREVIOUS = 88
PLAY = 126
PAUSE = 127
UP = 19
DOWN = 20
LEFT = 21
RIGHT = 22
ENTER = 66
SPACE = 62
BACK = 4
MENU = 1
KEY_0 = 7
KEY_1 = 8
KEY_2 = 9
KEY_3 = 10
KEY_4 = 11
KEY_5 = 12
KEY_6 = 13
KEY_7 = 14
KEY_8 = 15
KEY_9 = 16
KEY_A = 29
KEY_B = 30
KEY_C = 31
KEY_D = 32
KEY_E = 33
KEY_F = 34
KEY_G = 35
KEY_H = 36
KEY_I = 37
KEY_J = 38
KEY_K = 39
KEY_L = 40
KEY_M = 41
KEY_N = 42
KEY_O = 43
KEY_P = 44
KEY_Q = 45
KEY_R = 46
KEY_S = 47
KEY_T = 48
KEY_U = 49
KEY_V = 50
KEY_W = 51
KEY_X = 52
KEY_Y = 53
KEY_Z = 54
```
