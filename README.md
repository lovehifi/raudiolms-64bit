# LMS and Squeezelite (64bit) for rAudio (Arch Linux)
Pi 4
------------------------
Install 
> wget -O - https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/install-archlinux.sh | sh

----------------------
After the installation is complete, you can modify the DAC configuration in this file: /root/tidal-connect-docker/Docker/entrypoint.sh. However, the --playback-device "default" is set by rAudio, meaning rAudio is responsible for setting up the Sound Card, and Tidal Connect operates based on it with the value being "default."

You can edit and change the DNS in this file: nano /root/tidal-connect-docker/Docker/.env.
>
-------------------


>
[LMS and Squeezelite (32bit) for rAudio (Arch Linux) Pi 2, Pi 3](https://github.com/lovehifi/raudiolms-32bit)

----------------------
>
### [Why rAudio-LMS ?](https://github.com/lovehifi/raudiolms-32bit/wiki/Why-rAudio%E2%80%90LMS%3F) 
----------------------
>
