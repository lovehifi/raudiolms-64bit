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
tar xzvf /tmp/lyrionmusicserver.tar.gz -C /tmp/ --overwrite
mkdir -p /home/pi
mv /tmp/home/pi/lyrionmusicserver /home/pi/


