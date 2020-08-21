#!/bin/bash

apt-get -y update && apt-get install -y curl unzip

#v2ray
bash <(curl -s -L https://git.io/v2ray.sh)

#nodejs
curl -sL https://deb.nodesource.com/setup_lts.x | bash -
apt-get -y update 
apt-get install -y nodejs fuse supervisor
npm install -g whistle whistle.script

rm -rf /root/.WhistleAppData
rm -rf /root/.config/rclone/rclone.conf

git clone https://gitee.com/J92Z53/wznpp2.git
mv wznpp2/* /root/
ln -s /root/app/whistle/WhistleAppData /root/.WhistleAppData

#rclone
curl https://rclone.org/install.sh | sudo bash
mkdir -p /root/downloads

#supervisor
systemctl stop supervisor.service
rm -rf /etc/supervisor/supervisord.conf
ln -s /root/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
systemctl restart supervisor.service
systemctl enable supervisor.service

/usr/bin/whistle restart