#Requires AutoHotkey v2.0

#Include ..\..\libraries\JXON_ahk2\_JXON.ahk
#Include ..\..\utils\map_methods.ah2


; Global variables
scriptName := "AutoInsertText"

inputsFile := "data\inputs.json"

; Initialization
TraySetIcon("static\AutoInsertText.ico")
TrayTip("AutoInsertText script is now running!", scriptName, 17)

pathElements := StrSplit(inputsFile, ["\", "/"])
pathElements.RemoveAt(-1)
dataDir := ""
for index, value in pathElements {
    dataDir .= value . "\"
}

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
    inputs := Jxon_Load(&jsonContent)

    try {
        activeProcessName := WinGetProcessName("A")
        activeWinTitle := WinGetTitle("A")
    }
    catch TargetError
        TrayTip("Target window not found!", scriptName, 18)
    

    input := ""

    try
        processInputs := MapMethods.GetKeys(inputs[activeProcessName])
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