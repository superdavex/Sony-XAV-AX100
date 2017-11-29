# Sony-XAV-AX100

Cortex-A9 ARMv7 Processor<br>
STM8S207CB MCU<br>
U-Boot 2014.04<br>
Linux 3.4.5<br>
Firmware 1.02.06.00<br>
2? USB ports<br>
5 UARTS<br>

<br>
<strong>Partitions:</strong><br>
<tr><td><table>
<tr><td>nand_header</td><td>blockrom0:</td><td>128</td><td>KiB</td></tr>
<tr><td>xboot1</td><td>blockrom1</td><td>128</td><td>KiB</td></tr>
<tr><td>uboot1</td><td>blockrom2:</td><td>1792</td><td>KiB</td></tr>
<tr><td>uboot2</td><td>blockrom3:</td><td>2816</td><td>KiB</td></tr>
<tr><td>env</td><td>blockrom4:</td><td>512</td><td>KiB</td></tr>
<tr><td>env_redund</td><td>blockrom5:</td><td>512</td><td>KiB</td></tr>
<tr><td>ecos</td><td>blockrom6:</td><td>8192</td><td>KiB</td></tr>
<tr><td>kernel</td><td>blockrom7:</td><td>6144</td><td>KiB</td></tr>
<tr><td>rootfs</td><td>blockrom8:</td><td>5760</td><td>KiB</td></tr>
<tr><td>spsdk</td><td>blockrom9:</td><td>54144</td><td>KiB</td></tr>
<tr><td>spapp</td><td>blockrom10:</td><td>53248</td><td>KiB</td></tr>
<tr><td>nvm</td><td>blockrom11:</td><td>51200</td><td>KiB</td></tr>
<tr><td>pq</td><td>blockrom12:</td><td>2048</td><td>KiB</td></tr>
<tr><td>logo</td><td>blockrom13:</td><td>2048</td><td>KiB</td></tr>
<tr><td>tcon</td><td>blockrom14:</td><td>384</td><td>KiB</td></tr>
<tr><td>iop_car</td><td>blockrom15:</td><td>2048</td><td>KiB</td></tr>
<tr><td>runtime_cfg</td><td>blockrom16:</td><td>1024</td><td>KiB</td></tr>
<tr><td>vi</td><td>blockrom17:</td><td>384</td><td>KiB</td></tr>
<tr><td>isp_logo</td><td>blockrom18:</td><td>5120</td><td>KiB</td></tr>
<tr><td>vendordata</td><td>blockrom19:</td><td>256</td><td>KiB</td></tr>
<tr><td>pat_logo</td><td>blockrom20:</td><td>13312</td><td>KiB</td></tr>
<tr><td>version_info</td><td>blockrom21:</td><td>512</td><td>KiB</td></tr>
<tr><td>vd_restore</td><td>blockrom22:</td><td>256</td><td>KiB</td></tr>
<tr><td>userdata</td><td>blockrom23:</td><td>50176</td><td>KiB</td></tr>
</table>

The firmware from Sony is encrypted, but, the firmware loader allows non encrypted images.  The decryption keys are stored in enviroment variables during the update so they can be retreieved and sonys firmware can be decrypted.  The serial console UART 0 and USB 0 are on second board behind the LCD.  The board is clearly labled and easy to solder. At startup U-Boot loads runtime_cfg and the variable gpio_LECD_en controls whether the console is enabled after the intial post message.</br><br>

The built in firmware updater requires the mcu update binary (st16mcu.bin) be present and it's versions the same as the update in order to load the update.  There is a checksum on both files, though the overall checksum in the pack file (CUST_PACK.BIN) is not checked. ISP update can also be entered by settings the first byte of mtdblock19 to 0x70. The data images are standard script images.<br><br>

Sony open source code is avilable at http://oss.sony.net/Products/Linux/Audio/XAV-AX100.html<br>


