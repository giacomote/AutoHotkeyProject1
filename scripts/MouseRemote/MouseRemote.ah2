/*
A script that lets you use your mouse as a remote control to navigate between slides (previous and next) while using
slideshow applications (such as PowerPoint).

For more details about the script, its functions and the ability of personalizing it to your preferences, please refer
to the README.md file.
*/


#Requires AutoHotkey v2.0

#SingleInstance Ignore

#Include ..\..\utils\list_methods.ah2


; Global variables
allowedPrograms := ["POWERPNT.EXE"]

scriptName := "MouseRemote"
paused := true

; Initialization
TraySetIcon("static\MouseRemote_pause.ico")

if (A_Args.Length = 0 or (A_Args[1] != "-s" and A_Args[1] != "--silent"))
    TrayTip("MouseRemote script is now running!", scriptName, 17)

; Pause toggle
PauseToggle() {
    global paused

    if (paused) {
        paused := false
        TraySetIcon("static\MouseRemote.ico")
        TrayTip("Remote mode activated!", scriptName, 17)
    }
    else {
        paused := true
        TraySetIcon("static\MouseRemote_pause.ico")
        TrayTip("Remote mode deactivated!", scriptName, 17)
    }
}

Pause:: {
    PauseToggle()
}

^!P:: {
    PauseToggle()
}

; Useful functions
WindowCheck() {
    activeProcess := WinGetProcessName("A")
    return ListMethods.ObjectInList(activeProcess, allowedPrograms)
}

MouseOverRightWindow() {
    MouseGetPos(,, &winID)
    winTitle := WinGetProcessName(winID)
    return ListMethods.ObjectInList(winTitle, allowedPrograms)
}

; Business logic
#HotIf (!paused and WindowCheck() and MouseOverRightWindow())

LButton:: Send("{Right}")
RButton:: Send("{Left}")

#HotIf
