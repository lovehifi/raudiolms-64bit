# LMS and Squeezelite (64bit) for rAudio (Arch Linux)
Pi 4
------------------------
Install 
> wget -O - https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/install-archlinux.sh | sh
---------

### To play DSD via I2S:

1./ Active the DSDPlayer plugin on LMS.
>
2./ Setting File Types on LMS: DFF and DSF formats, select Disable - Not set to Native.
>
3./ Check the sound card number, run this command: 
>
> cat /proc/asound/cards.
>
4./ If the card in use is number 1. Edit and assign 1 to -o hw:1 as follows:
>
> nano /opt/sq/sq.service
>
ExecStart=/opt/sq/squeezelite64 -o hw:1 -n SQ64-rAudio -s 127.0.0.1 -m 00:00:00:00:00:00
>

>
Restart:
>
> systemctl daemon-reload && systemctl restart sq.service
>
> systemctl status sq.service
---------
Option: Update the Squeezelite (1.9.9.1422-1)
> wget -O - https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/update | sh
----------------------



>
### [LMS and Squeezelite (32bit) for rAudio (Arch Linux) Pi 2, Pi 3](https://github.com/lovehifi/raudiolms-32bit)

----------------------
>
### [Why rAudio-LMS ?](https://github.com/lovehifi/raudiolms-32bit/wiki/Why-rAudio%E2%80%90LMS%3F) 
----------------------
>


