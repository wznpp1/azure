#!/bin/bash

$(umount /root/app/google)
/usr/bin/rclone mount sharepoint2: /root/app/google --allow-non-empty
