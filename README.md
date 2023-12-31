# LMS and Squeezelite (64bit) for rAudio Pi 4 (Arch Linux)
>
You have an affinity for LMS, enjoy the Material Skin interface, and are particularly accustomed to using LMS/Material Skin on mobile devices. However, there are times when you reminisce about the allure of the audio experience offered by Archphile or Rune Audio on the Arch Linux platform from many years ago. You can now relive that experience with the return of rAudio (Arch Linux). As I understand it, rAudio is a fork or spin-off of Rune Audio (after it ceased development), and I have personally compiled LMS package to make them work seamlessly on rAudio.
>
------------------------
Install 
> wget -O - https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/install-archlinux.sh | sh
---------
After the installation is complete, you can access LMS from your PC or phone using the web address http://ip:9000 or http://raudio:9000
>
Configure Squeezelite option (output, name...) in the /etc/systemd/system/sq.service, sq.sh
>
--------
### To play DSD via I2S DAC:

1./ Active the DSDPlayer plugin on LMS.
>
2./ Setting File Types on LMS: DFF and DSF formats, select Disable - Not set to Native.
>
3./ Check the sound card number, run this command: 
>
> cat /proc/asound/cards
>
Sample: 
**0** [audioinjectorpi]: audioinjector-p - audioinjector-pi-soundcard

>
4./ If the card in use is number 0. Edit and assign 0 to -o hw:0 as follows:
>
> nano /etc/systemd/system/sq.service
>
Sample:
ExecStart=/opt/sq/squeezelite64 -o **hw:0** -n SQ64-rAudio -s 127.0.0.1 -m 00:00:00:00:00:00 -W
>

>
Restart:
>
> systemctl daemon-reload && systemctl restart sq.service
>
> systemctl status sq.service
---------
### Option
>
>
Another solution for Squeezelite, helps you change the card number automatically, which is better for you if you frequently switch DACs (e.g., switching from I2S to USB).
> wget -O - https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/update | sh
>
>
Update the Squeezelite (1.9.9.1422-1)
> wget -O - https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/update-sq | sh
----------------------
>


>
### Tidal Connect for rAudio 64 bit (Pi 4)
https://github.com/lovehifi/tidal-raudio-pi4/
>
----------------------
>
### LMS and Squeezelite (32bit) for rAudio (Arch Linux) Pi 2, Pi 3
>
https://github.com/lovehifi/raudiolms-32bit

----------------------

>
### Why rAudio-LMS ?
>
https://github.com/lovehifi/raudiolms-32bit/wiki/Why-rAudio%E2%80%90LMS%3F
>

----------------------
>
### Tips for using rAudio and LMS
>
https://github.com/lovehifi/addraudio
>
