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

Once the file is updated, the shortcuts are automatically reloaded within one second.

**NOTE**: To use some characters, you may need to use specific scancodes (`SCxxxx`) for your keyboard layout.  
**NOTE**: You can manually reload shortcuts from the `data/keys.json` file at any time by pressing `Ctrl + Alt + R`.

### Usage notes
- The script can be launched in a silent mode (without sending the notification at startup) using `-s` or `--silent`
  options.