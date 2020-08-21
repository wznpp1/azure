#!/bin/bash

apt-get -y update && apt-get install -y curl unzip
cd /root/
git clone https://gitee.com/J92Z53/wznpp2.git
mv wznpp2/app/ /root/

#v2ray
curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh | bash
rm -rf //usr/local/etc/v2ray/config.json
ln -s /root/wznpp2/v2ray.json /usr/local/etc/v2ray/config.json
service v2ray restart

#nodejs
curl https://deb.nodesource.com/setup_lts.x | bash
apt-get -y update && apt-get install -y nodejs fuse supervisor transmission-daemon

#whistle
npm install -g whistle whistle.script
rm -rf /root/.WhistleAppData
ln -s /root/app/whistle/WhistleAppData /root/.WhistleAppData
/usr/bin/whistle restart

#rclone
curl https://rclone.org/install.sh | bash
mkdir -p /root/downloads
mkdir -p /root/.config/rclone/
rm -rf /root/.config/rclone/rclone.conf
ln -s /root/app/rclone/rclone.conf /root/.config/rclone/rclone.conf

#supervisor
systemctl stop supervisor.service
rm -rf /etc/supervisor/supervisord.conf
ln -s /root/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
systemctl restart supervisor.service
systemctl enable supervisor.service

#transmission
systemctl stop transmission-daemon
rm -rf /var/lib/transmission-daemon/info/settings.json
mv /root/wznpp2/transmission.json /var/lib/transmission-daemon/info/settings.json
ln /var/lib/transmission-daemon/info/settings.json /root/wznpp2/transmission.json 
echo -e "1"| bash <(curl https://raw.githubusercontent.com/ronggang/transmission-web-control/master/release/install-tr-control-cn.sh)
