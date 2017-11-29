# Caution disable firmware

This update contains modified runtime_cfg, rootfs, and spapp partitions.<br>
runtime_cfg enables the gpio_LECD_en variable.  As long as the xboot and uboot partitions are intact this should allow a recovery by connecting UART 0.<br><br>
rootfs modifies the usb_action script.  When a usb stick is inserted if there is a file named usbexecute present at the root directoy it will execute as a script.<br><br>
spapp modifies the launcher.sh script.  It adds a line that does a dbus-send on the touchEvent method.  This clears the caution screen.<br><br>
<br>
<strong>:warning:This is modifying the factory firmware. If something goes wrong it could brick your unit.:warning:</strong><br><br>

<strong>As this is not a full update you must be on firmware version 1.02.06.0</strong><br><br>

You accept full respisbility if you install it for the potential bricking and for not having the caution screen.<br><br> The first thing the update does is enable the gpio_LECD_en variable so you should be able to recover with the serial console if something did go wrong.  If the update does not finish it will continually reboot to the update screen.  This also enables any update script to be run that could correct the issue.  When installing the update once it reboots the progress screen will go blank.  Just let it finish.  It takes a few minutes and will auto reboot when done.  All files in the update folder must be present in the update folder on the USB drive.


