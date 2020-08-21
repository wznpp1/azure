#!/bin/bash
apt-get -y update
apt-get -y install dos2unix
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
service sshd restart
echo root:lzhrwwc1 | chpasswd
curl https://raw.githubusercontent.com/wznpp1/azure/master/get.ubuntu.sh|dos2unix >/root/get.ubuntu.sh
