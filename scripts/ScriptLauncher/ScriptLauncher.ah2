/*
A script that lets you launch multiple scripts at a time.

For more details about the script, its functions and the ability of personalizing it to your preferences, please refer
to the README.md file.
*/


#Requires AutoHotkey v2.0

#SingleInstance Ignore

#Include ..\..\libraries\JXON_ahk2\_JXON.ahk
#Include ..\..\utils\file_methods.ah2


; Global variables
scriptName := "ScriptLauncher"
configFile := "data\launchConfig.json"

; get project dir

; Initialization
TraySetIcon("static\ScriptLauncher.ico")

dataDir := FileMethods.GetParentDir(configFile)
if (!FileExist(dataDir)) {
    DirCreate(dataDir)
}
    
if (!FileExist(configFile)) {
    projectDir := FileMethods.GetProjectDir(".gitignore")
    initialContent := Map(
        "AutoInsertText", Map("active", true, "delay", 0, "options", "-s", "path", projectDir "\scripts\AutoInsertText\AutoInsertText.ah2"),
        "MouseRemote", Map("active", true, "delay", 0, "options", "-s", "path", projectDir "\scripts\MouseRemote\MouseRemote.ah2"),
        "ProcessGetInfo", Map("active", true, "delay", 0, "options", "-s", "path", projectDir "\scripts\ProcessGetInfo\ProcessGetInfo.ah2"),
        "WheelSetVolume", Map("active", true, "delay", 0, "options", "-s", "path", projectDir "\scripts\WheelSetVolume\WheelSetVolume.ah2")
    )
    jsonContent := Jxon_Dump(initialContent, 4)
    OutputDebug(configFile)
    FileAppend(jsonContent, configFile)
}

; Business logic
jsonContent := FileRead(configFile)
launchConfig := Jxon_Load(&jsonContent)

for config in launchConfig {
    try {
        active := launchConfig[config]["active"]
        delay := launchConfig[config]["delay"]
        path := launchConfig[config]["path"]
        options := launchConfig[config]["options"]
    }
    catch
        TrayTip("[launchConfig.json] Invalid format!", scriptName, 3)

    if (active) {
        Sleep(delay)

        command := Format("{} {} {}", A_AhkPath, path, options)
        
        try Run(command)
        catch   
            TrayTip(Format("{}: script not found!", config), scriptName, 3)
    }
}