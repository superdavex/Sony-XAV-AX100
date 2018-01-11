# Change Startup Logo

Logo requires a 800x480 image.  Any format should work.  If the image is not 800x480 it will resized.

# Added windows batch file version.  
1. Extract all the files in logo.zip to your pc.
2. Run createXAVlogo.bat and follow the prompts.


# Original cygwin version
This release requires cygwin and my modified firmware to be installed. 

1. Install cygwin
2. Extract all the files in logo.zip to your pc.
3. Open a cygwin shell and navigate to the extracted directory.
4. Run ./createXAVlogo.sh and pass the input file.  ex ./createXAVlogo.sh input.jpg
5. Copy usbexecute, flash_erase, and newlogo.img to a usb stick.
6. Insert it into radio, flash will auto start.
7. When unit reboots remove usb stick. New logo should now display.
8. Remove copied files form usbtick.




#SD