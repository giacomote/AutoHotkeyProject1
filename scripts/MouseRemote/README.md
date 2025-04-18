# MouseRemote
A script that lets you use your mouse as a remote control to navigate between slides (previous and next) while using
slideshow applications (such as PowerPoint).

## Using the script
After launching the application, the script remains inactive by default.  
To activate / deactivate the application pressing either `PAUSE` key or using `Ctrl + Alt + P` key combination.

When the script is active, the left mouse button allows you to move to the next slide, while the right mouse button
takes you to the previous slide.

### Usage notes
- The script only switches between the slides only in the specified slideshow applications.
- While the script is running and active, you can use the mouse as usual, except on the specified windows (where
  clicks will navigate between slides).

## Settings and personalization
The slideshow applications can be changed (and can also be multiple).

To personalize the script in a way that it functions with all your favorite slideshow applications, simply add the
applications' process names to the `allowedPrograms` list, at the beginning of the file.