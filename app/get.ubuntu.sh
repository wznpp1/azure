#!/bin/bash

apt-get update && apt-get install -y curl unzip

#v2ray
bash <(curl -s -L https://git.io/v2ray.sh)

#nodejs
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get update
apt-get install -y gcc g++ make nodejs fuse supervisor
npm install -g whistle whistle.script

rm -rf /root/.WhistleAppData
rm -rf /root/.config/rclone/rclone.conf

ln -s /root/app/whistle/WhistleAppData /root/.WhistleAppData
ln -s /root/app/rclone/rclone.conf /root/.config/rclone/rclone.conf

#rclone
curl https://rclone.org/install.sh | sudo bash
mkdir -p /root/downloads

chmod +x /root/app/anacrolix/torrentfs.sh
chmod +x /root/app/anacrolix/torrentfs
#supervisor
systemctl stop supervisor.service
rm -rf /etc/supervisor/supervisord.conf
ln -s /root/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
systemctl restart supervisor.service
systemctl enable supervisor.service

/usr/bin/whistle restart