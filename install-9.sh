#!/bin/bash
sudo mkdir -p /home/pi/lyrionmusicserver
sudo pacman -S perl-dbi --noconfirm
sudo pacman -S perl-ev --noconfirm
sudo pacman -S perl-json-xs --noconfirm
sudo pacman -S perl-digest-sha1 --noconfirm
sudo pacman -S perl-yaml --noconfirm
sudo pacman -S perl-sub-name --noconfirm
sudo pacman -S cpanminus --noconfirm
sudo pacman -S perl-io-socket-ssl --noconfirm
sudo pacman -S perl-xml-parser --noconfirm
sudo pacman -S perl-html-parser --noconfirm
sudo pacman -S perl-app-cpanminus --noconfirm
cd /tmp
sudo tar xzvf /tmp/lyrionmusicserver.tar.gz -C /tmp/ --overwrite
sudo mkdir -p /home/pi
sudo mv /tmp/home/pi/lyrionmusicserver /home/pi/

sudo bash -c 'cat > /etc/systemd/system/lyrionmusicserver.service << "EOF"
[Unit]
Description=Lyrion Music Server
After=sound.target squeezelite.service

[Service]
User=alarm
Group=alarm
WorkingDirectory=/home/pi/lyrionmusicserver
ExecStart=/usr/bin/perl /home/pi/lyrionmusicserver/slimserver.pl \
  --prefsdir /home/pi/lyrionmusicserver/prefs \
  --cachedir /home/pi/lyrionmusicserver/cache \
  --logdir   /home/pi/lyrionmusicserver/Logs
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

sudo chown alarm:alarm -Rv /home/pi/lyrionmusicserver
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now lyrionmusicserver


