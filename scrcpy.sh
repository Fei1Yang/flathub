#!/usr/bin/bash -e
trap '[ "$ADB_SERVER_STATUS" != "" ] && adb kill-server' EXIT
ADB_SERVER_STATUS="$(adb start-server 2>&1)"
timeout 5 adb wait-for-device || ( zenity --error --text "No Android device detected!\nHave you connected your device and enabled USB debugging?"; exit 1 )
scrcpy $@
