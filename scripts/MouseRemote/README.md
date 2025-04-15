# MouseRemote
A script that lets you use your mouse as a remote control to navigate between slides (previous and next) while using
slideshow applications (such as PowerPoint).

## Using the script
After launching the application, the script remains inactive by default. You can activate (or deactivate) it by
pressing the `PAUSE` key on your keyboard.

When the script is active, the left mouse button allows you to move to the next slide, while the right mouse button
takes you to the previous slide.

### Usage notes
1. The script only works in the specified slideshow applications.
2. While the script is running and active, you cannot use your mouse to clicks and drag and drop operations (to do so,
   you have to pause the script).

## Settings and personalization
The slideshow applications can be changed (and can also be multiple).

To personalize the script in a way that it functions with all your favorite slideshow applications, simply add the
applications' process names to the `programs` list, at the beginning of the file.