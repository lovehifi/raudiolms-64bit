#!/bin/sh
sudo rm -f /var/lib/pacman/sync/* && sudo pacman -Syy --noconfirm && sudo pacman -S --noconfirm perl perl-io-socket-ssl perl-net-ssleay perl-uri faad2 libmad mpg123 flac libvorbis

if [ -d "/opt/logitechmediaserver" ]; then
    echo "Stopping Logitech Media Server"
    systemctl stop logitechmediaserver-git.service
fi

if [ -d "/opt/sq" ]; then
    echo "Stopping Squeezelite"
    systemctl stop sq.service
fi

(getent group logitechms &>/dev/null || sudo groupadd -r logitechms >/dev/null) && (getent passwd logitechms &>/dev/null || sudo useradd -r -g logitechms -d /opt/logitechmediaserver -c 'Logitech Media Server' -s /bin/false logitechms >/dev/null) && sudo mkdir -p /opt/logitechmediaserver/{cache,Logs,prefs{,/plugin},Plugins} && sudo touch /opt/logitechmediaserver/Logs/slimserver.log && sudo chown -R logitechms:logitechms /opt/logitechmediaserver && echo 'logitechms ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers

cd /tmp && wget https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/logitechmediaserver-8.5.1-2-aarch64.pkg.tar.xz && pacman -U --noconfirm /tmp/logitechmediaserver-8.5.1-2-aarch64.pkg.tar.xz
