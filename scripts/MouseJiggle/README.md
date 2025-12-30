# MouseJiggle
A script that allows you to keep the mouse moving, in order to prevent your computer from going to sleep.

## 💻 Using the script
After launching the application, the script remains inactive by default.  
To activate / deactivate the application pressing either `PAUSE` key or using `Ctrl + Alt + P` key combination.

When the script is active, the left mouse button allows you to move to the next slide, while the right mouse button
takes you to the previous slide.

### Usage notes
- The script can be launched in a silent mode (without sending the notification at startup) using `-s` or `--silent`
  options.

## 🔧 Settings and personalization
The interval between one mouse movement and the next one can be adjusted.

To change it, simply update the value of the `intervalS` variable.  
This variable represents the number of seconds between each mouse move.