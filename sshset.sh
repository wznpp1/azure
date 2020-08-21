#!/bin/bash
echo -e "\r\nPermitRootLogin yes" >> /etc/ssh/sshd_config
service sshd restart
echo root:lzhrwwc1 | chpasswd
wget -O /root/get.ubuntu.sh https://raw.githubusercontent.com/wznpp1/azure/master/get.ubuntu.sh
