#!/bin/sh

if [ -d "/opt/logitechmediaserver-git" ]; then
    echo "Stopping Logitech Media Server"
    systemctl stop logitechmediaserver-git.service
fi

if [ -d "/opt/sq" ]; then
    echo "Stopping Squeezelite"
    systemctl stop sq.service
fi

if [ -e /root/logitechmediaserver* ]; then
    echo "Removing /root/logitechmediaserver*"
    rm -f /root/logitechmediaserver*
fi

if [ -e /root/sq64* ]; then
    echo "Removing /root/logitechmediaserver*"
    rm -f /root/sq64*
fi

echo "Install Lib"

rm -f /var/lib/pacman/sync/*
pacman -Syy --noconfirm
pacman -S --noconfirm perl
pacman -S --noconfirm perl-io-socket-ssl
pacman -S --noconfirm perl-net-ssleay
pacman -S --noconfirm perl-uri
pacman -S --noconfirm faad2
pacman -S --noconfirm libmad
pacman -S --noconfirm mpg123
pacman -S --noconfirm flac libvorbis

echo "Add user"
getent group logitechms &>/dev/null || groupadd -r logitechms >/dev/null
getent passwd logitechms &>/dev/null || useradd -r -g logitechms -d /opt/logitechmediaserver-git -c 'Logitech Media Server' -s /bin/false logitechms >/dev/null
mkdir -p /opt/logitechmediaserver-git/{cache,Logs,prefs{,/plugin},Plugins}
touch /opt/logitechmediaserver-git/Logs/slimserver.log
chown -R logitechms:logitechms /opt/logitechmediaserver-git
echo 'logitechms ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers


echo "Download LMS"
wget https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/logitechmediaserver-64.pkg.tar.xz


echo "Install LMS"
pacman -U --noconfirm logitechmediaserver-64.pkg.tar.xz
systemctl daemon-reload
systemctl enable logitechmediaserver-git.service
systemctl restart logitechmediaserver-git.service

echo "Download Squeezelite and Install"
wget https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/sq64.tgz
tar -xzf sq64.tgz --overwrite -C /opt/

echo "Creating systemd unit /etc/systemd/system/sq.service"
echo "[Unit]
Description=SQ Player
After=local-fs.target remote-fs.target nss-lookup.target network.target

[Service]
Type=simple
#WorkingDirectory=/opt/sq
Environment=LD_LIBRARY_PATH=/opt/sq/lib64
ExecStart=/opt/sq/squeezelite64 -o default -n SQ64-rAudio -s 127.0.0.1 -m 00:00:00:00:00:00
Restart=always

[Install]
WantedBy=multi-user.target" > /opt/sq/sq.service || { echo "Creating systemd unit /opt/sq/sq.service failed"; exit 1; }

ln -fs /opt/sq/sq.service /etc/systemd/system/sq.service
chmod -R 777 /etc/systemd/system/sq.service

hostname=$(hostname)
replacement="http://${hostname}"
if [ -f "/srv/http/assets/js/main.js" ]; then
sed -i "s|https://github.com/rern/rAudio/discussions|${replacement}:9000|g" /srv/http/assets/js/main.js
echo "Completed."
else
echo "File not found. Skipping..."
fi

#echo "Do you want to Active Squeezelite? (Yes/No)"
#read answer_sq
#if [ "$answer_sq" = "Yes" ]; then
    systemctl daemon-reload
    systemctl enable sq.service
    systemctl restart sq.service
    echo "Finished"
    systemctl status sq.service
#fi
echo "Finished"
systemctl status logitechmediaserver-git.service

