#!/bin/bash

$(umount /root/app/google)
/usr/bin/rclone mount google: /root/app/google --allow-non-empty
