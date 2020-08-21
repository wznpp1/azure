#!/bin/bash

echo -e "\r\nPermitRootLogin yes">> /etc/ssh/sshd_config
service sshd restart

echo root:lzhrwwc1 | chpasswd
