#!/bin/bash

# add cloudflared config
cd /tmp \
    && mkdir -p /etc/cloudflared \
    && cp -n ./config.yml /etc/cloudflared/ \
    && rm -f ./config.yml

## Piggy-backing on Pihole service ##
sed -i "/^lighttpd /i start-stop-daemon --start --background --name cloudflared --chdir \/config --exec \/usr\/local\/bin\/cloudflared -- --config \/config\/cloudflared.yml" /etc/s6-overlay/s6-rc.d/lighttpd/run
sed -i "/^killall -9 lighttpd/i killall cloudflared" /etc/s6-overlay/s6-rc.d/lighttpd/finish
