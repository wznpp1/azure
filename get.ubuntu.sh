#!/bin/bash

apt-get -y update && apt-get install -y curl unzip

#v2ray
curl -s -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash -
curl -s -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh | bash -

#nodejs
curl -sL https://deb.nodesource.com/setup_lts.x | bash -
apt-get -y update && apt-get install -y nodejs fuse supervisor transmission-daemon

echo -e "1"|bash <(curl -s -L https://github.com/ronggang/transmission-web-control/raw/master/release/install-tr-control-cn.sh)

npm install -g whistle whistle.script

#rclone
curl https://rclone.org/install.sh | sudo bash
mkdir -p /root/downloads

rm -rf /root/.WhistleAppData
rm -rf /root/.config/rclone/rclone.conf
mkdir -p /root/.config/rclone/

cd /root/
git clone https://gitee.com/J92Z53/wznpp2.git
mv wznpp2/app/ /root/
rm -rf //usr/local/etc/v2ray/config.json
ln -s /root/wznpp2/v2ray.json /usr/local/etc/v2ray/config.json
ln -s /root/app/rclone/rclone.conf /root/.config/rclone/rclone.conf
ln -s /root/app/whistle/WhistleAppData /root/.WhistleAppData

#supervisor
systemctl stop supervisor.service
rm -rf /etc/supervisor/supervisord.conf
ln -s /root/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
systemctl restart supervisor.service
systemctl enable supervisor.service

service transmission-daemon stop
rm -rf /var/lib/transmission-daemon/info/settings.json
ln -s /root/wznpp2/transmission.json /var/lib/transmission-daemon/info/settings.json
service transmission-daemon restart

service v2ray restart
/usr/bin/whistle restart
