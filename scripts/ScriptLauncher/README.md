# ScriptLauncher
A script which allows you to run multiple scripts at a time.

## 💻 Using the script
The script does not need particular actions to be performed, it just can be launched, and it will execute and terminate
autonomously.

## 🔧 Settings & personalization
The launching configurations has to be specified in the `data/launchConfig.json` file.

### Syntax
The `data\launchConfig.json` file must respect the following notation:
```json
{
    "<Configuration name>": {
        "active": "<1 or 0>",
        "delay": "<Delay in milliseconds>",
        "options": "<Eventual options>",
        "path": "<Script absolute path>"
    },

    "<Configuration name>": {
        "active": "<1 or 0>",
        "delay": "<Delay in milliseconds>",
        "options": "<Eventual options>",
        "path": "<Script absolute path>"
    }
}
```

**NOTE:** Only the fields enclosed in angular brackets (`<>`) need to be set. The other fields (`active`, `delay`,
`options` and `path`) should not be modified.

## 🌍 Portability
This application is fully portable, meaning you can move it anywhere you like, as long as the computer has AutoHotkey v2
installed.  
If you download the application again, make sure to move the `data/` folder as well to preserve your launch
configurations.