/*
A script that adds common controls for keyboards that lack of dedicated function keys.

For more details about the script and its functions, please refer to the README.md file.
*/


#Requires AutoHotkey v2.0

#SingleInstance Ignore


; Initialization
TraySetIcon("static/FunctionKeys.ico")

if (A_Args.Length = 0 or (A_Args[1] != "-s" and A_Args[1] != "--silent"))
    TrayTip("FunctionKeys script is now running!", "FunctionKeys", 17)

; Business logic
!k:: Send("{Media_Play_Pause}")