/*
A script that allows you to keep the mouse moving, in order to prevent your computer from going to sleep.

For more details about the script and the ability of personalizing it to your preferences, please refer to the
README.md file.
*/

#Requires AutoHotkey v2.0

#SingleInstance Ignore

; Global variables
intervalS := 300

scriptName := "MouseJiggle"
paused := true

; Initialization
TraySetIcon("static\MouseJiggle_pause.ico")

if (A_Args.Length = 0 or (A_Args[1] != "-s" and A_Args[1] != "--silent"))
    TrayTip("MouseJiggle script is now running!", scriptName, 17)

; Pause toggle
PauseToggle() {
    global paused

    if (paused) {
        paused := false
        TraySetIcon("static\MouseJiggle.ico")
        TrayTip("Jiggling enabled!", scriptName, 17)
    }
    else {
        paused := true
        TraySetIcon("static\MouseJiggle_pause.ico")
        TrayTip("Jiggling disabled!", scriptName, 17)
    }
}

Pause:: {
    PauseToggle()
}

^!P:: {
    PauseToggle()
}

; Useful functions
MoveMouse() {
    global paused
    
    if (!paused) {
        MouseMove(1, 1, , "R")
        MouseMove(-1, -1, , "R")
    }
}

; Business logic
SetTimer(() => MoveMouse(), intervalS * 1000)