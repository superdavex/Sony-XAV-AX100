#800 x 480, 32 bit depth, uncompressed. 72dpih 72dpiv
input=$1
outname="newlogo.img"
logo_len=1537024

if ! [ -f $input ]
then
    echo "Input file name required"
    exit
fi

if ! [ -f $outname ]
then
    rm $outname
fi
#shrink/stretch
#./convert -compress none -resize 800x480! -verbose -interlace none -depth 8 $input tmpoutput.rgba
#scale and add borders
./convert -compress none -resize 800x480 -verbose -interlace none -background black -gravity center -depth 8 -extent 800x480 $input tmpoutput.rgba

if [ -f tmpoutput.rgba ]
then
    pre="\x50\x41\x52\x54\x50\x70\x17\x00\x10\x00\x00\x00\x20\x00\x00\x00\x6C\x6F\x67\x6F\x2E\x62\x69\x6E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x70\x17\x00\x30\x00\x00\x00\x4F\x47\x4F\x4C\x00\x00\x00\x00\x00\x00\x00\x00\x20\x03\x00\x00\xE0\x01\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
    echo -n -e $pre > $outname
    
    cat tmpoutput.rgba >> $outname
    cat logo.pad >> $outname
   
    ./convert -compress none -size 800x480! -depth 8 tmpoutput.rgba converted_preview.tiff
    #rm tmpoutput.rgba
    outsize=$(stat --printf="%s\n" $outname)
    if ! [ $outsize -eq $logo_len ]
    then    
        echo Output file size $outsize is incorrect, do not use

	else
		echo
		echo
		echo Image conversion complete.  Copy usbexecute, flash_erase, and newlogo.img to a usb flash drive and insert it into the radio.  Device will reboot when complete.  Remove the drive as soon as it reboots.
	fi
    
else
    echo Image conversion failed
fi


