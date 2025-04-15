/*
A script that lets you use your mouse as a remote control to navigate between slides (previous and next) while using
slideshow applications (such as PowerPoint).

For more details about the script, its functions and the ability of personalizing it to your preferences, please refer
to the README.md file.
*/


#Requires AutoHotkey v2.0
#Include ..\..\utils\list_methods.ah2


; Global variables
programs := ["POWERPNT.EXE"]

scriptName := "MouseRemote"
remoteMode := false

; Initialization
TraySetIcon("static\MouseRemote_pause.ico")
TrayTip("MouseRemote script is now running!", scriptName, 17)

; Pause toggle
Pause:: {
    global scriptName
    global remoteMode

    if (!remoteMode) {
        remoteMode := true
        TraySetIcon("static\MouseRemote.ico")
        TrayTip("Remote mode activated!", scriptName, 17)
    }
    else {
        remoteMode := false
        TraySetIcon("static\MouseRemote_pause.ico")
        TrayTip("Remote mode deactivated!", scriptName, 17)
    }
}

; Business logic
#HotIf remoteMode

LButton:: {
    global programs

    activeProcess := WinGetProcessName("A")
    if (!ListMethods.ObjectInList(activeProcess, programs))
        return

    Send("{Right}")
}
RButton:: {
    global programs

    activeProcess := WinGetProcessName("A")
    if (!ListMethods.ObjectInList(activeProcess, programs))
        return

    Send("{Left}")
}

#HotIf
