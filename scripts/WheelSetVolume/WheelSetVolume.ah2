/*
A script that lets you use your mouse wheel to control the volume.

For more details about the script and its functions, please refer to the README.md file.
*/


#Requires AutoHotkey v2.0

#SingleInstance Ignore


; Initialization
TraySetIcon("static/WheelSetVolume.ico")
TrayTip("WheelSetVolume script is now running!", "WheelSetVolume", 17)

; Business logic
#WheelUp:: Send("{Volume_Up}")
#WheelDown:: Send("{Volume_Down}")
#MButton:: Send("{Volume_Mute}")