/*
FunctionKeys — enhance your keyboard with custom shortcuts.

This script adds custom hotkeys that let you send media controls (for example, Play/Pause) or insert specific
characters by pressing defined key combinations.

For usage, configuration, and personalization options, see the accompanying README.md.
*/


#Requires AutoHotkey v2.0

#SingleInstance Ignore

#Include ..\..\libraries\JXON_ahk2\_JXON.ahk
#Include ..\..\utils\file_methods.ah2
#Include ..\..\utils\map_methods.ah2


; Global variables
scriptName := "FunctionKeys"
keysFile := "data\keys.json"
createdHotkeys := []

; Initialization
TraySetIcon("static/FunctionKeys.ico")

if (A_Args.Length = 0 or (A_Args[1] != "-s" and A_Args[1] != "--silent"))
    TrayTip("FunctionKeys script is now running!", scriptName, 17)

dataDir := FileMethods.GetParentDir(keysFile)
if (!FileExist(dataDir)) {
    DirCreate(dataDir)
}

if (!FileExist(keysFile)) {
    initialContent := Map("!k", "{Media_Play_Pause}", "<^>!ì", "~", "<^>!'", "``")
    jsonContent := Jxon_Dump(initialContent, 4)
    FileAppend(jsonContent, keysFile)
}

; Useful functions
LoadKeys() {
    global createdHotkeys

    RemoveHotkeys()
    jsonContent := FileRead(keysFile)
    hotkeys := Jxon_Load(&jsonContent)

    for keyCombo, toSend in hotkeys {
        createdHotkeys.Push(keyCombo)
        Hotkey(keyCombo, MakeHandler(toSend))
    }

    return
}

MakeHandler(sendValue) {
    return (*) => (
        InStr(sendValue, "{") ? Send(sendValue) : SendText(sendValue)
    )
}

RemoveHotkeys() {
    global createdHotkeys

    for idx, k in createdHotkeys {
        Hotkey(k, "")
    }
    createdHotkeys := []
}

ReloadKeys() {
    LoadKeys()
    TrayTip("All the keys has now been reloaded!", scriptName, 17)
}

; Business logic
LoadKeys()

^!r:: ReloadKeys()