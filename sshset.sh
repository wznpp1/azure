#!/bin/bash
apt-get -y update
apt-get -y install tofrodos
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
service sshd restart
echo root:lzhrwwc1 | chpasswd
curl https://raw.githubusercontent.com/wznpp1/azure/master/get.ubuntu.sh|todos >/root/get.ubuntu.sh
