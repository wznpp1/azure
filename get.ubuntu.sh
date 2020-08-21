#!/bin/bash

apt-get -y update && apt-get install -y curl unzip

#v2ray
curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh | bash

#nodejs
curl https://deb.nodesource.com/setup_lts.x | bash
apt-get -y update && apt-get install -y nodejs fuse supervisor transmission-daemon


npm install -g whistle whistle.script

#rclone
curl https://rclone.org/install.sh | bash
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
systemctl stop transmission-daemon
systemctl stop supervisor.service
rm -rf /etc/supervisor/supervisord.conf
ln -s /root/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
systemctl restart supervisor.service
systemctl enable supervisor.service

service transmission-daemon stop
echo -e "1"| bash <(curl https://raw.githubusercontent.com/ronggang/transmission-web-control/master/release/install-tr-control-cn.sh)
rm -rf /var/lib/transmission-daemon/info/settings.json
ln -s /root/wznpp2/transmission.json /var/lib/transmission-daemon/info/settings.json
service v2ray restart
/usr/bin/whistle restart