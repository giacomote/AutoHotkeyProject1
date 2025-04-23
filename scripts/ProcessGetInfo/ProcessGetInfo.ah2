/*
A script that lets you know process name and window title related to a specific window.

For more details about the script and its functions, please refer to the README.md file.
*/


#Requires AutoHotkey v2.0
#SingleInstance Ignore


; Global variables
scriptName := "ProcessGetInfo"

; Initialization
TraySetIcon("static\ProcessGetInfo.ico")
TrayTip("ProcessGetInfo script is now running!", scriptName, 17)

; Business logic
^#Lbutton:: {
    MouseGetPos(,, &winID)

    try {
        WinActivate(winID)
        
        processName := WinGetProcessName(winID)
        winTitle := WinGetTitle(winID)
    }
    catch TargetError
        TrayTip("Target window not found!", scriptName, 18)
    
    winInfo := Format("{} \\`n{}", processName, winTitle)
    TrayTip(winInfo, scriptName, 17)
}
