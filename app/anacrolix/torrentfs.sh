#!/bin/bash

$(umount /root/app/torrentfs/torrentfs)
/root/app/anacrolix/torrentfs  -listenAddr=:8098 -mountDir=/root/app/torrentfs/torrentfs -metainfoDir=/root/app/anacrolix/torrents -downloadDir=/root/downloads