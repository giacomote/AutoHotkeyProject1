#Requires AutoHotkey v2.0

; Initialization
TraySetIcon("static/WheelSetVolume.ico")
TrayTip("WheelSetVolume script is now running!", "WheelSetVolume", 17)

; Business logic
#WheelUp:: Send("{Volume_Up}")
#WheelDown:: Send("{Volume_Down}")
#MButton:: Send("{Volume_Mute}")