# FunctionKeys
A script that enhances your keyboard with custom controls and characters not originally supported.

By using defined key combinations, you can send media controls or insert specific characters.

## 💻 Using the script
After launching the application, you are able to use your favorite controls and characters.  
The basic (and originally set) key combinations are the ones indicated below:

| Control / Character | Shortcut  |
|:-------------------:|:---------:|
| Play/Pause          | Alt + K   |
| `~`                 | AltGr + ì |
| `` ` ``             | AltGr + ' |

## 🔧 Settings & personalization
You can add custom key combinations by editing the `data/keys.json` file.

**NOTE**: To use some characters, you may need to use specific scancodes (`SCxxxx`) for your keyboard layout.

**NOTE**: After updating the `data/keys.json` file, reload the key combinations by pressing `Ctrl + Alt + R`.

### Usage notes
- The script can be launched in a silent mode (without sending the notification at startup) using `-s` or `--silent`
  options.
- If you update the `data/keys.json` file, the new hotkeys will not be created until the you press the `Ctrl + Alt + R`
  key combination.