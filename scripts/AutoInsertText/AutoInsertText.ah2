/*
A script that lets you insert fixed texts with just a single click.

For more details about the script, its functions and the ability of personalizing it to your preferences, please refer
to the README.md file.
*/


#Requires AutoHotkey v2.0

#SingleInstance Ignore

#Include ..\..\libraries\JXON_ahk2\_JXON.ahk
#Include ..\..\utils\file_methods.ah2
#Include ..\..\utils\map_methods.ah2


; Global variables
scriptName := "AutoInsertText"
inputsFile := "data\inputs.json"

; Initialization
TraySetIcon("static\AutoInsertText.ico")

if (A_Args.Length = 0 or (A_Args[1] != "-s" and A_Args[1] != "--silent"))
    TrayTip("AutoInsertText script is now running!", scriptName, 17)

dataDir := FileMethods.GetParentDir(inputsFile)
if (!FileExist(dataDir)) {
    DirCreate(dataDir)
}

if (!FileExist(inputsFile)) {
    initialContent := Map("firefox.exe", Map("Any", "https://github.com/giacomote/AutoHotkeyProject1"))
    jsonContent := Jxon_Dump(initialContent, 4)
    FileAppend(jsonContent, inputsFile)
}

; Business logic
InsertText() {
    jsonContent := FileRead(inputsFile)

    try inputs := Jxon_Load(&jsonContent)
    catch {
        TrayTip("[inputs.json] Decoding error. Possible wrong syntax in the file.", scriptName, 3)
        return
    }

    try {
        activeProcessName := WinGetProcessName("A")
        activeWinTitle := WinGetTitle("A")
    }
    catch TargetError {
        TrayTip("Target window not found!", scriptName, 18)
        return
    }
    
    input := ""

    try processInputs := MapMethods.GetKeys(inputs[activeProcessName])
    catch UnsetItemError
        return

    if (processInputs[1] = "Any") {
        input := inputs[activeProcessName]["Any"]
    }
    else {
        for subtext in processInputs {
            if InStr(activeWinTitle, subtext, "On") {
                input := inputs[activeProcessName][subtext]
                break
            }
        }
    }

    SendText(input)
}

+WheelUp:: InsertText()
^Ins:: InsertText()