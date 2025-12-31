# MouseJiggle
A script that allows you to keep the mouse moving, in order to prevent your computer from going to sleep.

## 💻 Using the script
Once launched, the script remains inactive by default.  
To activate or deactivate the script, press the `PAUSE` key or use the `Ctrl + Alt + P` key combination.

When active, the mouse cursor will move slightly at regular intervals.  
The movement is almost imperceptible.

### Usage notes
The script can be launched in a silent mode (without displaying the startup notification) using `-s` or `--silent`
options.

## 🔧 Settings and personalization
The interval between mouse movements can be adjusted.

To change it, simply update the value of the `intervalS` variable.  
This variable represents the number of seconds between each mouse move.

**NOTE**: For the script to work properly, the time set in the `intervalS` variable must be shorter than the screen's
turn-off time.