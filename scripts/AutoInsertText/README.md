# AutoInsertText
A script that lets you insert specific texts in specific applications with just one click.

## 💻 Using the script
After launching the script, use one of the following key combinations to insert a text:
- `Shift + MouseWheelUp`
- `Ctrl + Ins`

### Usage notes
- The script can be launched in a silent mode (without sending the notification at startup) using `-s` or `--silent`
  options.

## 🔧 Settings & personalization
The inserted texts are specific to each application and must be set in the `data\inputs.json` file.

### Syntax
The `data\inputs.json` file must respect the following notation:
```json
{
    "<Process name>": {
        "<Window title or a substring of it>": "<Text 1>",
        "<Window title or a substring of it>": "<Text 2>"
    },

    "<Process name>": {
        "<Window title or a substring of it>": "<Text 3>"
    }
}
```

**NOTE 1:** `<Process name>` has to be replaced with the process name of an application (e.g. "Code.exe" for Visual
Studio Code).

**NOTE 2:** `<Window title or a substring of it>` has to be replaced with either one of the following options:
1. The window title (or a possible title that can be assumed by a window of the specified program).
2. A substring of the window title.
3. The word `Any`, to indicate that, for the specified process, the text to insert is always the same, regardless of the
   window title.

**NOTE 3:** The `data\inputs.json` file can be modified at every time and the script does not need to be reloaded.

## 🌍 Portability
This application is fully portable, meaning you can move it anywhere you like, as long as the computer has AutoHotkey v2
installed.  
If you download the application again, make sure to move the `data/` folder as well to preserve your texts.