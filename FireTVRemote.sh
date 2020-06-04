#!/bin/bash

# Script for controlling Amazon FireTV using Android Debug Bridge (ADB).
# Usage: bash FireTVRemote.sh Set <TV_COMMAND> On true

# Path to ADB
ADB_COMMAND="<PATH_TO_ADB>"

if [ "$1" = "Get" ]; then
   # Stateless switch is always off
   echo "0"
   exit 0
fi

if [ "$1" = "Set" ]; then
   if [ "$3" = "On" ]; then
      if [ "$4" = "true" ]; then
         # Execute send_atv_commands.py
         $ADB_COMMAND connect "<IP_ADDRESS>:<PORT>"
         POWERED_OFF=$($ADB_COMMAND shell dumpsys power | grep 'Display Power' | grep 'state=OFF')
         if [ "$2" != "26" ] || [ "$POWERED_OFF" != "" ]; then
            $ADB_COMMAND shell input keyevent "$2"
         else
            $ADB_COMMAND shell input keyevent 23
         fi
         exit $?
      else
         # There is no turning off a command
         exit 0
      fi
   fi
fi

exit -1
