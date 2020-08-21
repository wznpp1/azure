#!/bin/bash

$(umount /root/app/rclone/mnt)
/usr/bin/rclone mount union: /root/app/rclone/mnt