#!/bin/sh
sudo rm -f /var/lib/pacman/sync/* && sudo pacman -Syu --noconfirm
(getent group logitechms &>/dev/null || sudo groupadd -r logitechms >/dev/null) && (getent passwd logitechms &>/dev/null || sudo useradd -r -g logitechms -d /opt/logitechmediaserver -c 'Logitech Media Server' -s /bin/false logitechms >/dev/null) && sudo mkdir -p /opt/logitechmediaserver/{cache,Logs,prefs{,/plugin},Plugins} && sudo touch /opt/logitechmediaserver/Logs/slimserver.log && sudo chown -R logitechms:logitechms /opt/logitechmediaserver && echo 'logitechms ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
cd /tmp && wget https://raw.githubusercontent.com/lovehifi/raudiolms-64bit/main/logitechmediaserver-8.5.1-2-aarch64.pkg.tar.xz && pacman -U --noconfirm /tmp/logitechmediaserver-8.5.1-2-aarch64.pkg.tar.xz
sudo pacman -S --noconfirm perl perl-cgi perl-dbi perl-digest-sha1 perl-html-parser perl-json perl-libwww perl-lwp-protocol-https perl-net-ssleay perl-test-pod perl-test-warn perl-xml-parser
sudo systemctl daemon-reload && sudo systemctl enable logitechmediaserver.service && sudo systemctl restart logitechmediaserver.service && sudo systemctl status logitechmediaserver.service
