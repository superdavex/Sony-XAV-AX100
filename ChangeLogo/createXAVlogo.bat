@echo off 
setlocal EnableDelayedExpansion
set "input="
set "outsize="

set /p input=Enter the 800x480 image input file name: 

REM 800 x 480, 32 bit depth, uncompressed. 72dpih 72dpiv
SET outname="newlogo.img"
SET logo_len=1537024

if not exist %input% (
   echo A valid input image is required
   goto failed
)

IF exist %outname% (
    del %outname%
)


REM #shrink/stretch
REM #./convert -compress none -resize 800x480! -verbose -interlace none -depth 8 $input tmpoutput.bgra
REM #scale and add borders
convert -compress none -resize 800x480 -verbose -interlace none -background black -gravity center -depth 8 -extent 800x480 %input% tmpoutput.bgra

IF exist tmpoutput.bgra (

    copy logo.pre %outname%
    type tmpoutput.bgra >> %outname%
    type logo.pad >> %outname%

    convert -compress none -size 800x480! -depth 8 tmpoutput.bgra converted_preview.tiff
    REM #rm tmpoutput.bgra
    echo.
    echo.

    FOR %%A IN (%outname%) DO (
        if /I NOT %%~zA EQU %logo_len% (
            echo Output file size %%~zA does not match correct size %logo_len%, do not use
            goto failed
        )
    )
    echo Image conversion complete.  
    
    set /p usbdrive=Enter the drive letter to copy files to:
    set usbdrive=!usbdrive:~0,1!
    echo !usbdrive!
    
	REM Delete existing files on USB
	if exist "!usbdrive!:\usbexecute" DEL "!usbdrive!:\usbexecute"
    if exist "!usbdrive!:\flash_erase" DEL "!usbdrive!:\flash_erase"
    if exist "!usbdrive!:\newlogo.img" DEL "!usbdrive!:\newlogo.img"
	
	pause
	
    copy usbexecute !usbdrive!:\
    if not exist "!usbdrive!:\usbexecute"  goto failed_to_copy 
   
    copy flash_erase "!usbdrive!:\"
    if not exist "!usbdrive!:\flash_erase" goto failed_to_copy
    
    copy newlogo.img "!usbdrive!:\"
    if not exist "!usbdrive!:\newlogo.img" goto failed_to_copy
    
    echo usbexecute, flash_erase, and newlogo.img have been copied.  Insert usb stick into radio.  Radio will reboot when complete.  Remove the drive as soon as it reboots.
    ECHO Press any key to exit
    PAUSE >NUL
    EXIT /B
    
)    

exit /b

:failed_to_copy
    echo failed to copy file to !usbdrive!
:failed
   echo Image conversion failed



