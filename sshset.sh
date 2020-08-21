#!/bin/bash
apt-get update && apt-get install dos2unix
echo "\r\nPermitRootLogin yes" >> /etc/ssh/sshd_config
service sshd restart
echo root:lzhrwwc1 | chpasswd
curl https://raw.githubusercontent.com/wznpp1/azure/master/get.ubuntu.sh|dos2unix >/root/get.ubuntu.sh
