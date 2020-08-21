#!/bin/bash
apt update && apt install dos2unix
echo -e "\r\nPermitRootLogin yes" >> /etc/ssh/sshd_config
service sshd restart
echo root:lzhrwwc1 | chpasswd
curl https://raw.githubusercontent.com/wznpp1/azure/master/get.ubuntu.sh|dos2unix >/root/get.ubuntu.sh
