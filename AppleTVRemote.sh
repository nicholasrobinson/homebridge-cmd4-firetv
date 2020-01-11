#!/bin/bash

# Script for controlling AppleTV using postlund/pyatv atvremote.
# Usage: bash AppleTVRemote.sh Set <TV_COMMANDS> On true

if [ "$1" = "Get" ]; then
   # Stateless switch is always off
   echo "0"
   exit 0
fi

if [ "$1" = "Set" ]; then
   if [ "$3" = "On" ]; then
      if [ "$4" = "true" ]; then
         # Execute send_dmap_commands.py
         ./send_dmap_commands.py "Apple TV" "192.168.1.23" "00000000-1070-b195-9885-070543684b54" "$2"
         exit $?
      else
         # There is no turning off a command
         exit 0
      fi
   fi
fi

exit -1

